#include "led.h"

static led_hard_def leds[LED_MAX_INDEX] = {
	#if LED_MAX_NUM==2
		LED0_DEF,
		LED1_DEF,
	#elif LED_MAX_NUM==3
		LED0_DEF,
		LED1_DEF,
		LED2_DEF,
	#else
		LED0_DEF,
	#endif	
};

void led_open(LED_ID id)
{
	if(id<LED_MAX_INDEX)
	{
		uint8_t le = (leds[id].act_level==GPIO_PIN_SET)?GPIO_PIN_SET:GPIO_PIN_RESET;
		leds[id].current_level = le;
		HAL_GPIO_WritePin(leds[id].GPIOx, leds[id].pin, le);
	}
}

void led_close(LED_ID id)
{
	if(id<LED_MAX_INDEX)
	{
		uint8_t le = (leds[id].act_level==GPIO_PIN_SET)?GPIO_PIN_RESET:GPIO_PIN_SET;
		leds[id].current_level = le;
		HAL_GPIO_WritePin(leds[id].GPIOx, leds[id].pin, le);
	}
}

void led_toggle(LED_ID id)
{
	if(id<LED_MAX_INDEX)
	{
		uint8_t le = (leds[id].current_level==GPIO_PIN_SET)?GPIO_PIN_RESET:GPIO_PIN_SET;
		leds[id].current_level = le;
		HAL_GPIO_WritePin(leds[id].GPIOx, leds[id].pin, le);
	}
}

void led_init(void)
{
	GPIO_InitTypeDef gpio;
	gpio.Mode = GPIO_MODE_OUTPUT;
	gpio.Pull = GPIO_PULLUP;
	if(LED_MAX_INDEX<=1)
	{
		uint8_t le = leds[0].act_level==GPIO_PIN_SET?GPIO_PIN_RESET:GPIO_PIN_SET;
		leds[0].current_level = le;
		gpio.Pin = leds[0].pin;
		HAL_GPIO_Init(leds[0].GPIOx, &gpio);
		HAL_GPIO_WritePin(leds[0].GPIOx, gpio.Pin, le);
	}
	if(LED_MAX_INDEX>=2)
	{
		uint8_t le = leds[1].act_level==GPIO_PIN_SET?GPIO_PIN_RESET:GPIO_PIN_SET;
		leds[1].current_level = le;
		gpio.Pin = leds[1].pin;;
		HAL_GPIO_Init(leds[1].GPIOx, &gpio);
		HAL_GPIO_WritePin(leds[1].GPIOx, gpio.Pin, le);
	}
	if(LED_MAX_INDEX>=3)
	{
		uint8_t le = leds[2].act_level==GPIO_PIN_SET?GPIO_PIN_RESET:GPIO_PIN_SET;
		leds[2].current_level = le;
		gpio.Pin = leds[2].pin;;
		HAL_GPIO_Init(leds[2].GPIOx, &gpio);
		HAL_GPIO_WritePin(leds[2].GPIOx, gpio.Pin, le);
	}
}

static led_hard_def* get_led_def(LED_ID id)
{
	uint8_t i = 0;
	for( ; i<LED_MAX_INDEX; ++i)
	{
		if(leds[i].id==id)
			return &leds[i];
	}
	return NULL;
}

void led_set_time(LED_ID id, uint32_t act, uint32_t cls)
{
	led_hard_def* pled = get_led_def(id);
	if(pled)
	{
		pled->act_time = act;
		pled->cls_time = cls;
	}
}

void led_set_act_time(LED_ID id, uint32_t time)
{
	led_hard_def* pled = get_led_def(id);
	if(pled)
	{
		pled->act_time = time;
	}
}

void led_set_cls_time(LED_ID id, uint32_t time)
{
	led_hard_def* pled = get_led_def(id);
	if(pled)
	{
		pled->cls_time = time;
	}
}

void led_update(void)
{
	uint32_t now = HAL_GetTick();
	uint8_t i = 0;
	for( ; i<LED_MAX_INDEX; ++i)
	{
		if(now-leds[i].last_time<=leds[i].cls_time)
		{
			led_open(i);
		}else if(now-leds[i].last_time<=leds[i].act_time+leds[i].cls_time)
		{
			led_close(i);
		}else
			leds[i].last_time = now;
	}
}
