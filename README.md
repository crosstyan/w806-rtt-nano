# W806-RTT-Nano

#### 介绍
基于联胜德微W806芯片移植RTthread-Nano

#### 硬件

W806紫色开发板

#### 支持设备

- LED控制，见 led.h、led.c

- 五路串口可选择使用，见 serial.h、serial.c，对串口的详细使用请见：

  [W806-Uarts: 基于W806的串口收发数据框架 (gitee.com)](https://gitee.com/awesomeoy/w806-uarts)

#### 移植修改文件

- 新加文件

  rtthread->libcpu->cky->x804->context_x804.s : 上下文切换汇编代码

  rtthread->libcpu->cky->x804->cpu.c : 基于X804处理器的初始化堆栈模型初始化

- 修改系统配置文件 rtthread->bsp->rtconfig.h中的配置，关闭finsh，修改主线程、空闲线程、定时器线程堆栈大小

- 重写rtthread->bsp->board.c
