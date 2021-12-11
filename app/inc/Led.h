#ifndef LED_H
#define LED_H

#include "wm_hal.h"

#define LED_MAX_NUM 1

/// LED ID
typedef enum _led_enum{
	LED_ID_0 = 0,
	LED_ID_1,
	LED_ID_2
}LED_ID;

/// LED硬件接口定义
typedef struct _led_hard_def{
	uint8_t id;           //LED灯编号
	uint8_t act_level;    //点亮时的电平
	uint8_t current_level;//当前电平
	GPIO_TypeDef *GPIOx;  //IO类
	uint32_t pin;         //引脚编号
	uint32_t act_time;    //开启时间
	uint32_t cls_time;    //关闭时间
	uint32_t last_time;
}led_hard_def;

#define LED0_DEF {LED_ID_0, GPIO_PIN_RESET, GPIO_PIN_RESET, GPIOB, GPIO_PIN_0, 1000, 1000, 0}
#define LED1_DEF {LED_ID_1, GPIO_PIN_RESET, GPIO_PIN_RESET, GPIOB, GPIO_PIN_1, 1000, 1000, 0}
#define LED2_DEF {LED_ID_2, GPIO_PIN_RESET, GPIO_PIN_RESET, GPIOB, GPIO_PIN_2, 1000, 1000, 0}

#if LED_MAX_NUM>3
	#define LED_MAX_INDEX 3
#elif LED_MAX_NUM==0
	#define LED_MAX_INDEX 1
#else
	#define LED_MAX_INDEX LED_MAX_NUM
#endif

void led_init(void);

void led_set_time(LED_ID id, uint32_t act, uint32_t cls);

void led_set_act_time(LED_ID id, uint32_t time);

void led_set_cls_time(LED_ID id, uint32_t time);

void led_open(LED_ID id);

void led_close(LED_ID id);

void led_toggle(LED_ID id);

void led_update(void);

#endif

