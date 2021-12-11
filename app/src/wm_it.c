
#include "wm_hal.h"
#include "user.h"

static USART_TypeDef* HUARTS[4] = {UART2, UART3, UART4, UART5};

__attribute__((isr)) void CORET_IRQHandler(void)
{
	uint32_t temp;
	
	temp = (*(volatile unsigned int *) (0xE000E010));
	HAL_IncTick();
	SysTick_Handler();
}

__attribute__((isr)) void UART0_IRQHandler(void)
{
	uart_itr_callback(UART0);
}

__attribute__((isr)) void UART1_IRQHandler(void)
{
	uart_itr_callback(UART1);
}

__attribute__((isr)) void UART2_5_IRQHandler(void)
{
	uint8_t i;
	USART_TypeDef* huart;
	uint32_t isr;
	for(i=0; i<sizeof(HUARTS)/sizeof(USART_TypeDef*); ++i)
	{
		huart = HUARTS[i];
		isr = huart->INTS;
		
		if(UART_DEF_IS_ENABLE((UART_ID)(i+UART_ID_2)))
		{
			//存在中断
			if(isr&(0x014C|0x03)) 
			{
				uart_itr_callback(huart);
			}
		}else{
			huart->INTS |= isr;  //清除中断标志位
		}
	}
}
