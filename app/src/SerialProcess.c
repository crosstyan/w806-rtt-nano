#include "user.h"

static uint8_t buff[512];

static void serial_send_data(UART_ID target_id, uint8_t* data,uint32_t len)
{
	uart_writes(target_id, data, len);
}

void serial_process(void)
{
	uint8_t i = 0;
	
	for( ; i<UART_ID_MAX; ++i)
	{
		uint32_t len = 0;
		uint32_t j = 0;
		
		if(UART_DEF_IS_DISABLE(i)) continue;
			
		// 处理主串口mavlink协议
		if((UART_ID)i==UART_ID_1)
		{
			len = uart_reads((UART_ID)i, buff, 512);
			for( j=0; j<len; ++j)
			{
	
			}
		}
	}
}
