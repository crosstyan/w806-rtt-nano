#include "serial.h"
#include "wm_it.h"
#include <string.h>

#define RCC ((RCC_TypeDef *)RCC_BASE)
#define UART0_REST_BIT 10
#define UART1_REST_BIT 11
#define UART2_REST_BIT 12
#define UART3_REST_BIT 13
#define UART4_REST_BIT 14
#define UART5_REST_BIT 15
#define UART_HARD_REST(BIT) { (RCC->RST)&=~(1<<BIT);uint32_t i=100000ul;while(i--);(RCC->RST)|=(1<<BIT); }

static uint8_t _uart0_txbuff[UART0_TX_MAX_SIZE];
static uint8_t _uart0_rxbuff[UART0_RX_MAX_SIZE];
static uint8_t _uart1_txbuff[UART1_TX_MAX_SIZE];
static uint8_t _uart1_rxbuff[UART1_RX_MAX_SIZE];
static uint8_t _uart2_txbuff[UART2_TX_MAX_SIZE];
static uint8_t _uart2_rxbuff[UART2_RX_MAX_SIZE];
static uint8_t _uart3_txbuff[UART3_TX_MAX_SIZE];
static uint8_t _uart3_rxbuff[UART3_RX_MAX_SIZE];
static uint8_t _uart4_txbuff[UART4_TX_MAX_SIZE];
static uint8_t _uart4_rxbuff[UART4_RX_MAX_SIZE];
static uint8_t _uart5_txbuff[UART5_TX_MAX_SIZE];
static uint8_t _uart5_rxbuff[UART5_RX_MAX_SIZE];

static uart_def _uart_def_objs[UART_ID_MAX]={ UART_DEF(UART_ID_0,UART0,_uart0_txbuff,UART0_TX_MAX_SIZE,_uart0_rxbuff,UART0_RX_MAX_SIZE),
										      UART_DEF(UART_ID_1,UART1,_uart1_txbuff,UART1_TX_MAX_SIZE,_uart1_rxbuff,UART1_RX_MAX_SIZE),
										      UART_DEF(UART_ID_2,UART2,_uart2_txbuff,UART2_TX_MAX_SIZE,_uart2_rxbuff,UART2_RX_MAX_SIZE),
										      UART_DEF(UART_ID_3,UART3,_uart3_txbuff,UART3_TX_MAX_SIZE,_uart3_rxbuff,UART3_RX_MAX_SIZE),
										      UART_DEF(UART_ID_4,UART4,_uart4_txbuff,UART4_TX_MAX_SIZE,_uart4_rxbuff,UART4_RX_MAX_SIZE),
										      UART_DEF(UART_ID_5,UART5,_uart5_txbuff,UART5_TX_MAX_SIZE,_uart5_rxbuff,UART5_RX_MAX_SIZE)};
											  
#if UART_OS_ENABLE
#include "rtthread.h"
	static struct rt_mutex uart_write_mutex[UART_ID_MAX];
	#define UART_WRITE_ENTER(id)   {rt_mutex_take(&uart_write_mutex[id], RT_WAITING_FOREVER);}
	#define UART_WRITE_RELEASE(id) {rt_mutex_release(&uart_write_mutex[id]);}
#else
	#define UART_WRITE_ENTER(id)   
	#define UART_WRITE_RELEASE(id) 
#endif

static void _uartx_gpio_init(UART_ID id);
static void _uart_hard_init(UART_ID id);
static void _uart_start_msg(UART_ID id);
static uint8_t _uart_send(UART_ID id);

static void _uart_queue_init(UART_ID id);
static void _uart_rx_queue_insert(UART_ID id, uint8_t data);
static uint32_t _uart_rx_queue_inserts(UART_ID id, uint8_t* data, uint32_t size);
static uint8_t _uart_read_tx_queue(UART_ID id, uint8_t* data);
static uint32_t _uart_reads_tx_queue(UART_ID id, uint8_t* data, uint32_t size);

static void _serial_back_test(void);

#define PORT_IS_ENABLE(id)  (_uart_def_objs[id].enable)
#define PORT_IS_DISABLE(id) (!(_uart_def_objs[id].enable))

#define UART_AUTO_TEST_ENABLE 0

/// 初始化系统配置的各个串口
/// 时钟、GPIO、中断等配置
void uart_init(void)
{
	uint8_t i = 0;
	for( ; i<UART_ID_MAX; ++i)
	{
		if(UARTS_DEF_ENABLE&(1<<i))
		{
			_uart_hard_init((UART_ID)i);
			_uart_queue_init((UART_ID)i);			
			uart_open((UART_ID)i);
		}
	}
}

/// 主任务调用
/// 自动读取发送缓存队列中的数据，并通过串口发送
void uart_loop(void)
{
	uint8_t i = 0;
	for( i=0; i<UART_ID_MAX; ++i)
	{
		if(UART_DEF_IS_ENABLE(i) && PORT_IS_ENABLE(i))
		{
			_uart_send((UART_ID)i);
		}
	}

// 串口自动测试代码，串口收数据发数据	
#if UART_AUTO_TEST_ENABLE
	_serial_back_test();
#endif
}

/// 设置波特率
void uart_set_baud(UART_ID id, uint32_t bd)
{
	uint32_t value;
	uint32_t apbclk;
	wm_sys_clk sysclk;
	USART_TypeDef* huart = _uart_def_objs[id].huart; 
	
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return;
	
	_uart_def_objs[id].baud = bd;
	SystemClock_Get(&sysclk);
	apbclk = sysclk.apbclk * 1000000;
    value = (apbclk / (16 * _uart_def_objs[id].baud) - 1) | (((apbclk % (_uart_def_objs[id].baud * 16)) * 16 / ((_uart_def_objs[id].baud * 16))) << 16);
	
	huart->BAUDR = value;
}

/// 上层应用，从接收数据队列中获取串口接收的缓存数据
// read和reads函数不建议在中断处理代码中调用，这样有可能会带来数据不安全访问
int8_t uart_read(UART_ID id, uint8_t* data)
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id)) return 0;
	sq = &(_uart_def_objs[id].rx_queue);
	
	if(static_queue_read(sq, data))
		return -1;
	return 0;
}

uint32_t uart_reads(UART_ID id, uint8_t* data, uint32_t size)
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id)) return 0;
	
	sq = &(_uart_def_objs[id].rx_queue);
	return static_queue_reads(sq, data, size);
}

uint32_t uart_read_data_len(UART_ID id)
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id)) return 0;
	
	sq = &(_uart_def_objs[id].rx_queue);
	return static_queue_len(sq);
}

/// 上层应用，往发送数据队列中写入待发送的数据
// write和writes函数不建议在中断处理代码中调用，这样有可能会带来数据不安全访问
uint8_t uart_write(UART_ID id, uint8_t data)
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return 0;
	
	UART_WRITE_ENTER(id);
	if(id<UART_ID_MAX)
	{
		sq = &(_uart_def_objs[id].tx_queue);
		static_queue_insert(sq, &data);
	}
	UART_WRITE_RELEASE(id);
	return data;
}

uint32_t uart_writes(UART_ID id, uint8_t* data, uint32_t size)
{
	StaticQueue* sq;
	uint32_t ret = 0;
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return 0;
	
	UART_WRITE_ENTER(id);
	sq = &(_uart_def_objs[id].tx_queue);	
	ret = static_queue_inserts(sq, data, size);
	UART_WRITE_RELEASE(id);
	
	return ;
}

// 串口自收发测试
static void _serial_back_test(void)
{
	uint8_t buff[512];
	uint8_t i = 0;
	uint32_t len = 0;
	for( ; i<UART_ID_MAX; ++i)
	{
		if((UARTS_DEF_ENABLE&(1<<i)) == (1<<i))
		{
			len = uart_reads((UART_ID)i, buff, 512);
			if(len>0)
			{
				uart_writes((UART_ID)i, buff, len);
			}
		}
	}
}

/// 中断相关函数
static void uart_itr_rx(UART_ID id)
{
	USART_TypeDef* huart = _uart_def_objs[id].huart;
	if(UART_DEF_IS_DISABLE(id)) return;
	uint8_t count = (huart->FIFOS&(0x3f<<6))>>6;
	while(count--)
	{
		_uart_rx_queue_insert(id, (uint8_t)huart->RDW);
	}
}

static void uart_itr_tx(UART_ID id)
{
	if(UART_DEF_IS_DISABLE(id)) return;
	_uart_def_objs[id].send_valid = 1;	
}

/// 在串口中断函数中调用，中断处理中回调函数
void uart_itr_callback(USART_TypeDef* huart)
{
	uint32_t isr = huart->INTS;
	UART_ID id = UART_ID_MAX;
	uint8_t i = 0;
	huart->INTS |= isr;
	
	for( i=0; i<UART_ID_MAX; ++i)
	{
		if(huart==_uart_def_objs[i].huart)
			id = (UART_ID)i;
	}
	
	if(UART_DEF_IS_ENABLE(id))
	{	
		//0b0101001100
		if(isr&0x014C)
		{
			uart_itr_rx(id);
		}			
		
		if((isr&0x03))
		{
			uart_itr_tx(id);
		}
	}
}

/// 往串口fifo中写入数据
static uint8_t _uart_send(UART_ID id)
{
	uint8_t data[32];
	uint8_t size;
	uint8_t i = 0;
	uint8_t len = 0;
	USART_TypeDef* huart = _uart_def_objs[id].huart;
	if(UART_DEF_IS_DISABLE(id)) return 0;
	if(_uart_def_objs[id].send_valid)
	{
		len = 32-(uint8_t)(huart->FIFOS&0x3f);
		if(len>0 && len<=32)
		{
			size = _uart_reads_tx_queue(id, data, len);
			if(size>0) _uart_def_objs[id].send_valid = 0;
			else return 0;
			for( ; i<size; ++i)
				huart->TDW = (uint8_t)data[i];
		}	
	}
	return len;
}

/// 初始化uart对应的GPIO，并设置中断优先级
/// W806芯片各串口引脚分布图
/// uart0: TX-PB19, RX-PB20
/// uart1：TX-PB6,  RX-PB7
/// uart2: TX-PA2,  RX-PA3
/// uart3：TX-PA5， RX-PA6
/// uart4：TX-PA8， RX-PA9
/// uart5：TX-PA12， RX-PA13
static void _uartx_gpio_init(UART_ID id)
{
	if(UART_DEF_IS_DISABLE(id)) return;
	__HAL_RCC_GPIO_CLK_ENABLE();
	
	switch(id)
	{
		case UART_ID_0:
		{
			__HAL_RCC_UART0_CLK_ENABLE();
			UART_HARD_REST(UART0_REST_BIT);
			
			SET_BIT(GPIOB->DIR, GPIO_PIN_19);
			CLEAR_BIT(GPIOB->DIR, GPIO_PIN_20);
			CLEAR_BIT(GPIOB->PULLUP_EN, GPIO_PIN_19|GPIO_PIN_20);
			__HAL_AFIO_REMAP_UART0_TX(GPIOB, GPIO_PIN_19);
			__HAL_AFIO_REMAP_UART0_RX(GPIOB, GPIO_PIN_20);
			
			HAL_NVIC_SetPriority(UART0_IRQn, 3);
			HAL_NVIC_EnableIRQ(UART0_IRQn);
			break;
		}
		case UART_ID_1:
		{
			__HAL_RCC_UART1_CLK_ENABLE();
			UART_HARD_REST(UART1_REST_BIT);

			SET_BIT(GPIOB->DIR, GPIO_PIN_6);
			CLEAR_BIT(GPIOB->DIR, GPIO_PIN_7);
			CLEAR_BIT(GPIOB->PULLUP_EN, GPIO_PIN_6|GPIO_PIN_7);
			__HAL_AFIO_REMAP_UART1_TX(GPIOB, GPIO_PIN_6);
			__HAL_AFIO_REMAP_UART1_RX(GPIOB, GPIO_PIN_7);
			
			HAL_NVIC_SetPriority(UART1_IRQn, 4);
			HAL_NVIC_EnableIRQ(UART1_IRQn);
			break;
		}
		case UART_ID_2:
		{
			__HAL_RCC_UART2_CLK_ENABLE();
			UART_HARD_REST(UART2_REST_BIT);
			
			SET_BIT(GPIOA->DIR, GPIO_PIN_2);
			CLEAR_BIT(GPIOA->DIR, GPIO_PIN_3);
			CLEAR_BIT(GPIOA->PULLUP_EN, GPIO_PIN_2|GPIO_PIN_3);
			__HAL_AFIO_REMAP_UART2_TX(GPIOA, GPIO_PIN_2);
			__HAL_AFIO_REMAP_UART2_RX(GPIOA, GPIO_PIN_3);
			
			HAL_NVIC_SetPriority(UART2_5_IRQn, 5);
			HAL_NVIC_EnableIRQ(UART2_5_IRQn);
			break;
		}
		case UART_ID_3:
		{
			__HAL_RCC_UART3_CLK_ENABLE();
			UART_HARD_REST(UART3_REST_BIT);
			
			SET_BIT(GPIOA->DIR, GPIO_PIN_5);
			CLEAR_BIT(GPIOA->DIR, GPIO_PIN_6);
			CLEAR_BIT(GPIOA->PULLUP_EN, GPIO_PIN_5|GPIO_PIN_6);
			__HAL_AFIO_REMAP_UART3_TX(GPIOA, GPIO_PIN_5);
			__HAL_AFIO_REMAP_UART3_RX(GPIOA, GPIO_PIN_6);
			
			HAL_NVIC_SetPriority(UART2_5_IRQn, 5);
			HAL_NVIC_EnableIRQ(UART2_5_IRQn);
			break;
		}
		case UART_ID_4:
		{
			__HAL_RCC_UART4_CLK_ENABLE();
			UART_HARD_REST(UART4_REST_BIT);
			
			SET_BIT(GPIOA->DIR, GPIO_PIN_8);
			CLEAR_BIT(GPIOA->DIR, GPIO_PIN_9);
			CLEAR_BIT(GPIOA->PULLUP_EN, GPIO_PIN_8|GPIO_PIN_9);
			__HAL_AFIO_REMAP_UART4_TX(GPIOA, GPIO_PIN_8);
			__HAL_AFIO_REMAP_UART4_RX(GPIOA, GPIO_PIN_9);
			
			HAL_NVIC_SetPriority(UART2_5_IRQn, 5);
			HAL_NVIC_EnableIRQ(UART2_5_IRQn);
			break;
		}
		case UART_ID_5:
		{
			__HAL_RCC_UART5_CLK_ENABLE();
			UART_HARD_REST(UART5_REST_BIT);
			
			SET_BIT(GPIOA->DIR, GPIO_PIN_12);
			CLEAR_BIT(GPIOA->DIR, GPIO_PIN_13);
			CLEAR_BIT(GPIOA->PULLUP_EN, GPIO_PIN_12|GPIO_PIN_13);
			__HAL_AFIO_REMAP_UART5_TX(GPIOA, GPIO_PIN_12);
			__HAL_AFIO_REMAP_UART5_RX(GPIOA, GPIO_PIN_13);
			
			HAL_NVIC_SetPriority(UART2_5_IRQn, 5);
			HAL_NVIC_EnableIRQ(UART2_5_IRQn);	
			break;
		}
		default:
			break;
	}
}

/// 设置uart相关寄存器，使能相关中断
static void _uart_hard_init(UART_ID id)
{	
	uint32_t value;
	uint32_t apbclk;
	wm_sys_clk sysclk;
	USART_TypeDef* huart = _uart_def_objs[id].huart; 
	
	uart_close(id);
	_uartx_gpio_init(id);
	MODIFY_REG(huart->LC,
             (uint32_t)(UART_LC_RE | UART_LC_TE | UART_LC_PS | UART_LC_PCE | UART_LC_STOP | UART_LC_DATAL),
             (uint32_t)(UART_WORDLENGTH_8B | UART_PARITY_NONE | UART_STOPBITS_1));
	if (huart == UART2)
	{
		CLEAR_BIT(huart->LC, (1 << 24));
	}
			 
	MODIFY_REG(huart->FC, (uint32_t)(UART_FC_RTSL | UART_FC_AFCE), (uint32_t)(UART_FC_RTSL_24 | UART_HWCONTROL_NONE));
	
	MODIFY_REG(huart->DMAC, (uint32_t)(UART_DMAC_RTO | UART_DMAC_RTOE), (uint32_t)((4 << 3) | UART_DMAC_RTOE));
	
	MODIFY_REG(huart->FIFOC, 
			(uint32_t)(UART_FIFOC_RFL | UART_FIFOC_TFL | UART_FIFOC_RFRST | UART_FIFOC_TFRST), 
			(uint32_t)(UART_FIFOC_RFL_16 | UART_FIFOC_TFL_16 | UART_FIFOC_RFRST | UART_FIFOC_TFRST));
			
	SystemClock_Get(&sysclk);
	apbclk = sysclk.apbclk * 1000000;
    value = (apbclk / (16 * _uart_def_objs[id].baud) - 1) | (((apbclk % (_uart_def_objs[id].baud * 16)) * 16 / ((_uart_def_objs[id].baud * 16))) << 16);
	
	huart->BAUDR = value;
}

/// 开启uart收发数据
void uart_open(UART_ID id)
{
	//开启串口收发
	USART_TypeDef* huart = _uart_def_objs[id].huart;
	if(UART_DEF_IS_DISABLE(id)) return;
	huart->INTM &= ~(((1<<8)|(1<<6)|(3<<2)|3));
	SET_BIT(huart->LC, (UART_MODE_TX | UART_MODE_RX));
	_uart_def_objs[id].enable = 1;
	_uart_start_msg(id);
}

/// 关闭uart收发数据
void uart_close(UART_ID id)
{
	if(UART_DEF_IS_DISABLE(id)) return;
	_uart_def_objs[id].huart->INTM |= (((1<<8)|(1<<6)|(3<<2)|3));
	_uart_def_objs[id].huart->LC &= ~(3<<6);
	_uart_def_objs[id].enable = 0;
}

/// 串口开启消息提醒
static void _uart_start_msg(UART_ID id)
{
	const char* STR = ">> Hello UART%d\r\n";
	char buff[32];
	if(UART_DEF_IS_DISABLE(id)) return;
	sprintf(buff, STR, (uint8_t)id);
	
	uart_writes((UART_ID)id, (uint8_t*)buff, strlen(buff));	
}


/////////// 队列操作相关函数 /////////////////
/// 初始化uart对应的收发队列资源
// 注意：关于队列的插入和读取都没有做互斥处理
static void _uart_queue_init(UART_ID id)
{
	if(UART_DEF_IS_DISABLE(id)) return;
	memset(_uart_def_objs[id].tx_queue.data, 0, _uart_def_objs[id].tx_queue.size);
	memset(_uart_def_objs[id].rx_queue.data, 0, _uart_def_objs[id].rx_queue.size);
#if UART_OS_ENABLE
    char name[] = "UARTx";
	name[4] = id%10 + '0';
	rt_mutex_init(&uart_write_mutex[id], (const char*)name, 0);
#endif
}

/// 将接收到的数据保存的接收队列中
static void _uart_rx_queue_insert(UART_ID id, uint8_t data)
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return;
	
	sq = &(_uart_def_objs[id].rx_queue);
	static_queue_insert(sq, &data);
}

static uint32_t _uart_rx_queue_inserts(UART_ID id, uint8_t* data, uint32_t size)
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return 0;
	
	sq = &(_uart_def_objs[id].rx_queue);
	return static_queue_inserts(sq, data, size);
}

/// 读取发送队列中的数据
static uint8_t _uart_read_tx_queue(UART_ID id, uint8_t* data)
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id)) return 0;
	sq = &(_uart_def_objs[id].tx_queue);
	
	if(static_queue_read(sq, data))
		return 1;
	return 0;
}

static uint32_t _uart_reads_tx_queue(UART_ID id, uint8_t* data, uint32_t size)
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id)) return 0;
	
	sq = &(_uart_def_objs[id].tx_queue);
	return static_queue_reads(sq, data, size);
}
