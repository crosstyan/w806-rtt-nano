#include "contex_test.h"
#include "user.h"

rt_uint8_t stack1[2048];
rt_uint8_t stack2[2048];
rt_uint8_t* sp1;
rt_uint8_t* sp2;
void* current_task = NULL;

static void task1(void)
{
	uint32_t old_time = 0;
	uint32_t count = 0;
	char buff[32];
	while(1)
	{
		const uint32_t now = HAL_GetTick();
		if(now-old_time>=1000)
		{
			++count;
			sprintf(buff, "task1: %d\n", count);
			uart0_send_str(buff);
			old_time = now;
		}
		led_update();
	}
}

static void task2(void)
{
	uint32_t old_time = 0;
	uint32_t count = 0;
	char buff[32];
	while(1)
	{
		const uint32_t now = HAL_GetTick();
		if(now-old_time>=1000)
		{
			++count;
			sprintf(buff, "task2: %d\n", count);
			old_time = now;
			uart0_send_str(buff);
		}
		led_update();
	}
}

void task_test_init(void)
{
	sp1 = rt_hw_stack_init(task1, NULL, stack1+2048-sizeof(rt_ubase_t), NULL);
	sp2 = rt_hw_stack_init(task2, NULL, stack2+2048-sizeof(rt_ubase_t), NULL);
	
	current_task = (void*)task1;
	rt_hw_context_switch_to(&sp1);
}

void task_test_auto_switch(void)
{
	static uint32_t old_time = 0;
	const uint32_t now = HAL_GetTick();
	
	if(!current_task)
		old_time = now;
	
	if(now-old_time>=10000)
	{
		if(current_task==(void*)task1)
		{
			rt_hw_context_switch(&sp1, &sp2);
			current_task=(void*)task2;
		}else
		{
			rt_hw_context_switch(&sp2, &sp1);
			current_task=(void*)task1;
		}
		old_time = now;
	}
}
