#ifndef USER_H
#define USER_H

#include "wm_hal.h"
#include "led.h"
#include "serial.h"
#include "rtthread.h"

void user_board_init(void);

void app(void);

void serial_process(void);

int8_t os_running(void);

int uart0_read_char(void);

void uart0_loop_send_str(const char* str);

void uart0_send_str(const char* str);

#endif