#ifndef SERIAL_H
#define SERIAL_H

#include "wm_hal.h"
#include "StaticQueue.h"

/*********************************************************************************************************
 *          					使用说明
 * 
 * 1、根据系统要求选择开启需要的串口，相关宏UARTx_ENABLE(x=0,1,2...5)
 * 
 * 2、自定义串口发送缓冲区和接收缓冲器空间大小，相关宏UARTx_TX_MAX_SIZE，UARTx_RX_MAX_SIZE
 * 
 * 3、在系统资源初始化代码中调用uart_init(baud)函数，该函数对各个串口硬件资源和软件资源进行初始化，并开启串口
 * 
 * 4、在主任务中循环调用uart_loop()函数，该函数保证串口在后台自动发送数据
 * 
 * 5、用户相关操作函数:
 * 	  uart_read(),uart_reads() ： 从串口接收缓冲队列中读取数据，不建议在中断函数中调用
 *    uart_write(),uart_writes()：往串口发送缓冲队列中写入数据，不建议在中断函数中调用
 * 
 ***********************************************************************************************************/

/// 使能系统中使用的串口，1为有效
#define UART0_ENABLE 1
#define UART1_ENABLE 0
#define UART2_ENABLE 0
#define UART3_ENABLE 0
#define UART4_ENABLE 0
#define UART5_ENABLE 0

/// OS数据安全锁
#define UART_OS_ENABLE 1

/// 串口使能配置，位定义，1使能，从低位到高位依次为：uart0，uart1...
#define UARTS_DEF_ENABLE (UART0_ENABLE|(UART1_ENABLE<<1)|(UART2_ENABLE<<2)|(UART3_ENABLE<<3)|(UART4_ENABLE<<4)|(UART5_ENABLE<<5))

#define UART_DEF_IS_ENABLE(id)  (UARTS_DEF_ENABLE&(1<<(uint8_t)id))
#define UART_DEF_IS_DISABLE(id) (!(UARTS_DEF_ENABLE&(1<<(uint8_t)id)))

/// 定义各个串口发送和接收缓冲区的大小，单位为字节
#if UART0_ENABLE
	#define UART0_TX_MAX_SIZE 1024
	#define UART0_RX_MAX_SIZE 1024
#else
	#define UART0_TX_MAX_SIZE 1
	#define UART0_RX_MAX_SIZE 1
#endif

#if UART1_ENABLE
	#define UART1_TX_MAX_SIZE (1024*15)
	#define UART1_RX_MAX_SIZE (1024*15)
#else
	#define UART1_TX_MAX_SIZE 1
	#define UART1_RX_MAX_SIZE 1
#endif

#if UART2_ENABLE
	#define UART2_TX_MAX_SIZE (1024*5)
	#define UART2_RX_MAX_SIZE (1024*5)
#else
	#define UART2_TX_MAX_SIZE 1
	#define UART2_RX_MAX_SIZE 1	
#endif

#if UART3_ENABLE
	#define UART3_TX_MAX_SIZE (1024*5)
	#define UART3_RX_MAX_SIZE (1024*5)
#else
	#define UART3_TX_MAX_SIZE 1
	#define UART3_RX_MAX_SIZE 1
#endif

#if UART4_ENABLE
	#define UART4_TX_MAX_SIZE (1024*5)
	#define UART4_RX_MAX_SIZE (1024*5)
#else
	#define UART4_TX_MAX_SIZE 1
	#define UART4_RX_MAX_SIZE 1
#endif

#if UART5_ENABLE
	#define UART5_TX_MAX_SIZE (1024*5)
	#define UART5_RX_MAX_SIZE (1024*5)
#else
	#define UART5_TX_MAX_SIZE 1
	#define UART5_RX_MAX_SIZE 1
#endif

/// 串口ID号，依次对应uart0，uart1，...，uart5
typedef enum
{
	UART_ID_0,
	UART_ID_1,
	UART_ID_2,
	UART_ID_3,
	UART_ID_4,
	UART_ID_5,
	UART_ID_MAX
}UART_ID;

/// 串口资源定义
typedef struct
{
	UART_ID id;            //串口ID
	uint8_t send_valid;    //发送数据有效
	uint8_t enable;        //串口开启标志
	uint32_t baud;         //波特率
	USART_TypeDef* huart;  //串口寄存器类
	StaticQueue tx_queue;  //发送数据缓存队列
	StaticQueue rx_queue;  //接收数据缓存队列
}uart_def;

#define UART_DEF(id,huart,tq_buff,tq_size,rq_buff,rq_size) {id,1,0,115200,huart,{tq_buff,0,0,1,tq_size},{rq_buff,0,0,1,rq_size}}

void uart_init(void);
void uart_set_baud(UART_ID id, uint32_t bd);

void uart_open(UART_ID id);
void uart_close(UART_ID id);

void uart_loop(void);

uint32_t uart_read_data_len(UART_ID id);

int8_t uart_read(UART_ID id, uint8_t* data);
uint32_t uart_reads(UART_ID id, uint8_t* data, uint32_t size);

uint8_t uart_write(UART_ID id, uint8_t data);
uint32_t uart_writes(UART_ID id, uint8_t* data, uint32_t size);

/// 中断处理中调用函数
void uart_itr_callback(USART_TypeDef* huart);

#endif