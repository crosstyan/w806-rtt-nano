/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2017-01-01     Urey      first version
 * 2018-06-05     tanek     clean code
 */

.file     "startup.S"

.global  rt_thread_switch_interrupt_flag
.global  rt_interrupt_from_thread
.global  rt_interrupt_to_thread

.text
.align 2

/*** 关闭中断 ***/
/*
 * rt_base_t rt_hw_interrupt_disable(void);
 */
.global rt_hw_interrupt_disable
.type   rt_hw_interrupt_disable, %function
rt_hw_interrupt_disable:
mfcr    r0, CR<0,0>
psrclr  ee,ie
rts
/*****************************/

/*** 开启中断 ***/
/*
 * void rt_hw_interrupt_enable(rt_base_t psr);
 */
.global rt_hw_interrupt_enable
.type   rt_hw_interrupt_enable, %function
rt_hw_interrupt_enable:
mtcr    r0, CR<0,0>
rts
/*****************************/


/*** 第一次切换任务 ***/
/*
 * void rt_hw_context_switch_to(rt_uint32 to);
 * R0 --> to
 */
.global rt_hw_context_switch_to
.type rt_hw_context_switch_to, %function
rt_hw_context_switch_to:
psrclr  ee,ie

lrw     r1, rt_interrupt_to_thread 
st.w    r0, (r1,0)     

/* set form thread = 0 */
lrw     r1, rt_interrupt_from_thread
lrw     r0, 0
st.w    r0, (r1,0)

lrw     r1, rt_thread_switch_interrupt_flag
lrw     r0, 1
st.w    r0, (r1,0)

/* 初始化TSPEND */
lrw     r0, 0xE000EC10 //设置最低的中断优先级
lrw     r1, 0xff
st.w    r1, (r0,0)

lrw     r0, 0xE000EC0C //清除状态
lrw     r1, 0
st.w    r1, (r0,0)

/*触发tspend中断*/
lrw     r0, 0XE000EC08
bgeni   r1, 0
st.w    r1, (r0,0)

psrset  ee,ie
rts
/********************************************/

/*** 在中断中需要切换上下文 ***
/*
 * void rt_hw_context_switch_interrupt(rt_uint32 from, rt_uint32 to);
 * r0 --> from
 * r1 --> to
 */
.global rt_hw_context_switch_interrupt
.type   rt_hw_context_switch_interrupt, %function
rt_hw_context_switch_interrupt:

lrw   r2, rt_thread_switch_interrupt_flag
ld.w  r3, (r2,0)
bhz   r3, _to_thread1

lrw   r3, 1
st.w  r3, (r2,0)

lrw   r2, rt_interrupt_from_thread     /* set rt_interrupt_from_thread */
st.w  r0, (r2,0)

_to_thread1:
lrw   r2, rt_interrupt_to_thread       /* set rt_interrupt_to_thread */
st.w  r1, (r2,0)

lrw   r0, 0XE000EC08
bgeni r1, 0
st.w  r1, (r0,0)
rts
/*************************************************************/


/*** 普通切换上下文 ***/
/*
 * void rt_hw_context_switch(rt_uint32 from, rt_uint32 to)
 * r0 --> from
 * r1 --> to
 */
.global rt_hw_context_switch
.type   rt_hw_context_switch, %function
rt_hw_context_switch:
lrw   r2, rt_thread_switch_interrupt_flag
ld.w  r3, (r2,0)
bhz   r3, _to_thread2

lrw   r3, 1
st.w  r3, (r2,0)

lrw   r2, rt_interrupt_from_thread     /* set rt_interrupt_from_thread */
st.w  r0, (r2,0)

_to_thread2:
lrw   r2, rt_interrupt_to_thread       /* set rt_interrupt_to_thread */
st.w  r1, (r2,0)

lrw   r0, 0XE000EC08
bgeni r1, 0
st.w  r1, (r0,0)

rts
/******************************************************************/


.global PendSV_Handler
.type   PendSV_Handler, %function
PendSV_Handler:
psrclr ee,ie
///压栈 R13-R12,R3-R0
ipush

///判断上下文切换标志
///如果为0，说明没有发生上下文切换调用,则重新开启异常中断，并恢复现场
///如果大于0，说明有发生上下文切换调用，则清除标志，保存from上下文
lrw   r2, rt_thread_switch_interrupt_flag
ld.w  r3, (r2,0)
bez   r3, _enable_ie_ee

lrw   r3, 0
st.w  r3, (r2,0)

///如果不存在from线程，则直接恢复to线程上下文
lrw    r2, rt_interrupt_from_thread
ld.w   r3, (r2,0)
bez    r3, _to_thread3

///保存from线程上下文
subi   sp, sp, 64
fstms  fr0-fr15, (sp)
subi   sp, sp, 68
stm    r15-r31,  (sp)
subi   sp, sp, 32
stm    r4-r11,   (sp)
subi   sp, sp, 8
mfcr   r0, CR<4,0>
mfcr   r1, CR<2,0> 
stm    r0-r1,    (sp)
///更新堆栈地址到thread->sp
st.w   sp, (r3,0)

///恢复to线程上下文
_to_thread3:
lrw    r2, rt_interrupt_to_thread
ld.w   r0,  (r2,0)
ld.w   sp,  (r0,0)

ldm    r0-r1,   (sp)
mtcr   r0,   CR<4,0>
mtcr   r1,   CR<2,0>
addi   sp, sp, 8
ldm    r4-r11,  (sp)
addi   sp, sp, 32
ldm    r15-r31, (sp)
addi   sp, sp, 68
fldms  fr0-fr15,(sp)
addi   sp, sp, 64

///开启异常中断，设置PSR备份寄存器EPSR
_enable_ie_ee:
mfcr   r0, CR<2,0>
bseti  r0, 6 
bseti  r0, 8
mtcr   r0, CR<2,0>

//出栈 R0-R3,R12-R13
ipop
rte