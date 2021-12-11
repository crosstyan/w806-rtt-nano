#include "user.h"

/// 用户板卡相关硬件、软件初始化
void user_board_init(void)
{
	SystemClock_Config(CPU_CLK_160M);
	led_init();
	uart_init();
}

/// led闪烁钩子函数
void led_hook(void)
{
	static rt_tick_t old_time = 0;
	static uint32_t count = 0;
	char buff[32];
	const rt_tick_t c = rt_tick_get();
	if(c-old_time>1000)
	{
		++count;
		sprintf(buff, "led hook: %d\n", count);
		uart0_loop_send_str(buff);
		old_time = c;
		led_toggle(LED_ID_0);
	}
}

/// 串口循环发送任务
void uart_task(void *arg)
{
	rt_tick_t old_time = 0;
	uint32_t count = 0;
	char buff[32];
	while(1)
	{
		const rt_tick_t c = rt_tick_get();
		if(c-old_time>1000)
		{
			++count;
			sprintf(buff, "Uart task: %d\n", count);
			uart0_loop_send_str(buff);
			old_time = c;
		}
	}
	
}

/// 串口数据处理任务
/// 每隔5ms处理一次串口数据
void uart_process_task(void* arg)
{
	while(1)
	{
		rt_thread_mdelay(5);
		uart_loop();  //后台自动发送串口缓冲区数据
	}
}

/// 主应用，在main函数中被调用
void app(void)
{
	uint32_t count = 0;
	char buff[32];
	rt_thread_idle_sethook(led_hook);
	
	rt_thread_t uart_thread = rt_thread_create("UART_TASK", uart_task, (void*)0, 2048, RT_THREAD_PRIORITY_MAX-1, 50);		
	rt_thread_startup(uart_thread);
	
	while(1)
	{
		rt_thread_delay(1000);
		++count;
		sprintf(buff, "Main task:%d\n", count);
		uart0_loop_send_str(buff);
	}
}

/// 从串口0的接收缓冲区中读取一个字节数据
int uart0_read_char(void)
{
	uint8_t data;
	if(!uart_read(UART_ID_0, &data))
	{
		return (int)data;
	}
	return -1;
}

/// 串口0循环发送数据函数
void uart0_loop_send_str(const char* str)
{
	char* p = str;
	uint8_t len = 0;
	
	while(*p)
	{
		len = 32-(uint8_t)(UART0->FIFOS&0x3f);
		if(len>0 && len<=32)
		{
			while(len-- && *p)
				UART0->TDW = *p++;
		}	
	}
}		

/// 往串口缓冲区中写入待发送数据
void uart0_send_str(const char* str)
{
	uart_writes(UART_ID_0, str, strlen(str));
}