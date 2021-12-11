
#include <stdio.h>
#include "wm_hal.h"
#include "user.h"
#include "rtthread.h"

void Error_Handler(void);

int main(void)
{
	app();
}


void Error_Handler(void)
{
	while(1)
	{
	}
}

void assert_failed(uint8_t *file, uint32_t line)
{
	printf("Wrong parameters value: file %s on line %d\r\n", file, line);
}