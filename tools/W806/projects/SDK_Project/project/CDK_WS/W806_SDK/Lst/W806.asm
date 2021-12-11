
.//Obj/W806.elf:     file format elf32-csky-little


Disassembly of section .text:

08010400 <__Vectors>:
 8010400:	00 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 8010410:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 8010420:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 8010430:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 8010440:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 8010450:	d4 05 01 08 d4 05 01 08 5a 06 01 08 d4 05 01 08     ........Z.......
 8010460:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 8010470:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 8010480:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 8010490:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 80104a0:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 80104b0:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 80104c0:	60 1e 01 08 94 1e 01 08 d4 05 01 08 c8 1e 01 08     `...............
 80104d0:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................
 80104e0:	d4 05 01 08 28 1e 01 08 d4 05 01 08 d4 05 01 08     ....(...........
 80104f0:	d4 05 01 08 d4 05 01 08 d4 05 01 08 d4 05 01 08     ................

08010500 <Reset_Handler>:
    .type   Reset_Handler, %function
Reset_Handler:
#ifndef CONFIG_KERNEL_NONE
    lrw     r0, 0xe0000200
#else
    lrw     r0, 0x80000200
 8010500:	101a      	lrw      	r0, 0x80000200	// 8010568 <__exit+0x4>
    mtcr    r0, psr
 8010502:	c0006420 	mtcr      	r0, cr<0, 0>
#endif
    mtcr    r0, psr
 8010506:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
 801050a:	1019      	lrw      	r0, 0x20002b08	// 801056c <__exit+0x8>
    mov     sp, r0
 801050c:	6f83      	mov      	r14, r0

/*
 *	move __Vectors to irq_vectors
 */
    lrw     r1, __Vectors
 801050e:	1039      	lrw      	r1, 0x8010400	// 8010570 <__exit+0xc>
    lrw     r2, __vdata_start__
 8010510:	1059      	lrw      	r2, 0x20000000	// 8010574 <__exit+0x10>
    lrw     r3, __vdata_end__
 8010512:	107a      	lrw      	r3, 0x20000100	// 8010578 <__exit+0x14>

    subu    r3, r2
 8010514:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 8010516:	3b40      	cmpnei      	r3, 0
    bf      .L_loopv0_done
 8010518:	0c08      	bf      	0x8010528	// 8010528 <Reset_Handler+0x28>

.L_loopv0:
    ldw     r0, (r1, 0)
 801051a:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 801051c:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 801051e:	2103      	addi      	r1, 4
    addi    r2, 4
 8010520:	2203      	addi      	r2, 4
    subi    r3, 4
 8010522:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 8010524:	3b40      	cmpnei      	r3, 0
    bt      .L_loopv0
 8010526:	0bfa      	bt      	0x801051a	// 801051a <Reset_Handler+0x1a>
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
 8010528:	1035      	lrw      	r1, 0x8015d14	// 801057c <__exit+0x18>
    lrw     r2, __data_start__
 801052a:	1056      	lrw      	r2, 0x20000100	// 8010580 <__exit+0x1c>
    lrw     r3, __data_end__
 801052c:	1076      	lrw      	r3, 0x20000308	// 8010584 <__exit+0x20>

    subu    r3, r2
 801052e:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 8010530:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
 8010532:	0c08      	bf      	0x8010542	// 8010542 <Reset_Handler+0x42>

.L_loop0:
    ldw     r0, (r1, 0)
 8010534:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010536:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 8010538:	2103      	addi      	r1, 4
    addi    r2, 4
 801053a:	2203      	addi      	r2, 4
    subi    r3, 4
 801053c:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 801053e:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
 8010540:	0bfa      	bt      	0x8010534	// 8010534 <Reset_Handler+0x34>
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
 #if 1
    lrw     r1, __bss_start__
 8010542:	1032      	lrw      	r1, 0x20000308	// 8010588 <__exit+0x24>
    lrw     r2, __bss_end__
 8010544:	1052      	lrw      	r2, 0x20035afc	// 801058c <__exit+0x28>

    movi    r0, 0
 8010546:	3000      	movi      	r0, 0

    subu    r2, r1
 8010548:	6086      	subu      	r2, r1
    cmpnei  r2, 0
 801054a:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
 801054c:	0c06      	bf      	0x8010558	// 8010558 <Reset_Handler+0x58>

.L_loop1:
    stw     r0, (r1, 0)
 801054e:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
 8010550:	2103      	addi      	r1, 4
    subi    r2, 4
 8010552:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
 8010554:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
 8010556:	0bfc      	bt      	0x801054e	// 801054e <Reset_Handler+0x4e>
.L_loop1_done:
#endif

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
 8010558:	e0001a96 	bsr      	0x8013a84	// 8013a84 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 801055c:	e0001aea 	bsr      	0x8013b30	// 8013b30 <board_init>
#endif

    bsr    entry
 8010560:	e0000fb6 	bsr      	0x80124cc	// 80124cc <entry>

08010564 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010564:	0400      	br      	0x8010564	// 8010564 <__exit>
 8010566:	0000      	.short	0x0000
 8010568:	80000200 	.long	0x80000200
 801056c:	20002b08 	.long	0x20002b08
 8010570:	08010400 	.long	0x08010400
 8010574:	20000000 	.long	0x20000000
 8010578:	20000100 	.long	0x20000100
 801057c:	08015d14 	.long	0x08015d14
 8010580:	20000100 	.long	0x20000100
 8010584:	20000308 	.long	0x20000308
 8010588:	20000308 	.long	0x20000308
 801058c:	20035afc 	.long	0x20035afc

08010590 <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 8010590:	c1007420 	psrset      	ee

    subi    sp, 4
 8010594:	1421      	subi      	r14, r14, 4
    stw     r13, (sp)
 8010596:	ddae2000 	st.w      	r13, (r14, 0x0)
    addi    sp, 4
 801059a:	1401      	addi      	r14, r14, 4

    lrw     r13, g_trap_sp
 801059c:	ea8d000f 	lrw      	r13, 0x20002d08	// 80105d8 <ADC_IRQHandler+0x4>
    stw     sp, (r13)
 80105a0:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 80105a4:	ea8e000e 	lrw      	r14, 0x20002d08	// 80105dc <ADC_IRQHandler+0x8>

    subi    sp, 72
 80105a8:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 80105aa:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 80105ae:	100b      	lrw      	r0, 0x20002d08	// 80105d8 <ADC_IRQHandler+0x4>
    ldw     r0, (r0)
 80105b0:	9000      	ld.w      	r0, (r0, 0x0)

    stw     r0, (sp, 56) /* save r14 */
 80105b2:	b80e      	st.w      	r0, (r14, 0x38)

    subi    r0, 4
 80105b4:	2803      	subi      	r0, 4
    ldw     r13, (r0)
 80105b6:	d9a02000 	ld.w      	r13, (r0, 0x0)
    stw     r13, (sp, 52)
 80105ba:	ddae200d 	st.w      	r13, (r14, 0x34)

    stw     r15, (sp, 60)
 80105be:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
 80105c2:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 80105c6:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
 80105c8:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 80105cc:	b811      	st.w      	r0, (r14, 0x44)

    mov     r0, sp
 80105ce:	6c3b      	mov      	r0, r14

    jbsr    trap_c
 80105d0:	e0001a72 	bsr      	0x8013ab4	// 8013ab4 <trap_c>

080105d4 <ADC_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 80105d4:	07de      	br      	0x8010590	// 8010590 <trap>
 80105d6:	0000      	.short	0x0000
 80105d8:	20002d08 	.long	0x20002d08
 80105dc:	20002d08 	.long	0x20002d08

080105e0 <rt_hw_interrupt_disable>:
 * rt_base_t rt_hw_interrupt_disable(void);
 */
.global rt_hw_interrupt_disable
.type   rt_hw_interrupt_disable, %function
rt_hw_interrupt_disable:
mfcr    r0, CR<0,0>
 80105e0:	c0006020 	mfcr      	r0, cr<0, 0>
psrclr  ee,ie
 80105e4:	c1807020 	psrclr      	ee, ie
rts
 80105e8:	783c      	jmp      	r15

080105ea <rt_hw_interrupt_enable>:
 * void rt_hw_interrupt_enable(rt_base_t psr);
 */
.global rt_hw_interrupt_enable
.type   rt_hw_interrupt_enable, %function
rt_hw_interrupt_enable:
mtcr    r0, CR<0,0>
 80105ea:	c0006420 	mtcr      	r0, cr<0, 0>
rts
 80105ee:	783c      	jmp      	r15

080105f0 <rt_hw_context_switch_to>:
 * R0 --> to
 */
.global rt_hw_context_switch_to
.type rt_hw_context_switch_to, %function
rt_hw_context_switch_to:
psrclr  ee,ie
 80105f0:	c1807020 	psrclr      	ee, ie

lrw     r1, rt_interrupt_to_thread 
 80105f4:	1138      	lrw      	r1, 0x20035af0	// 80106d4 <_enable_ie_ee+0x14>
st.w    r0, (r1,0)     
 80105f6:	b100      	st.w      	r0, (r1, 0x0)

/* set form thread = 0 */
lrw     r1, rt_interrupt_from_thread
 80105f8:	1138      	lrw      	r1, 0x20035af4	// 80106d8 <_enable_ie_ee+0x18>
lrw     r0, 0
 80105fa:	3000      	movi      	r0, 0
st.w    r0, (r1,0)
 80105fc:	b100      	st.w      	r0, (r1, 0x0)

lrw     r1, rt_thread_switch_interrupt_flag
 80105fe:	1138      	lrw      	r1, 0x20035af8	// 80106dc <_enable_ie_ee+0x1c>
lrw     r0, 1
 8010600:	3001      	movi      	r0, 1
st.w    r0, (r1,0)
 8010602:	b100      	st.w      	r0, (r1, 0x0)

/* 初始化TSPEND */
lrw     r0, 0xE000EC10 //设置最低的中断优先级
 8010604:	1117      	lrw      	r0, 0xe000ec10	// 80106e0 <_enable_ie_ee+0x20>
lrw     r1, 0xff
 8010606:	31ff      	movi      	r1, 255
st.w    r1, (r0,0)
 8010608:	b020      	st.w      	r1, (r0, 0x0)

lrw     r0, 0xE000EC0C //清除状态
 801060a:	1117      	lrw      	r0, 0xe000ec0c	// 80106e4 <_enable_ie_ee+0x24>
lrw     r1, 0
 801060c:	3100      	movi      	r1, 0
st.w    r1, (r0,0)
 801060e:	b020      	st.w      	r1, (r0, 0x0)

/*触发tspend中断*/
lrw     r0, 0XE000EC08
 8010610:	1116      	lrw      	r0, 0xe000ec08	// 80106e8 <_enable_ie_ee+0x28>
bgeni   r1, 0
 8010612:	ea010001 	movi      	r1, 1
st.w    r1, (r0,0)
 8010616:	b020      	st.w      	r1, (r0, 0x0)

psrset  ee,ie
 8010618:	c1807420 	psrset      	ee, ie
rts
 801061c:	783c      	jmp      	r15

0801061e <rt_hw_context_switch_interrupt>:
 */
.global rt_hw_context_switch_interrupt
.type   rt_hw_context_switch_interrupt, %function
rt_hw_context_switch_interrupt:

lrw   r2, rt_thread_switch_interrupt_flag
 801061e:	1150      	lrw      	r2, 0x20035af8	// 80106dc <_enable_ie_ee+0x1c>
ld.w  r3, (r2,0)
 8010620:	9260      	ld.w      	r3, (r2, 0x0)
bhz   r3, _to_thread1
 8010622:	e9430006 	bhz      	r3, 0x801062e	// 801062e <_to_thread1>

lrw   r3, 1
 8010626:	3301      	movi      	r3, 1
st.w  r3, (r2,0)
 8010628:	b260      	st.w      	r3, (r2, 0x0)

lrw   r2, rt_interrupt_from_thread     /* set rt_interrupt_from_thread */
 801062a:	114c      	lrw      	r2, 0x20035af4	// 80106d8 <_enable_ie_ee+0x18>
st.w  r0, (r2,0)
 801062c:	b200      	st.w      	r0, (r2, 0x0)

0801062e <_to_thread1>:

_to_thread1:
lrw   r2, rt_interrupt_to_thread       /* set rt_interrupt_to_thread */
 801062e:	114a      	lrw      	r2, 0x20035af0	// 80106d4 <_enable_ie_ee+0x14>
st.w  r1, (r2,0)
 8010630:	b220      	st.w      	r1, (r2, 0x0)

lrw   r0, 0XE000EC08
 8010632:	110e      	lrw      	r0, 0xe000ec08	// 80106e8 <_enable_ie_ee+0x28>
bgeni r1, 0
 8010634:	ea010001 	movi      	r1, 1
st.w  r1, (r0,0)
 8010638:	b020      	st.w      	r1, (r0, 0x0)
rts
 801063a:	783c      	jmp      	r15

0801063c <rt_hw_context_switch>:
 * r1 --> to
 */
.global rt_hw_context_switch
.type   rt_hw_context_switch, %function
rt_hw_context_switch:
lrw   r2, rt_thread_switch_interrupt_flag
 801063c:	1148      	lrw      	r2, 0x20035af8	// 80106dc <_enable_ie_ee+0x1c>
ld.w  r3, (r2,0)
 801063e:	9260      	ld.w      	r3, (r2, 0x0)
bhz   r3, _to_thread2
 8010640:	e9430006 	bhz      	r3, 0x801064c	// 801064c <_to_thread2>

lrw   r3, 1
 8010644:	3301      	movi      	r3, 1
st.w  r3, (r2,0)
 8010646:	b260      	st.w      	r3, (r2, 0x0)

lrw   r2, rt_interrupt_from_thread     /* set rt_interrupt_from_thread */
 8010648:	1144      	lrw      	r2, 0x20035af4	// 80106d8 <_enable_ie_ee+0x18>
st.w  r0, (r2,0)
 801064a:	b200      	st.w      	r0, (r2, 0x0)

0801064c <_to_thread2>:

_to_thread2:
lrw   r2, rt_interrupt_to_thread       /* set rt_interrupt_to_thread */
 801064c:	1142      	lrw      	r2, 0x20035af0	// 80106d4 <_enable_ie_ee+0x14>
st.w  r1, (r2,0)
 801064e:	b220      	st.w      	r1, (r2, 0x0)

lrw   r0, 0XE000EC08
 8010650:	1106      	lrw      	r0, 0xe000ec08	// 80106e8 <_enable_ie_ee+0x28>
bgeni r1, 0
 8010652:	ea010001 	movi      	r1, 1
st.w  r1, (r0,0)
 8010656:	b020      	st.w      	r1, (r0, 0x0)

rts
 8010658:	783c      	jmp      	r15

0801065a <PendSV_Handler>:


.global PendSV_Handler
.type   PendSV_Handler, %function
PendSV_Handler:
psrclr ee,ie
 801065a:	c1807020 	psrclr      	ee, ie
///压栈 R13-R12,R3-R0
ipush
 801065e:	1462      	ipush

///判断上下文切换标志
///如果为0，说明没有发生上下文切换调用,则重新开启异常中断，并恢复现场
///如果大于0，说明有发生上下文切换调用，则清除标志，保存from上下文
lrw   r2, rt_thread_switch_interrupt_flag
 8010660:	105f      	lrw      	r2, 0x20035af8	// 80106dc <_enable_ie_ee+0x1c>
ld.w  r3, (r2,0)
 8010662:	9260      	ld.w      	r3, (r2, 0x0)
bez   r3, _enable_ie_ee
 8010664:	e903002e 	bez      	r3, 0x80106c0	// 80106c0 <_enable_ie_ee>

lrw   r3, 0
 8010668:	3300      	movi      	r3, 0
st.w  r3, (r2,0)
 801066a:	b260      	st.w      	r3, (r2, 0x0)

///如果不存在from线程，则直接恢复to线程上下文
lrw    r2, rt_interrupt_from_thread
 801066c:	105b      	lrw      	r2, 0x20035af4	// 80106d8 <_enable_ie_ee+0x18>
ld.w   r3, (r2,0)
 801066e:	9260      	ld.w      	r3, (r2, 0x0)
bez    r3, _to_thread3
 8010670:	e9030014 	bez      	r3, 0x8010698	// 8010698 <_to_thread3>

///保存from线程上下文
subi   sp, sp, 64
 8010674:	1430      	subi      	r14, r14, 64
fstms  fr0-fr15, (sp)
 8010676:	f5ee3400 	fstms      	fr0-fr15, (r14)
subi   sp, sp, 68
 801067a:	1431      	subi      	r14, r14, 68
stm    r15-r31,  (sp)
 801067c:	d5ee1c30 	stm      	r15-r31, (r14)
subi   sp, sp, 32
 8010680:	1428      	subi      	r14, r14, 32
stm    r4-r11,   (sp)
 8010682:	d48e1c27 	stm      	r4-r11, (r14)
subi   sp, sp, 8
 8010686:	1422      	subi      	r14, r14, 8
mfcr   r0, CR<4,0>
 8010688:	c0046020 	mfcr      	r0, cr<4, 0>
mfcr   r1, CR<2,0> 
 801068c:	c0026021 	mfcr      	r1, cr<2, 0>
stm    r0-r1,    (sp)
 8010690:	d40e1c21 	stm      	r0-r1, (r14)
///更新堆栈地址到thread->sp
st.w   sp, (r3,0)
 8010694:	ddc32000 	st.w      	r14, (r3, 0x0)

08010698 <_to_thread3>:

///恢复to线程上下文
_to_thread3:
lrw    r2, rt_interrupt_to_thread
 8010698:	104f      	lrw      	r2, 0x20035af0	// 80106d4 <_enable_ie_ee+0x14>
ld.w   r0,  (r2,0)
 801069a:	9200      	ld.w      	r0, (r2, 0x0)
ld.w   sp,  (r0,0)
 801069c:	d9c02000 	ld.w      	r14, (r0, 0x0)

ldm    r0-r1,   (sp)
 80106a0:	d00e1c21 	ldm      	r0-r1, (r14)
mtcr   r0,   CR<4,0>
 80106a4:	c0006424 	mtcr      	r0, cr<4, 0>
mtcr   r1,   CR<2,0>
 80106a8:	c0016422 	mtcr      	r1, cr<2, 0>
addi   sp, sp, 8
 80106ac:	1402      	addi      	r14, r14, 8
ldm    r4-r11,  (sp)
 80106ae:	d08e1c27 	ldm      	r4-r11, (r14)
addi   sp, sp, 32
 80106b2:	1408      	addi      	r14, r14, 32
ldm    r15-r31, (sp)
 80106b4:	d1ee1c30 	ldm      	r15-r31, (r14)
addi   sp, sp, 68
 80106b8:	1411      	addi      	r14, r14, 68
fldms  fr0-fr15,(sp)
 80106ba:	f5ee3000 	fldms      	fr0-fr15, (r14)
addi   sp, sp, 64
 80106be:	1410      	addi      	r14, r14, 64

080106c0 <_enable_ie_ee>:

///开启异常中断，设置PSR备份寄存器EPSR
_enable_ie_ee:
mfcr   r0, CR<2,0>
 80106c0:	c0026020 	mfcr      	r0, cr<2, 0>
bseti  r0, 6 
 80106c4:	38a6      	bseti      	r0, 6
bseti  r0, 8
 80106c6:	38a8      	bseti      	r0, 8
mtcr   r0, CR<2,0>
 80106c8:	c0006422 	mtcr      	r0, cr<2, 0>

//出栈 R0-R3,R12-R13
ipop
 80106cc:	1463      	ipop
 80106ce:	c0004020 	rte
 80106d2:	0000      	.short	0x0000
 80106d4:	20035af0 	.long	0x20035af0
 80106d8:	20035af4 	.long	0x20035af4
 80106dc:	20035af8 	.long	0x20035af8
 80106e0:	e000ec10 	.long	0xe000ec10
 80106e4:	e000ec0c 	.long	0xe000ec0c
 80106e8:	e000ec08 	.long	0xe000ec08

080106ec <__fixunsdfsi>:
 80106ec:	14d2      	push      	r4-r5, r15
 80106ee:	3200      	movi      	r2, 0
 80106f0:	ea2341e0 	movih      	r3, 16864
 80106f4:	6d03      	mov      	r4, r0
 80106f6:	6d47      	mov      	r5, r1
 80106f8:	e00006a2 	bsr      	0x801143c	// 801143c <__gedf2>
 80106fc:	e9a00007 	bhsz      	r0, 0x801070a	// 801070a <__fixunsdfsi+0x1e>
 8010700:	6c13      	mov      	r0, r4
 8010702:	6c57      	mov      	r1, r5
 8010704:	e000070c 	bsr      	0x801151c	// 801151c <__fixdfsi>
 8010708:	1492      	pop      	r4-r5, r15
 801070a:	3200      	movi      	r2, 0
 801070c:	ea2341e0 	movih      	r3, 16864
 8010710:	6c13      	mov      	r0, r4
 8010712:	6c57      	mov      	r1, r5
 8010714:	e00004ae 	bsr      	0x8011070	// 8011070 <__subdf3>
 8010718:	e0000702 	bsr      	0x801151c	// 801151c <__fixdfsi>
 801071c:	ea238000 	movih      	r3, 32768
 8010720:	600c      	addu      	r0, r3
 8010722:	1492      	pop      	r4-r5, r15

08010724 <__udivdi3>:
 8010724:	14c5      	push      	r4-r8
 8010726:	6f4b      	mov      	r13, r2
 8010728:	6d4f      	mov      	r5, r3
 801072a:	6d03      	mov      	r4, r0
 801072c:	6f07      	mov      	r12, r1
 801072e:	e9230054 	bnez      	r3, 0x80107d6	// 80107d6 <__udivdi3+0xb2>
 8010732:	6484      	cmphs      	r1, r2
 8010734:	0870      	bt      	0x8010814	// 8010814 <__udivdi3+0xf0>
 8010736:	eb02ffff 	cmphsi      	r2, 65536
 801073a:	0cc4      	bf      	0x80108c2	// 80108c2 <__udivdi3+0x19e>
 801073c:	c6e05023 	bmaski      	r3, 24
 8010740:	648c      	cmphs      	r3, r2
 8010742:	3518      	movi      	r5, 24
 8010744:	3310      	movi      	r3, 16
 8010746:	c4a30c40 	inct      	r5, r3, 0
 801074a:	01dc      	lrw      	r6, 0x8015414	// 8010a54 <__udivdi3+0x330>
 801074c:	c4a24043 	lsr      	r3, r2, r5
 8010750:	d0660023 	ldr.b      	r3, (r6, r3 << 0)
 8010754:	614c      	addu      	r5, r3
 8010756:	3320      	movi      	r3, 32
 8010758:	60d6      	subu      	r3, r5
 801075a:	e903000c 	bez      	r3, 0x8010772	// 8010772 <__udivdi3+0x4e>
 801075e:	c462402d 	lsl      	r13, r2, r3
 8010762:	c4a04045 	lsr      	r5, r0, r5
 8010766:	c4614022 	lsl      	r2, r1, r3
 801076a:	c445242c 	or      	r12, r5, r2
 801076e:	c4604024 	lsl      	r4, r0, r3
 8010772:	c60d4841 	lsri      	r1, r13, 16
 8010776:	c42c8022 	divu      	r2, r12, r1
 801077a:	c4228423 	mult      	r3, r2, r1
 801077e:	630e      	subu      	r12, r3
 8010780:	c60c4823 	lsli      	r3, r12, 16
 8010784:	c40d55e5 	zext      	r5, r13, 15, 0
 8010788:	c604484c 	lsri      	r12, r4, 16
 801078c:	c4458420 	mult      	r0, r5, r2
 8010790:	6f0c      	or      	r12, r3
 8010792:	6430      	cmphs      	r12, r0
 8010794:	0808      	bt      	0x80107a4	// 80107a4 <__udivdi3+0x80>
 8010796:	6334      	addu      	r12, r13
 8010798:	6770      	cmphs      	r12, r13
 801079a:	5a63      	subi      	r3, r2, 1
 801079c:	0c03      	bf      	0x80107a2	// 80107a2 <__udivdi3+0x7e>
 801079e:	6430      	cmphs      	r12, r0
 80107a0:	0d56      	bf      	0x8010a4c	// 8010a4c <__udivdi3+0x328>
 80107a2:	6c8f      	mov      	r2, r3
 80107a4:	6302      	subu      	r12, r0
 80107a6:	c42c8020 	divu      	r0, r12, r1
 80107aa:	7c40      	mult      	r1, r0
 80107ac:	6306      	subu      	r12, r1
 80107ae:	c60c482c 	lsli      	r12, r12, 16
 80107b2:	c40455e4 	zext      	r4, r4, 15, 0
 80107b6:	7d40      	mult      	r5, r0
 80107b8:	6d30      	or      	r4, r12
 80107ba:	6550      	cmphs      	r4, r5
 80107bc:	6c43      	mov      	r1, r0
 80107be:	0808      	bt      	0x80107ce	// 80107ce <__udivdi3+0xaa>
 80107c0:	6134      	addu      	r4, r13
 80107c2:	6750      	cmphs      	r4, r13
 80107c4:	5863      	subi      	r3, r0, 1
 80107c6:	0d21      	bf      	0x8010a08	// 8010a08 <__udivdi3+0x2e4>
 80107c8:	6550      	cmphs      	r4, r5
 80107ca:	091f      	bt      	0x8010a08	// 8010a08 <__udivdi3+0x2e4>
 80107cc:	2901      	subi      	r1, 2
 80107ce:	4210      	lsli      	r0, r2, 16
 80107d0:	6c04      	or      	r0, r1
 80107d2:	3100      	movi      	r1, 0
 80107d4:	1485      	pop      	r4-r8
 80107d6:	64c4      	cmphs      	r1, r3
 80107d8:	0c6b      	bf      	0x80108ae	// 80108ae <__udivdi3+0x18a>
 80107da:	eb03ffff 	cmphsi      	r3, 65536
 80107de:	0c6b      	bf      	0x80108b4	// 80108b4 <__udivdi3+0x190>
 80107e0:	c6e0502c 	bmaski      	r12, 24
 80107e4:	64f0      	cmphs      	r12, r3
 80107e6:	ea0d0018 	movi      	r13, 24
 80107ea:	ea0c0010 	movi      	r12, 16
 80107ee:	c58d0c20 	incf      	r12, r13, 0
 80107f2:	0386      	lrw      	r4, 0x8015414	// 8010a54 <__udivdi3+0x330>
 80107f4:	c583404d 	lsr      	r13, r3, r12
 80107f8:	d1a4002d 	ldr.b      	r13, (r4, r13 << 0)
 80107fc:	6370      	addu      	r13, r12
 80107fe:	3520      	movi      	r5, 32
 8010800:	6176      	subu      	r5, r13
 8010802:	e925006c 	bnez      	r5, 0x80108da	// 80108da <__udivdi3+0x1b6>
 8010806:	644c      	cmphs      	r3, r1
 8010808:	0d0d      	bf      	0x8010a22	// 8010a22 <__udivdi3+0x2fe>
 801080a:	6480      	cmphs      	r0, r2
 801080c:	c4000500 	mvc      	r0
 8010810:	6c57      	mov      	r1, r5
 8010812:	1485      	pop      	r4-r8
 8010814:	e9220006 	bnez      	r2, 0x8010820	// 8010820 <__udivdi3+0xfc>
 8010818:	ea0d0001 	movi      	r13, 1
 801081c:	c44d802d 	divu      	r13, r13, r2
 8010820:	eb0dffff 	cmphsi      	r13, 65536
 8010824:	0c55      	bf      	0x80108ce	// 80108ce <__udivdi3+0x1aa>
 8010826:	c6e05023 	bmaski      	r3, 24
 801082a:	674c      	cmphs      	r3, r13
 801082c:	3518      	movi      	r5, 24
 801082e:	3310      	movi      	r3, 16
 8010830:	c4a30c40 	inct      	r5, r3, 0
 8010834:	0357      	lrw      	r2, 0x8015414	// 8010a54 <__udivdi3+0x330>
 8010836:	c4ad4043 	lsr      	r3, r13, r5
 801083a:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 801083e:	614c      	addu      	r5, r3
 8010840:	3620      	movi      	r6, 32
 8010842:	6196      	subu      	r6, r5
 8010844:	e926009f 	bnez      	r6, 0x8010982	// 8010982 <__udivdi3+0x25e>
 8010848:	c5a10082 	subu      	r2, r1, r13
 801084c:	c60d4846 	lsri      	r6, r13, 16
 8010850:	c40d55e5 	zext      	r5, r13, 15, 0
 8010854:	3101      	movi      	r1, 1
 8010856:	c4c2802c 	divu      	r12, r2, r6
 801085a:	c4cc8423 	mult      	r3, r12, r6
 801085e:	608e      	subu      	r2, r3
 8010860:	4250      	lsli      	r2, r2, 16
 8010862:	4c70      	lsri      	r3, r4, 16
 8010864:	c4ac8420 	mult      	r0, r12, r5
 8010868:	6cc8      	or      	r3, r2
 801086a:	640c      	cmphs      	r3, r0
 801086c:	0809      	bt      	0x801087e	// 801087e <__udivdi3+0x15a>
 801086e:	60f4      	addu      	r3, r13
 8010870:	674c      	cmphs      	r3, r13
 8010872:	e44c1000 	subi      	r2, r12, 1
 8010876:	0c03      	bf      	0x801087c	// 801087c <__udivdi3+0x158>
 8010878:	640c      	cmphs      	r3, r0
 801087a:	0ce5      	bf      	0x8010a44	// 8010a44 <__udivdi3+0x320>
 801087c:	6f0b      	mov      	r12, r2
 801087e:	60c2      	subu      	r3, r0
 8010880:	c4c38020 	divu      	r0, r3, r6
 8010884:	7d80      	mult      	r6, r0
 8010886:	60da      	subu      	r3, r6
 8010888:	4370      	lsli      	r3, r3, 16
 801088a:	c40455e4 	zext      	r4, r4, 15, 0
 801088e:	7d40      	mult      	r5, r0
 8010890:	6cd0      	or      	r3, r4
 8010892:	654c      	cmphs      	r3, r5
 8010894:	6c83      	mov      	r2, r0
 8010896:	0808      	bt      	0x80108a6	// 80108a6 <__udivdi3+0x182>
 8010898:	60f4      	addu      	r3, r13
 801089a:	674c      	cmphs      	r3, r13
 801089c:	2800      	subi      	r0, 1
 801089e:	0cb3      	bf      	0x8010a04	// 8010a04 <__udivdi3+0x2e0>
 80108a0:	654c      	cmphs      	r3, r5
 80108a2:	08b1      	bt      	0x8010a04	// 8010a04 <__udivdi3+0x2e0>
 80108a4:	2a01      	subi      	r2, 2
 80108a6:	c60c4820 	lsli      	r0, r12, 16
 80108aa:	6c08      	or      	r0, r2
 80108ac:	1485      	pop      	r4-r8
 80108ae:	3100      	movi      	r1, 0
 80108b0:	6c07      	mov      	r0, r1
 80108b2:	1485      	pop      	r4-r8
 80108b4:	eb0300ff 	cmphsi      	r3, 256
 80108b8:	c400050d 	mvc      	r13
 80108bc:	c46d482c 	lsli      	r12, r13, 3
 80108c0:	0799      	br      	0x80107f2	// 80107f2 <__udivdi3+0xce>
 80108c2:	eb0200ff 	cmphsi      	r2, 256
 80108c6:	3308      	movi      	r3, 8
 80108c8:	c4a30c40 	inct      	r5, r3, 0
 80108cc:	073f      	br      	0x801074a	// 801074a <__udivdi3+0x26>
 80108ce:	eb0d00ff 	cmphsi      	r13, 256
 80108d2:	3308      	movi      	r3, 8
 80108d4:	c4a30c40 	inct      	r5, r3, 0
 80108d8:	07ae      	br      	0x8010834	// 8010834 <__udivdi3+0x110>
 80108da:	c5a24046 	lsr      	r6, r2, r13
 80108de:	70d4      	lsl      	r3, r5
 80108e0:	6d8c      	or      	r6, r3
 80108e2:	c5a14044 	lsr      	r4, r1, r13
 80108e6:	4ef0      	lsri      	r7, r6, 16
 80108e8:	c4e48023 	divu      	r3, r4, r7
 80108ec:	c4a1402c 	lsl      	r12, r1, r5
 80108f0:	c5a04041 	lsr      	r1, r0, r13
 80108f4:	c4e3842d 	mult      	r13, r3, r7
 80108f8:	6c70      	or      	r1, r12
 80108fa:	6136      	subu      	r4, r13
 80108fc:	c40655ec 	zext      	r12, r6, 15, 0
 8010900:	4490      	lsli      	r4, r4, 16
 8010902:	c601484d 	lsri      	r13, r1, 16
 8010906:	c46c8428 	mult      	r8, r12, r3
 801090a:	6f50      	or      	r13, r4
 801090c:	6634      	cmphs      	r13, r8
 801090e:	7094      	lsl      	r2, r5
 8010910:	0806      	bt      	0x801091c	// 801091c <__udivdi3+0x1f8>
 8010912:	6358      	addu      	r13, r6
 8010914:	65b4      	cmphs      	r13, r6
 8010916:	5b83      	subi      	r4, r3, 1
 8010918:	088d      	bt      	0x8010a32	// 8010a32 <__udivdi3+0x30e>
 801091a:	6cd3      	mov      	r3, r4
 801091c:	6362      	subu      	r13, r8
 801091e:	c4ed8024 	divu      	r4, r13, r7
 8010922:	7dd0      	mult      	r7, r4
 8010924:	635e      	subu      	r13, r7
 8010926:	c60d482d 	lsli      	r13, r13, 16
 801092a:	c48c8427 	mult      	r7, r12, r4
 801092e:	c40155ec 	zext      	r12, r1, 15, 0
 8010932:	6f34      	or      	r12, r13
 8010934:	65f0      	cmphs      	r12, r7
 8010936:	0806      	bt      	0x8010942	// 8010942 <__udivdi3+0x21e>
 8010938:	6318      	addu      	r12, r6
 801093a:	65b0      	cmphs      	r12, r6
 801093c:	5c23      	subi      	r1, r4, 1
 801093e:	0875      	bt      	0x8010a28	// 8010a28 <__udivdi3+0x304>
 8010940:	6d07      	mov      	r4, r1
 8010942:	4370      	lsli      	r3, r3, 16
 8010944:	6cd0      	or      	r3, r4
 8010946:	c40355e1 	zext      	r1, r3, 15, 0
 801094a:	c40255e4 	zext      	r4, r2, 15, 0
 801094e:	c603484d 	lsri      	r13, r3, 16
 8010952:	4a50      	lsri      	r2, r2, 16
 8010954:	c4818426 	mult      	r6, r1, r4
 8010958:	7d34      	mult      	r4, r13
 801095a:	7c48      	mult      	r1, r2
 801095c:	7f48      	mult      	r13, r2
 801095e:	6050      	addu      	r1, r4
 8010960:	4e50      	lsri      	r2, r6, 16
 8010962:	6084      	addu      	r2, r1
 8010964:	6508      	cmphs      	r2, r4
 8010966:	631e      	subu      	r12, r7
 8010968:	0804      	bt      	0x8010970	// 8010970 <__udivdi3+0x24c>
 801096a:	ea210001 	movih      	r1, 1
 801096e:	6344      	addu      	r13, r1
 8010970:	4a30      	lsri      	r1, r2, 16
 8010972:	6344      	addu      	r13, r1
 8010974:	6770      	cmphs      	r12, r13
 8010976:	0c53      	bf      	0x8010a1c	// 8010a1c <__udivdi3+0x2f8>
 8010978:	6772      	cmpne      	r12, r13
 801097a:	0c49      	bf      	0x8010a0c	// 8010a0c <__udivdi3+0x2e8>
 801097c:	6c0f      	mov      	r0, r3
 801097e:	3100      	movi      	r1, 0
 8010980:	1485      	pop      	r4-r8
 8010982:	7358      	lsl      	r13, r6
 8010984:	c4a1404c 	lsr      	r12, r1, r5
 8010988:	c4c14022 	lsl      	r2, r1, r6
 801098c:	c4c04024 	lsl      	r4, r0, r6
 8010990:	c60d4846 	lsri      	r6, r13, 16
 8010994:	c4a04045 	lsr      	r5, r0, r5
 8010998:	c4cc8020 	divu      	r0, r12, r6
 801099c:	c4c08421 	mult      	r1, r0, r6
 80109a0:	c4452423 	or      	r3, r5, r2
 80109a4:	6306      	subu      	r12, r1
 80109a6:	c40d55e5 	zext      	r5, r13, 15, 0
 80109aa:	c60c482c 	lsli      	r12, r12, 16
 80109ae:	4b30      	lsri      	r1, r3, 16
 80109b0:	c4058422 	mult      	r2, r5, r0
 80109b4:	6c70      	or      	r1, r12
 80109b6:	6484      	cmphs      	r1, r2
 80109b8:	080a      	bt      	0x80109cc	// 80109cc <__udivdi3+0x2a8>
 80109ba:	6074      	addu      	r1, r13
 80109bc:	6744      	cmphs      	r1, r13
 80109be:	e5801000 	subi      	r12, r0, 1
 80109c2:	0c3f      	bf      	0x8010a40	// 8010a40 <__udivdi3+0x31c>
 80109c4:	6484      	cmphs      	r1, r2
 80109c6:	083d      	bt      	0x8010a40	// 8010a40 <__udivdi3+0x31c>
 80109c8:	2801      	subi      	r0, 2
 80109ca:	6074      	addu      	r1, r13
 80109cc:	604a      	subu      	r1, r2
 80109ce:	c4c1802c 	divu      	r12, r1, r6
 80109d2:	c4cc8422 	mult      	r2, r12, r6
 80109d6:	5949      	subu      	r2, r1, r2
 80109d8:	4250      	lsli      	r2, r2, 16
 80109da:	c40355e3 	zext      	r3, r3, 15, 0
 80109de:	c5858421 	mult      	r1, r5, r12
 80109e2:	6c8c      	or      	r2, r3
 80109e4:	6448      	cmphs      	r2, r1
 80109e6:	080b      	bt      	0x80109fc	// 80109fc <__udivdi3+0x2d8>
 80109e8:	60b4      	addu      	r2, r13
 80109ea:	6748      	cmphs      	r2, r13
 80109ec:	e46c1000 	subi      	r3, r12, 1
 80109f0:	0c26      	bf      	0x8010a3c	// 8010a3c <__udivdi3+0x318>
 80109f2:	6448      	cmphs      	r2, r1
 80109f4:	0824      	bt      	0x8010a3c	// 8010a3c <__udivdi3+0x318>
 80109f6:	e58c1001 	subi      	r12, r12, 2
 80109fa:	60b4      	addu      	r2, r13
 80109fc:	6086      	subu      	r2, r1
 80109fe:	4030      	lsli      	r1, r0, 16
 8010a00:	6c70      	or      	r1, r12
 8010a02:	072a      	br      	0x8010856	// 8010856 <__udivdi3+0x132>
 8010a04:	6c83      	mov      	r2, r0
 8010a06:	0750      	br      	0x80108a6	// 80108a6 <__udivdi3+0x182>
 8010a08:	6c4f      	mov      	r1, r3
 8010a0a:	06e2      	br      	0x80107ce	// 80107ce <__udivdi3+0xaa>
 8010a0c:	4250      	lsli      	r2, r2, 16
 8010a0e:	c40655e6 	zext      	r6, r6, 15, 0
 8010a12:	c4a04021 	lsl      	r1, r0, r5
 8010a16:	6098      	addu      	r2, r6
 8010a18:	6484      	cmphs      	r1, r2
 8010a1a:	0bb1      	bt      	0x801097c	// 801097c <__udivdi3+0x258>
 8010a1c:	5b03      	subi      	r0, r3, 1
 8010a1e:	3100      	movi      	r1, 0
 8010a20:	1485      	pop      	r4-r8
 8010a22:	6c57      	mov      	r1, r5
 8010a24:	3001      	movi      	r0, 1
 8010a26:	1485      	pop      	r4-r8
 8010a28:	65f0      	cmphs      	r12, r7
 8010a2a:	0b8b      	bt      	0x8010940	// 8010940 <__udivdi3+0x21c>
 8010a2c:	2c01      	subi      	r4, 2
 8010a2e:	6318      	addu      	r12, r6
 8010a30:	0789      	br      	0x8010942	// 8010942 <__udivdi3+0x21e>
 8010a32:	6634      	cmphs      	r13, r8
 8010a34:	0b73      	bt      	0x801091a	// 801091a <__udivdi3+0x1f6>
 8010a36:	2b01      	subi      	r3, 2
 8010a38:	6358      	addu      	r13, r6
 8010a3a:	0771      	br      	0x801091c	// 801091c <__udivdi3+0x1f8>
 8010a3c:	6f0f      	mov      	r12, r3
 8010a3e:	07df      	br      	0x80109fc	// 80109fc <__udivdi3+0x2d8>
 8010a40:	6c33      	mov      	r0, r12
 8010a42:	07c5      	br      	0x80109cc	// 80109cc <__udivdi3+0x2a8>
 8010a44:	e58c1001 	subi      	r12, r12, 2
 8010a48:	60f4      	addu      	r3, r13
 8010a4a:	071a      	br      	0x801087e	// 801087e <__udivdi3+0x15a>
 8010a4c:	2a01      	subi      	r2, 2
 8010a4e:	6334      	addu      	r12, r13
 8010a50:	06aa      	br      	0x80107a4	// 80107a4 <__udivdi3+0x80>
 8010a52:	0000      	.short	0x0000
 8010a54:	08015414 	.long	0x08015414

08010a58 <__umoddi3>:
 8010a58:	14c6      	push      	r4-r9
 8010a5a:	6d4b      	mov      	r5, r2
 8010a5c:	6f4f      	mov      	r13, r3
 8010a5e:	6d83      	mov      	r6, r0
 8010a60:	6f07      	mov      	r12, r1
 8010a62:	e923004a 	bnez      	r3, 0x8010af6	// 8010af6 <__umoddi3+0x9e>
 8010a66:	6484      	cmphs      	r1, r2
 8010a68:	086b      	bt      	0x8010b3e	// 8010b3e <__umoddi3+0xe6>
 8010a6a:	eb02ffff 	cmphsi      	r2, 65536
 8010a6e:	0cc0      	bf      	0x8010bee	// 8010bee <__umoddi3+0x196>
 8010a70:	c6e05023 	bmaski      	r3, 24
 8010a74:	648c      	cmphs      	r3, r2
 8010a76:	ea0d0018 	movi      	r13, 24
 8010a7a:	3310      	movi      	r3, 16
 8010a7c:	c5a30c40 	inct      	r13, r3, 0
 8010a80:	0281      	lrw      	r4, 0x8015414	// 8010d78 <__umoddi3+0x320>
 8010a82:	c5a24043 	lsr      	r3, r2, r13
 8010a86:	d0640023 	ldr.b      	r3, (r4, r3 << 0)
 8010a8a:	634c      	addu      	r13, r3
 8010a8c:	3420      	movi      	r4, 32
 8010a8e:	6136      	subu      	r4, r13
 8010a90:	e904000b 	bez      	r4, 0x8010aa6	// 8010aa6 <__umoddi3+0x4e>
 8010a94:	7050      	lsl      	r1, r4
 8010a96:	c5a0404d 	lsr      	r13, r0, r13
 8010a9a:	c4824025 	lsl      	r5, r2, r4
 8010a9e:	c42d242c 	or      	r12, r13, r1
 8010aa2:	c4804026 	lsl      	r6, r0, r4
 8010aa6:	c605484d 	lsri      	r13, r5, 16
 8010aaa:	c5ac8021 	divu      	r1, r12, r13
 8010aae:	c5a18422 	mult      	r2, r1, r13
 8010ab2:	c40555e0 	zext      	r0, r5, 15, 0
 8010ab6:	c44c0082 	subu      	r2, r12, r2
 8010aba:	c4208423 	mult      	r3, r0, r1
 8010abe:	4250      	lsli      	r2, r2, 16
 8010ac0:	4e30      	lsri      	r1, r6, 16
 8010ac2:	6c48      	or      	r1, r2
 8010ac4:	64c4      	cmphs      	r1, r3
 8010ac6:	0808      	bt      	0x8010ad6	// 8010ad6 <__umoddi3+0x7e>
 8010ac8:	6054      	addu      	r1, r5
 8010aca:	6544      	cmphs      	r1, r5
 8010acc:	0c05      	bf      	0x8010ad6	// 8010ad6 <__umoddi3+0x7e>
 8010ace:	5954      	addu      	r2, r1, r5
 8010ad0:	64c4      	cmphs      	r1, r3
 8010ad2:	c4220c20 	incf      	r1, r2, 0
 8010ad6:	604e      	subu      	r1, r3
 8010ad8:	c5a18023 	divu      	r3, r1, r13
 8010adc:	7f4c      	mult      	r13, r3
 8010ade:	6076      	subu      	r1, r13
 8010ae0:	7c0c      	mult      	r0, r3
 8010ae2:	4130      	lsli      	r1, r1, 16
 8010ae4:	c40655e3 	zext      	r3, r6, 15, 0
 8010ae8:	6cc4      	or      	r3, r1
 8010aea:	640c      	cmphs      	r3, r0
 8010aec:	0c69      	bf      	0x8010bbe	// 8010bbe <__umoddi3+0x166>
 8010aee:	5b01      	subu      	r0, r3, r0
 8010af0:	7011      	lsr      	r0, r4
 8010af2:	3100      	movi      	r1, 0
 8010af4:	1486      	pop      	r4-r9
 8010af6:	64c4      	cmphs      	r1, r3
 8010af8:	0ffe      	bf      	0x8010af4	// 8010af4 <__umoddi3+0x9c>
 8010afa:	eb03ffff 	cmphsi      	r3, 65536
 8010afe:	0c6b      	bf      	0x8010bd4	// 8010bd4 <__umoddi3+0x17c>
 8010b00:	c6e0502d 	bmaski      	r13, 24
 8010b04:	64f4      	cmphs      	r13, r3
 8010b06:	3518      	movi      	r5, 24
 8010b08:	ea0d0010 	movi      	r13, 16
 8010b0c:	c5a50c20 	incf      	r13, r5, 0
 8010b10:	03a5      	lrw      	r5, 0x8015414	// 8010d78 <__umoddi3+0x320>
 8010b12:	c5a34044 	lsr      	r4, r3, r13
 8010b16:	d0850025 	ldr.b      	r5, (r5, r4 << 0)
 8010b1a:	6174      	addu      	r5, r13
 8010b1c:	3420      	movi      	r4, 32
 8010b1e:	6116      	subu      	r4, r5
 8010b20:	e924006d 	bnez      	r4, 0x8010bfa	// 8010bfa <__umoddi3+0x1a2>
 8010b24:	644c      	cmphs      	r3, r1
 8010b26:	0c03      	bf      	0x8010b2c	// 8010b2c <__umoddi3+0xd4>
 8010b28:	6480      	cmphs      	r0, r2
 8010b2a:	0d20      	bf      	0x8010d6a	// 8010d6a <__umoddi3+0x312>
 8010b2c:	5889      	subu      	r4, r0, r2
 8010b2e:	6500      	cmphs      	r0, r4
 8010b30:	c461008c 	subu      	r12, r1, r3
 8010b34:	6443      	mvcv      	r1
 8010b36:	6306      	subu      	r12, r1
 8010b38:	6c13      	mov      	r0, r4
 8010b3a:	6c73      	mov      	r1, r12
 8010b3c:	1486      	pop      	r4-r9
 8010b3e:	e9220005 	bnez      	r2, 0x8010b48	// 8010b48 <__umoddi3+0xf0>
 8010b42:	3501      	movi      	r5, 1
 8010b44:	c4458025 	divu      	r5, r5, r2
 8010b48:	eb05ffff 	cmphsi      	r5, 65536
 8010b4c:	0c4b      	bf      	0x8010be2	// 8010be2 <__umoddi3+0x18a>
 8010b4e:	c6e05023 	bmaski      	r3, 24
 8010b52:	654c      	cmphs      	r3, r5
 8010b54:	ea0d0018 	movi      	r13, 24
 8010b58:	3310      	movi      	r3, 16
 8010b5a:	c5a30c40 	inct      	r13, r3, 0
 8010b5e:	0358      	lrw      	r2, 0x8015414	// 8010d78 <__umoddi3+0x320>
 8010b60:	c5a54043 	lsr      	r3, r5, r13
 8010b64:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 8010b68:	634c      	addu      	r13, r3
 8010b6a:	3420      	movi      	r4, 32
 8010b6c:	6136      	subu      	r4, r13
 8010b6e:	e92400af 	bnez      	r4, 0x8010ccc	// 8010ccc <__umoddi3+0x274>
 8010b72:	c4a1008c 	subu      	r12, r1, r5
 8010b76:	4df0      	lsri      	r7, r5, 16
 8010b78:	c40555e2 	zext      	r2, r5, 15, 0
 8010b7c:	c4ec8021 	divu      	r1, r12, r7
 8010b80:	c4e18423 	mult      	r3, r1, r7
 8010b84:	630e      	subu      	r12, r3
 8010b86:	c60c482c 	lsli      	r12, r12, 16
 8010b8a:	c4418423 	mult      	r3, r1, r2
 8010b8e:	4e30      	lsri      	r1, r6, 16
 8010b90:	6c70      	or      	r1, r12
 8010b92:	64c4      	cmphs      	r1, r3
 8010b94:	0808      	bt      	0x8010ba4	// 8010ba4 <__umoddi3+0x14c>
 8010b96:	6054      	addu      	r1, r5
 8010b98:	6544      	cmphs      	r1, r5
 8010b9a:	0c05      	bf      	0x8010ba4	// 8010ba4 <__umoddi3+0x14c>
 8010b9c:	5914      	addu      	r0, r1, r5
 8010b9e:	64c4      	cmphs      	r1, r3
 8010ba0:	c4200c20 	incf      	r1, r0, 0
 8010ba4:	604e      	subu      	r1, r3
 8010ba6:	c4e18020 	divu      	r0, r1, r7
 8010baa:	7dc0      	mult      	r7, r0
 8010bac:	605e      	subu      	r1, r7
 8010bae:	4130      	lsli      	r1, r1, 16
 8010bb0:	c40655e6 	zext      	r6, r6, 15, 0
 8010bb4:	7c08      	mult      	r0, r2
 8010bb6:	c4c12423 	or      	r3, r1, r6
 8010bba:	640c      	cmphs      	r3, r0
 8010bbc:	0808      	bt      	0x8010bcc	// 8010bcc <__umoddi3+0x174>
 8010bbe:	60d4      	addu      	r3, r5
 8010bc0:	654c      	cmphs      	r3, r5
 8010bc2:	0c05      	bf      	0x8010bcc	// 8010bcc <__umoddi3+0x174>
 8010bc4:	614c      	addu      	r5, r3
 8010bc6:	640c      	cmphs      	r3, r0
 8010bc8:	c4650c20 	incf      	r3, r5, 0
 8010bcc:	5b01      	subu      	r0, r3, r0
 8010bce:	7011      	lsr      	r0, r4
 8010bd0:	3100      	movi      	r1, 0
 8010bd2:	1486      	pop      	r4-r9
 8010bd4:	eb0300ff 	cmphsi      	r3, 256
 8010bd8:	c4000505 	mvc      	r5
 8010bdc:	c465482d 	lsli      	r13, r5, 3
 8010be0:	0798      	br      	0x8010b10	// 8010b10 <__umoddi3+0xb8>
 8010be2:	eb0500ff 	cmphsi      	r5, 256
 8010be6:	3308      	movi      	r3, 8
 8010be8:	c5a30c40 	inct      	r13, r3, 0
 8010bec:	07b9      	br      	0x8010b5e	// 8010b5e <__umoddi3+0x106>
 8010bee:	eb0200ff 	cmphsi      	r2, 256
 8010bf2:	3308      	movi      	r3, 8
 8010bf4:	c5a30c40 	inct      	r13, r3, 0
 8010bf8:	0744      	br      	0x8010a80	// 8010a80 <__umoddi3+0x28>
 8010bfa:	70d0      	lsl      	r3, r4
 8010bfc:	c4a24047 	lsr      	r7, r2, r5
 8010c00:	6dcc      	or      	r7, r3
 8010c02:	c4a14046 	lsr      	r6, r1, r5
 8010c06:	c481402c 	lsl      	r12, r1, r4
 8010c0a:	c4a04041 	lsr      	r1, r0, r5
 8010c0e:	6c70      	or      	r1, r12
 8010c10:	c607484c 	lsri      	r12, r7, 16
 8010c14:	c5868028 	divu      	r8, r6, r12
 8010c18:	c4824023 	lsl      	r3, r2, r4
 8010c1c:	c5888422 	mult      	r2, r8, r12
 8010c20:	618a      	subu      	r6, r2
 8010c22:	c40755ed 	zext      	r13, r7, 15, 0
 8010c26:	46d0      	lsli      	r6, r6, 16
 8010c28:	4950      	lsri      	r2, r1, 16
 8010c2a:	c50d8429 	mult      	r9, r13, r8
 8010c2e:	6c98      	or      	r2, r6
 8010c30:	6648      	cmphs      	r2, r9
 8010c32:	7010      	lsl      	r0, r4
 8010c34:	0807      	bt      	0x8010c42	// 8010c42 <__umoddi3+0x1ea>
 8010c36:	609c      	addu      	r2, r7
 8010c38:	65c8      	cmphs      	r2, r7
 8010c3a:	e4c81000 	subi      	r6, r8, 1
 8010c3e:	088a      	bt      	0x8010d52	// 8010d52 <__umoddi3+0x2fa>
 8010c40:	6e1b      	mov      	r8, r6
 8010c42:	60a6      	subu      	r2, r9
 8010c44:	c5828026 	divu      	r6, r2, r12
 8010c48:	7f18      	mult      	r12, r6
 8010c4a:	60b2      	subu      	r2, r12
 8010c4c:	4250      	lsli      	r2, r2, 16
 8010c4e:	c40155e1 	zext      	r1, r1, 15, 0
 8010c52:	7f58      	mult      	r13, r6
 8010c54:	6c48      	or      	r1, r2
 8010c56:	6744      	cmphs      	r1, r13
 8010c58:	0806      	bt      	0x8010c64	// 8010c64 <__umoddi3+0x20c>
 8010c5a:	605c      	addu      	r1, r7
 8010c5c:	65c4      	cmphs      	r1, r7
 8010c5e:	5e43      	subi      	r2, r6, 1
 8010c60:	0874      	bt      	0x8010d48	// 8010d48 <__umoddi3+0x2f0>
 8010c62:	6d8b      	mov      	r6, r2
 8010c64:	c6084822 	lsli      	r2, r8, 16
 8010c68:	6c98      	or      	r2, r6
 8010c6a:	c40255e8 	zext      	r8, r2, 15, 0
 8010c6e:	c603484c 	lsri      	r12, r3, 16
 8010c72:	4a50      	lsri      	r2, r2, 16
 8010c74:	c5a1008d 	subu      	r13, r1, r13
 8010c78:	c40355e1 	zext      	r1, r3, 15, 0
 8010c7c:	c4288426 	mult      	r6, r8, r1
 8010c80:	7c48      	mult      	r1, r2
 8010c82:	7e30      	mult      	r8, r12
 8010c84:	7cb0      	mult      	r2, r12
 8010c86:	6204      	addu      	r8, r1
 8010c88:	c606484c 	lsri      	r12, r6, 16
 8010c8c:	6320      	addu      	r12, r8
 8010c8e:	6470      	cmphs      	r12, r1
 8010c90:	0804      	bt      	0x8010c98	// 8010c98 <__umoddi3+0x240>
 8010c92:	ea210001 	movih      	r1, 1
 8010c96:	6084      	addu      	r2, r1
 8010c98:	c60c4841 	lsri      	r1, r12, 16
 8010c9c:	6048      	addu      	r1, r2
 8010c9e:	6474      	cmphs      	r13, r1
 8010ca0:	c60c482c 	lsli      	r12, r12, 16
 8010ca4:	c40655e6 	zext      	r6, r6, 15, 0
 8010ca8:	6318      	addu      	r12, r6
 8010caa:	0c46      	bf      	0x8010d36	// 8010d36 <__umoddi3+0x2de>
 8010cac:	6476      	cmpne      	r13, r1
 8010cae:	0c60      	bf      	0x8010d6e	// 8010d6e <__umoddi3+0x316>
 8010cb0:	c42d0081 	subu      	r1, r13, r1
 8010cb4:	6cf3      	mov      	r3, r12
 8010cb6:	586d      	subu      	r3, r0, r3
 8010cb8:	64c0      	cmphs      	r0, r3
 8010cba:	6743      	mvcv      	r13
 8010cbc:	6076      	subu      	r1, r13
 8010cbe:	c4a14025 	lsl      	r5, r1, r5
 8010cc2:	c4834040 	lsr      	r0, r3, r4
 8010cc6:	6c14      	or      	r0, r5
 8010cc8:	7051      	lsr      	r1, r4
 8010cca:	1486      	pop      	r4-r9
 8010ccc:	7150      	lsl      	r5, r4
 8010cce:	c5a14048 	lsr      	r8, r1, r13
 8010cd2:	4df0      	lsri      	r7, r5, 16
 8010cd4:	c5a0404d 	lsr      	r13, r0, r13
 8010cd8:	7050      	lsl      	r1, r4
 8010cda:	6c74      	or      	r1, r13
 8010cdc:	c4e8802d 	divu      	r13, r8, r7
 8010ce0:	c4ed8423 	mult      	r3, r13, r7
 8010ce4:	c40555e2 	zext      	r2, r5, 15, 0
 8010ce8:	620e      	subu      	r8, r3
 8010cea:	c5a2842c 	mult      	r12, r2, r13
 8010cee:	c6084828 	lsli      	r8, r8, 16
 8010cf2:	c601484d 	lsri      	r13, r1, 16
 8010cf6:	6f60      	or      	r13, r8
 8010cf8:	6734      	cmphs      	r13, r12
 8010cfa:	c4804026 	lsl      	r6, r0, r4
 8010cfe:	0804      	bt      	0x8010d06	// 8010d06 <__umoddi3+0x2ae>
 8010d00:	6354      	addu      	r13, r5
 8010d02:	6574      	cmphs      	r13, r5
 8010d04:	082d      	bt      	0x8010d5e	// 8010d5e <__umoddi3+0x306>
 8010d06:	6372      	subu      	r13, r12
 8010d08:	c4ed8023 	divu      	r3, r13, r7
 8010d0c:	c4e3842c 	mult      	r12, r3, r7
 8010d10:	6372      	subu      	r13, r12
 8010d12:	c60d482c 	lsli      	r12, r13, 16
 8010d16:	c40155e1 	zext      	r1, r1, 15, 0
 8010d1a:	7cc8      	mult      	r3, r2
 8010d1c:	6f04      	or      	r12, r1
 8010d1e:	64f0      	cmphs      	r12, r3
 8010d20:	0809      	bt      	0x8010d32	// 8010d32 <__umoddi3+0x2da>
 8010d22:	6314      	addu      	r12, r5
 8010d24:	6570      	cmphs      	r12, r5
 8010d26:	0c06      	bf      	0x8010d32	// 8010d32 <__umoddi3+0x2da>
 8010d28:	c4ac0021 	addu      	r1, r12, r5
 8010d2c:	64f0      	cmphs      	r12, r3
 8010d2e:	c5810c20 	incf      	r12, r1, 0
 8010d32:	630e      	subu      	r12, r3
 8010d34:	0724      	br      	0x8010b7c	// 8010b7c <__umoddi3+0x124>
 8010d36:	c46c0083 	subu      	r3, r12, r3
 8010d3a:	64f0      	cmphs      	r12, r3
 8010d3c:	605e      	subu      	r1, r7
 8010d3e:	65c3      	mvcv      	r7
 8010d40:	605e      	subu      	r1, r7
 8010d42:	c42d0081 	subu      	r1, r13, r1
 8010d46:	07b8      	br      	0x8010cb6	// 8010cb6 <__umoddi3+0x25e>
 8010d48:	6744      	cmphs      	r1, r13
 8010d4a:	0b8c      	bt      	0x8010c62	// 8010c62 <__umoddi3+0x20a>
 8010d4c:	2e01      	subi      	r6, 2
 8010d4e:	605c      	addu      	r1, r7
 8010d50:	078a      	br      	0x8010c64	// 8010c64 <__umoddi3+0x20c>
 8010d52:	6648      	cmphs      	r2, r9
 8010d54:	0b76      	bt      	0x8010c40	// 8010c40 <__umoddi3+0x1e8>
 8010d56:	e5081001 	subi      	r8, r8, 2
 8010d5a:	609c      	addu      	r2, r7
 8010d5c:	0773      	br      	0x8010c42	// 8010c42 <__umoddi3+0x1ea>
 8010d5e:	c4ad0023 	addu      	r3, r13, r5
 8010d62:	6734      	cmphs      	r13, r12
 8010d64:	c5a30c20 	incf      	r13, r3, 0
 8010d68:	07cf      	br      	0x8010d06	// 8010d06 <__umoddi3+0x2ae>
 8010d6a:	6d03      	mov      	r4, r0
 8010d6c:	06e6      	br      	0x8010b38	// 8010b38 <__umoddi3+0xe0>
 8010d6e:	6700      	cmphs      	r0, r12
 8010d70:	0fe3      	bf      	0x8010d36	// 8010d36 <__umoddi3+0x2de>
 8010d72:	6cf3      	mov      	r3, r12
 8010d74:	3100      	movi      	r1, 0
 8010d76:	07a0      	br      	0x8010cb6	// 8010cb6 <__umoddi3+0x25e>
 8010d78:	08015414 	.long	0x08015414

08010d7c <_fpadd_parts>:
 8010d7c:	14c8      	push      	r4-r11
 8010d7e:	1423      	subi      	r14, r14, 12
 8010d80:	9060      	ld.w      	r3, (r0, 0x0)
 8010d82:	3501      	movi      	r5, 1
 8010d84:	64d4      	cmphs      	r5, r3
 8010d86:	0871      	bt      	0x8010e68	// 8010e68 <_fpadd_parts+0xec>
 8010d88:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010d8c:	6714      	cmphs      	r5, r12
 8010d8e:	086f      	bt      	0x8010e6c	// 8010e6c <_fpadd_parts+0xf0>
 8010d90:	3b44      	cmpnei      	r3, 4
 8010d92:	0cef      	bf      	0x8010f70	// 8010f70 <_fpadd_parts+0x1f4>
 8010d94:	eb4c0004 	cmpnei      	r12, 4
 8010d98:	0c6a      	bf      	0x8010e6c	// 8010e6c <_fpadd_parts+0xf0>
 8010d9a:	eb4c0002 	cmpnei      	r12, 2
 8010d9e:	0cc7      	bf      	0x8010f2c	// 8010f2c <_fpadd_parts+0x1b0>
 8010da0:	3b42      	cmpnei      	r3, 2
 8010da2:	0c65      	bf      	0x8010e6c	// 8010e6c <_fpadd_parts+0xf0>
 8010da4:	9062      	ld.w      	r3, (r0, 0x8)
 8010da6:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010daa:	c583008d 	subu      	r13, r3, r12
 8010dae:	c40d0208 	abs      	r8, r13
 8010db2:	eb28003f 	cmplti      	r8, 64
 8010db6:	90c3      	ld.w      	r6, (r0, 0xc)
 8010db8:	90e4      	ld.w      	r7, (r0, 0x10)
 8010dba:	b8c0      	st.w      	r6, (r14, 0x0)
 8010dbc:	b8e1      	st.w      	r7, (r14, 0x4)
 8010dbe:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010dc2:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010dc6:	0856      	bt      	0x8010e72	// 8010e72 <_fpadd_parts+0xf6>
 8010dc8:	64f1      	cmplt      	r12, r3
 8010dca:	0cc9      	bf      	0x8010f5c	// 8010f5c <_fpadd_parts+0x1e0>
 8010dcc:	ea0a0000 	movi      	r10, 0
 8010dd0:	ea0b0000 	movi      	r11, 0
 8010dd4:	9001      	ld.w      	r0, (r0, 0x4)
 8010dd6:	9121      	ld.w      	r1, (r1, 0x4)
 8010dd8:	6442      	cmpne      	r0, r1
 8010dda:	0c82      	bf      	0x8010ede	// 8010ede <_fpadd_parts+0x162>
 8010ddc:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010de0:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010de4:	e90000b8 	bez      	r0, 0x8010f54	// 8010f54 <_fpadd_parts+0x1d8>
 8010de8:	6730      	cmphs      	r12, r12
 8010dea:	c58a010c 	subc      	r12, r10, r12
 8010dee:	c5ab010d 	subc      	r13, r11, r13
 8010df2:	e98d00c9 	blz      	r13, 0x8010f84	// 8010f84 <_fpadd_parts+0x208>
 8010df6:	3100      	movi      	r1, 0
 8010df8:	b221      	st.w      	r1, (r2, 0x4)
 8010dfa:	b262      	st.w      	r3, (r2, 0x8)
 8010dfc:	dd822003 	st.w      	r12, (r2, 0xc)
 8010e00:	dda22004 	st.w      	r13, (r2, 0x10)
 8010e04:	6c33      	mov      	r0, r12
 8010e06:	6c77      	mov      	r1, r13
 8010e08:	3840      	cmpnei      	r0, 0
 8010e0a:	c4210c81 	decf      	r1, r1, 1
 8010e0e:	2800      	subi      	r0, 1
 8010e10:	c7605023 	bmaski      	r3, 28
 8010e14:	644c      	cmphs      	r3, r1
 8010e16:	0c71      	bf      	0x8010ef8	// 8010ef8 <_fpadd_parts+0x17c>
 8010e18:	64c6      	cmpne      	r1, r3
 8010e1a:	0d0d      	bf      	0x8011034	// 8011034 <_fpadd_parts+0x2b8>
 8010e1c:	9262      	ld.w      	r3, (r2, 0x8)
 8010e1e:	3600      	movi      	r6, 0
 8010e20:	3700      	movi      	r7, 0
 8010e22:	ea0a0000 	movi      	r10, 0
 8010e26:	2b00      	subi      	r3, 1
 8010e28:	2e00      	subi      	r6, 1
 8010e2a:	2f00      	subi      	r7, 1
 8010e2c:	c7605028 	bmaski      	r8, 28
 8010e30:	e54a1001 	subi      	r10, r10, 2
 8010e34:	0403      	br      	0x8010e3a	// 8010e3a <_fpadd_parts+0xbe>
 8010e36:	6606      	cmpne      	r1, r8
 8010e38:	0c8b      	bf      	0x8010f4e	// 8010f4e <_fpadd_parts+0x1d2>
 8010e3a:	6511      	cmplt      	r4, r4
 8010e3c:	c58c0044 	addc      	r4, r12, r12
 8010e40:	c5ad0045 	addc      	r5, r13, r13
 8010e44:	6401      	cmplt      	r0, r0
 8010e46:	c4c40040 	addc      	r0, r4, r6
 8010e4a:	c4e50041 	addc      	r1, r5, r7
 8010e4e:	6460      	cmphs      	r8, r1
 8010e50:	6e4f      	mov      	r9, r3
 8010e52:	6f13      	mov      	r12, r4
 8010e54:	6f57      	mov      	r13, r5
 8010e56:	2b00      	subi      	r3, 1
 8010e58:	0bef      	bt      	0x8010e36	// 8010e36 <_fpadd_parts+0xba>
 8010e5a:	3303      	movi      	r3, 3
 8010e5c:	b283      	st.w      	r4, (r2, 0xc)
 8010e5e:	b2a4      	st.w      	r5, (r2, 0x10)
 8010e60:	dd222002 	st.w      	r9, (r2, 0x8)
 8010e64:	b260      	st.w      	r3, (r2, 0x0)
 8010e66:	6c0b      	mov      	r0, r2
 8010e68:	1403      	addi      	r14, r14, 12
 8010e6a:	1488      	pop      	r4-r11
 8010e6c:	6c07      	mov      	r0, r1
 8010e6e:	1403      	addi      	r14, r14, 12
 8010e70:	1488      	pop      	r4-r11
 8010e72:	e96d009a 	blsz      	r13, 0x8010fa6	// 8010fa6 <_fpadd_parts+0x22a>
 8010e76:	ea0d001f 	movi      	r13, 31
 8010e7a:	c42b4826 	lsli      	r6, r11, 1
 8010e7e:	6362      	subu      	r13, r8
 8010e80:	e588101f 	subi      	r12, r8, 32
 8010e84:	c5a6402d 	lsl      	r13, r6, r13
 8010e88:	c50a4046 	lsr      	r6, r10, r8
 8010e8c:	c7ec2880 	btsti      	r12, 31
 8010e90:	c58b4049 	lsr      	r9, r11, r12
 8010e94:	3400      	movi      	r4, 0
 8010e96:	6db4      	or      	r6, r13
 8010e98:	c4c90c20 	incf      	r6, r9, 0
 8010e9c:	6f53      	mov      	r13, r4
 8010e9e:	c5854029 	lsl      	r9, r5, r12
 8010ea2:	c505402c 	lsl      	r12, r5, r8
 8010ea6:	c50b4047 	lsr      	r7, r11, r8
 8010eaa:	c5a90c20 	incf      	r13, r9, 0
 8010eae:	c5840c20 	incf      	r12, r4, 0
 8010eb2:	c4e40c20 	incf      	r7, r4, 0
 8010eb6:	eb4c0000 	cmpnei      	r12, 0
 8010eba:	c5ad0c81 	decf      	r13, r13, 1
 8010ebe:	e58c1000 	subi      	r12, r12, 1
 8010ec2:	6b28      	and      	r12, r10
 8010ec4:	6b6c      	and      	r13, r11
 8010ec6:	6f34      	or      	r12, r13
 8010ec8:	eb4c0000 	cmpnei      	r12, 0
 8010ecc:	9001      	ld.w      	r0, (r0, 0x4)
 8010ece:	9121      	ld.w      	r1, (r1, 0x4)
 8010ed0:	c400050a 	mvc      	r10
 8010ed4:	6442      	cmpne      	r0, r1
 8010ed6:	6ed3      	mov      	r11, r4
 8010ed8:	6e98      	or      	r10, r6
 8010eda:	6edc      	or      	r11, r7
 8010edc:	0b80      	bt      	0x8010ddc	// 8010ddc <_fpadd_parts+0x60>
 8010ede:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010ee2:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010ee6:	6731      	cmplt      	r12, r12
 8010ee8:	6329      	addc      	r12, r10
 8010eea:	636d      	addc      	r13, r11
 8010eec:	b201      	st.w      	r0, (r2, 0x4)
 8010eee:	b262      	st.w      	r3, (r2, 0x8)
 8010ef0:	dd822003 	st.w      	r12, (r2, 0xc)
 8010ef4:	dda22004 	st.w      	r13, (r2, 0x10)
 8010ef8:	3303      	movi      	r3, 3
 8010efa:	b260      	st.w      	r3, (r2, 0x0)
 8010efc:	c7805023 	bmaski      	r3, 29
 8010f00:	674c      	cmphs      	r3, r13
 8010f02:	0812      	bt      	0x8010f26	// 8010f26 <_fpadd_parts+0x1aa>
 8010f04:	c7ed4823 	lsli      	r3, r13, 31
 8010f08:	c42c4840 	lsri      	r0, r12, 1
 8010f0c:	6c0c      	or      	r0, r3
 8010f0e:	c42d4841 	lsri      	r1, r13, 1
 8010f12:	9262      	ld.w      	r3, (r2, 0x8)
 8010f14:	e48c2001 	andi      	r4, r12, 1
 8010f18:	3500      	movi      	r5, 0
 8010f1a:	6c10      	or      	r0, r4
 8010f1c:	6c54      	or      	r1, r5
 8010f1e:	2300      	addi      	r3, 1
 8010f20:	b203      	st.w      	r0, (r2, 0xc)
 8010f22:	b224      	st.w      	r1, (r2, 0x10)
 8010f24:	b262      	st.w      	r3, (r2, 0x8)
 8010f26:	6c0b      	mov      	r0, r2
 8010f28:	1403      	addi      	r14, r14, 12
 8010f2a:	1488      	pop      	r4-r11
 8010f2c:	3b42      	cmpnei      	r3, 2
 8010f2e:	0b9d      	bt      	0x8010e68	// 8010e68 <_fpadd_parts+0xec>
 8010f30:	b260      	st.w      	r3, (r2, 0x0)
 8010f32:	9061      	ld.w      	r3, (r0, 0x4)
 8010f34:	b261      	st.w      	r3, (r2, 0x4)
 8010f36:	9062      	ld.w      	r3, (r0, 0x8)
 8010f38:	b262      	st.w      	r3, (r2, 0x8)
 8010f3a:	9063      	ld.w      	r3, (r0, 0xc)
 8010f3c:	b263      	st.w      	r3, (r2, 0xc)
 8010f3e:	9064      	ld.w      	r3, (r0, 0x10)
 8010f40:	9121      	ld.w      	r1, (r1, 0x4)
 8010f42:	b264      	st.w      	r3, (r2, 0x10)
 8010f44:	9061      	ld.w      	r3, (r0, 0x4)
 8010f46:	68c4      	and      	r3, r1
 8010f48:	b261      	st.w      	r3, (r2, 0x4)
 8010f4a:	6c0b      	mov      	r0, r2
 8010f4c:	078e      	br      	0x8010e68	// 8010e68 <_fpadd_parts+0xec>
 8010f4e:	6428      	cmphs      	r10, r0
 8010f50:	0b75      	bt      	0x8010e3a	// 8010e3a <_fpadd_parts+0xbe>
 8010f52:	0784      	br      	0x8010e5a	// 8010e5a <_fpadd_parts+0xde>
 8010f54:	6730      	cmphs      	r12, r12
 8010f56:	632b      	subc      	r12, r10
 8010f58:	636f      	subc      	r13, r11
 8010f5a:	074c      	br      	0x8010df2	// 8010df2 <_fpadd_parts+0x76>
 8010f5c:	6cf3      	mov      	r3, r12
 8010f5e:	ea0d0000 	movi      	r13, 0
 8010f62:	ea0c0000 	movi      	r12, 0
 8010f66:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010f6a:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010f6e:	0733      	br      	0x8010dd4	// 8010dd4 <_fpadd_parts+0x58>
 8010f70:	eb4c0004 	cmpnei      	r12, 4
 8010f74:	0b7a      	bt      	0x8010e68	// 8010e68 <_fpadd_parts+0xec>
 8010f76:	9041      	ld.w      	r2, (r0, 0x4)
 8010f78:	9161      	ld.w      	r3, (r1, 0x4)
 8010f7a:	64ca      	cmpne      	r2, r3
 8010f7c:	124b      	lrw      	r2, 0x8015400	// 80110a8 <__subdf3+0x38>
 8010f7e:	c4020c40 	inct      	r0, r2, 0
 8010f82:	0773      	br      	0x8010e68	// 8010e68 <_fpadd_parts+0xec>
 8010f84:	ea0a0000 	movi      	r10, 0
 8010f88:	ea0b0000 	movi      	r11, 0
 8010f8c:	3101      	movi      	r1, 1
 8010f8e:	6730      	cmphs      	r12, r12
 8010f90:	c58a010c 	subc      	r12, r10, r12
 8010f94:	c5ab010d 	subc      	r13, r11, r13
 8010f98:	b221      	st.w      	r1, (r2, 0x4)
 8010f9a:	b262      	st.w      	r3, (r2, 0x8)
 8010f9c:	dd822003 	st.w      	r12, (r2, 0xc)
 8010fa0:	dda22004 	st.w      	r13, (r2, 0x10)
 8010fa4:	0730      	br      	0x8010e04	// 8010e04 <_fpadd_parts+0x88>
 8010fa6:	e90dff17 	bez      	r13, 0x8010dd4	// 8010dd4 <_fpadd_parts+0x58>
 8010faa:	98c0      	ld.w      	r6, (r14, 0x0)
 8010fac:	98e1      	ld.w      	r7, (r14, 0x4)
 8010fae:	ea0d001f 	movi      	r13, 31
 8010fb2:	47c1      	lsli      	r6, r7, 1
 8010fb4:	6362      	subu      	r13, r8
 8010fb6:	c5a6402d 	lsl      	r13, r6, r13
 8010fba:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010fbe:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010fc2:	e588101f 	subi      	r12, r8, 32
 8010fc6:	c50d4046 	lsr      	r6, r13, r8
 8010fca:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010fce:	c7ec2880 	btsti      	r12, 31
 8010fd2:	3400      	movi      	r4, 0
 8010fd4:	c5874049 	lsr      	r9, r7, r12
 8010fd8:	6db4      	or      	r6, r13
 8010fda:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010fde:	c4c90c20 	incf      	r6, r9, 0
 8010fe2:	c50d4047 	lsr      	r7, r13, r8
 8010fe6:	c5854029 	lsl      	r9, r5, r12
 8010fea:	6f53      	mov      	r13, r4
 8010fec:	c505402c 	lsl      	r12, r5, r8
 8010ff0:	c5a90c20 	incf      	r13, r9, 0
 8010ff4:	c5840c20 	incf      	r12, r4, 0
 8010ff8:	c4e40c20 	incf      	r7, r4, 0
 8010ffc:	60e0      	addu      	r3, r8
 8010ffe:	eb4c0000 	cmpnei      	r12, 0
 8011002:	c5ad0c81 	decf      	r13, r13, 1
 8011006:	e58c1000 	subi      	r12, r12, 1
 801100a:	d90e2000 	ld.w      	r8, (r14, 0x0)
 801100e:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8011012:	6a30      	and      	r8, r12
 8011014:	6a74      	and      	r9, r13
 8011016:	6f23      	mov      	r12, r8
 8011018:	6f67      	mov      	r13, r9
 801101a:	6f34      	or      	r12, r13
 801101c:	eb4c0000 	cmpnei      	r12, 0
 8011020:	c400050c 	mvc      	r12
 8011024:	6f53      	mov      	r13, r4
 8011026:	c5862424 	or      	r4, r6, r12
 801102a:	c5a72425 	or      	r5, r7, r13
 801102e:	b880      	st.w      	r4, (r14, 0x0)
 8011030:	b8a1      	st.w      	r5, (r14, 0x4)
 8011032:	06d1      	br      	0x8010dd4	// 8010dd4 <_fpadd_parts+0x58>
 8011034:	3300      	movi      	r3, 0
 8011036:	2b01      	subi      	r3, 2
 8011038:	640c      	cmphs      	r3, r0
 801103a:	0af1      	bt      	0x8010e1c	// 8010e1c <_fpadd_parts+0xa0>
 801103c:	075e      	br      	0x8010ef8	// 8010ef8 <_fpadd_parts+0x17c>
	...

08011040 <__adddf3>:
 8011040:	14d2      	push      	r4-r5, r15
 8011042:	1433      	subi      	r14, r14, 76
 8011044:	b800      	st.w      	r0, (r14, 0x0)
 8011046:	b821      	st.w      	r1, (r14, 0x4)
 8011048:	6c3b      	mov      	r0, r14
 801104a:	6d47      	mov      	r5, r1
 801104c:	1904      	addi      	r1, r14, 16
 801104e:	b863      	st.w      	r3, (r14, 0xc)
 8011050:	b842      	st.w      	r2, (r14, 0x8)
 8011052:	e00003b7 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 8011056:	1909      	addi      	r1, r14, 36
 8011058:	1802      	addi      	r0, r14, 8
 801105a:	e00003b3 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 801105e:	1a0e      	addi      	r2, r14, 56
 8011060:	1909      	addi      	r1, r14, 36
 8011062:	1804      	addi      	r0, r14, 16
 8011064:	e3fffe8c 	bsr      	0x8010d7c	// 8010d7c <_fpadd_parts>
 8011068:	e00002e4 	bsr      	0x8011630	// 8011630 <__pack_d>
 801106c:	1413      	addi      	r14, r14, 76
 801106e:	1492      	pop      	r4-r5, r15

08011070 <__subdf3>:
 8011070:	14d2      	push      	r4-r5, r15
 8011072:	1433      	subi      	r14, r14, 76
 8011074:	b800      	st.w      	r0, (r14, 0x0)
 8011076:	b821      	st.w      	r1, (r14, 0x4)
 8011078:	6c3b      	mov      	r0, r14
 801107a:	6d47      	mov      	r5, r1
 801107c:	1904      	addi      	r1, r14, 16
 801107e:	b842      	st.w      	r2, (r14, 0x8)
 8011080:	b863      	st.w      	r3, (r14, 0xc)
 8011082:	e000039f 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 8011086:	1909      	addi      	r1, r14, 36
 8011088:	1802      	addi      	r0, r14, 8
 801108a:	e000039b 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 801108e:	986a      	ld.w      	r3, (r14, 0x28)
 8011090:	e4634001 	xori      	r3, r3, 1
 8011094:	1a0e      	addi      	r2, r14, 56
 8011096:	1909      	addi      	r1, r14, 36
 8011098:	1804      	addi      	r0, r14, 16
 801109a:	b86a      	st.w      	r3, (r14, 0x28)
 801109c:	e3fffe70 	bsr      	0x8010d7c	// 8010d7c <_fpadd_parts>
 80110a0:	e00002c8 	bsr      	0x8011630	// 8011630 <__pack_d>
 80110a4:	1413      	addi      	r14, r14, 76
 80110a6:	1492      	pop      	r4-r5, r15
 80110a8:	08015400 	.long	0x08015400

080110ac <__muldf3>:
 80110ac:	14d8      	push      	r4-r11, r15
 80110ae:	1436      	subi      	r14, r14, 88
 80110b0:	b803      	st.w      	r0, (r14, 0xc)
 80110b2:	b824      	st.w      	r1, (r14, 0x10)
 80110b4:	1803      	addi      	r0, r14, 12
 80110b6:	1907      	addi      	r1, r14, 28
 80110b8:	b866      	st.w      	r3, (r14, 0x18)
 80110ba:	b845      	st.w      	r2, (r14, 0x14)
 80110bc:	e0000382 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 80110c0:	190c      	addi      	r1, r14, 48
 80110c2:	1805      	addi      	r0, r14, 20
 80110c4:	e000037e 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 80110c8:	9867      	ld.w      	r3, (r14, 0x1c)
 80110ca:	3b01      	cmphsi      	r3, 2
 80110cc:	0ca4      	bf      	0x8011214	// 8011214 <__muldf3+0x168>
 80110ce:	984c      	ld.w      	r2, (r14, 0x30)
 80110d0:	3a01      	cmphsi      	r2, 2
 80110d2:	0c94      	bf      	0x80111fa	// 80111fa <__muldf3+0x14e>
 80110d4:	3b44      	cmpnei      	r3, 4
 80110d6:	0c9d      	bf      	0x8011210	// 8011210 <__muldf3+0x164>
 80110d8:	3a44      	cmpnei      	r2, 4
 80110da:	0c8e      	bf      	0x80111f6	// 80111f6 <__muldf3+0x14a>
 80110dc:	3b42      	cmpnei      	r3, 2
 80110de:	0c9b      	bf      	0x8011214	// 8011214 <__muldf3+0x168>
 80110e0:	3a42      	cmpnei      	r2, 2
 80110e2:	0c8c      	bf      	0x80111fa	// 80111fa <__muldf3+0x14e>
 80110e4:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 80110e8:	d90e200a 	ld.w      	r8, (r14, 0x28)
 80110ec:	3300      	movi      	r3, 0
 80110ee:	6c33      	mov      	r0, r12
 80110f0:	6ca3      	mov      	r2, r8
 80110f2:	6c4f      	mov      	r1, r3
 80110f4:	dd8e2002 	st.w      	r12, (r14, 0x8)
 80110f8:	d96e2010 	ld.w      	r11, (r14, 0x40)
 80110fc:	e0000274 	bsr      	0x80115e4	// 80115e4 <__muldi3>
 8011100:	3300      	movi      	r3, 0
 8011102:	6ca3      	mov      	r2, r8
 8011104:	6d83      	mov      	r6, r0
 8011106:	6dc7      	mov      	r7, r1
 8011108:	6c4f      	mov      	r1, r3
 801110a:	6c2f      	mov      	r0, r11
 801110c:	e000026c 	bsr      	0x80115e4	// 80115e4 <__muldi3>
 8011110:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 8011114:	3300      	movi      	r3, 0
 8011116:	6e03      	mov      	r8, r0
 8011118:	6e47      	mov      	r9, r1
 801111a:	6caf      	mov      	r2, r11
 801111c:	6c4f      	mov      	r1, r3
 801111e:	6c2b      	mov      	r0, r10
 8011120:	e0000262 	bsr      	0x80115e4	// 80115e4 <__muldi3>
 8011124:	d98e2002 	ld.w      	r12, (r14, 0x8)
 8011128:	3300      	movi      	r3, 0
 801112a:	b800      	st.w      	r0, (r14, 0x0)
 801112c:	b821      	st.w      	r1, (r14, 0x4)
 801112e:	6cb3      	mov      	r2, r12
 8011130:	6c2b      	mov      	r0, r10
 8011132:	6c4f      	mov      	r1, r3
 8011134:	e0000258 	bsr      	0x80115e4	// 80115e4 <__muldi3>
 8011138:	6401      	cmplt      	r0, r0
 801113a:	6021      	addc      	r0, r8
 801113c:	6065      	addc      	r1, r9
 801113e:	6644      	cmphs      	r1, r9
 8011140:	0c80      	bf      	0x8011240	// 8011240 <__muldf3+0x194>
 8011142:	6466      	cmpne      	r9, r1
 8011144:	0c7c      	bf      	0x801123c	// 801123c <__muldf3+0x190>
 8011146:	ea080000 	movi      	r8, 0
 801114a:	ea090000 	movi      	r9, 0
 801114e:	3200      	movi      	r2, 0
 8011150:	6cc3      	mov      	r3, r0
 8011152:	6489      	cmplt      	r2, r2
 8011154:	6099      	addc      	r2, r6
 8011156:	60dd      	addc      	r3, r7
 8011158:	65cc      	cmphs      	r3, r7
 801115a:	0c6a      	bf      	0x801122e	// 801122e <__muldf3+0x182>
 801115c:	64de      	cmpne      	r7, r3
 801115e:	0c66      	bf      	0x801122a	// 801122a <__muldf3+0x17e>
 8011160:	6f07      	mov      	r12, r1
 8011162:	ea0d0000 	movi      	r13, 0
 8011166:	9800      	ld.w      	r0, (r14, 0x0)
 8011168:	9821      	ld.w      	r1, (r14, 0x4)
 801116a:	6401      	cmplt      	r0, r0
 801116c:	6031      	addc      	r0, r12
 801116e:	6075      	addc      	r1, r13
 8011170:	6621      	cmplt      	r8, r8
 8011172:	6201      	addc      	r8, r0
 8011174:	6245      	addc      	r9, r1
 8011176:	980e      	ld.w      	r0, (r14, 0x38)
 8011178:	9829      	ld.w      	r1, (r14, 0x24)
 801117a:	6040      	addu      	r1, r0
 801117c:	590e      	addi      	r0, r1, 4
 801117e:	b813      	st.w      	r0, (r14, 0x4c)
 8011180:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011184:	980d      	ld.w      	r0, (r14, 0x34)
 8011186:	6432      	cmpne      	r12, r0
 8011188:	c780502a 	bmaski      	r10, 29
 801118c:	c4000500 	mvc      	r0
 8011190:	6668      	cmphs      	r10, r9
 8011192:	b812      	st.w      	r0, (r14, 0x48)
 8011194:	086f      	bt      	0x8011272	// 8011272 <__muldf3+0x1c6>
 8011196:	2104      	addi      	r1, 5
 8011198:	ea0c0000 	movi      	r12, 0
 801119c:	ea2d8000 	movih      	r13, 32768
 80111a0:	e4082001 	andi      	r0, r8, 1
 80111a4:	6ec7      	mov      	r11, r1
 80111a6:	e900000a 	bez      	r0, 0x80111ba	// 80111ba <__muldf3+0x10e>
 80111aa:	431f      	lsli      	r0, r3, 31
 80111ac:	4a81      	lsri      	r4, r2, 1
 80111ae:	6d00      	or      	r4, r0
 80111b0:	4ba1      	lsri      	r5, r3, 1
 80111b2:	c5842422 	or      	r2, r4, r12
 80111b6:	c5a52423 	or      	r3, r5, r13
 80111ba:	c4294840 	lsri      	r0, r9, 1
 80111be:	6428      	cmphs      	r10, r0
 80111c0:	c7e94827 	lsli      	r7, r9, 31
 80111c4:	c4284846 	lsri      	r6, r8, 1
 80111c8:	c4c72428 	or      	r8, r7, r6
 80111cc:	6e43      	mov      	r9, r0
 80111ce:	2100      	addi      	r1, 1
 80111d0:	0fe8      	bf      	0x80111a0	// 80111a0 <__muldf3+0xf4>
 80111d2:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 80111d6:	e42820ff 	andi      	r1, r8, 255
 80111da:	eb410080 	cmpnei      	r1, 128
 80111de:	0c36      	bf      	0x801124a	// 801124a <__muldf3+0x19e>
 80111e0:	3303      	movi      	r3, 3
 80111e2:	dd0e2014 	st.w      	r8, (r14, 0x50)
 80111e6:	dd2e2015 	st.w      	r9, (r14, 0x54)
 80111ea:	b871      	st.w      	r3, (r14, 0x44)
 80111ec:	1811      	addi      	r0, r14, 68
 80111ee:	e0000221 	bsr      	0x8011630	// 8011630 <__pack_d>
 80111f2:	1416      	addi      	r14, r14, 88
 80111f4:	1498      	pop      	r4-r11, r15
 80111f6:	3b42      	cmpnei      	r3, 2
 80111f8:	0c3b      	bf      	0x801126e	// 801126e <__muldf3+0x1c2>
 80111fa:	986d      	ld.w      	r3, (r14, 0x34)
 80111fc:	9848      	ld.w      	r2, (r14, 0x20)
 80111fe:	64ca      	cmpne      	r2, r3
 8011200:	c4000503 	mvc      	r3
 8011204:	180c      	addi      	r0, r14, 48
 8011206:	b86d      	st.w      	r3, (r14, 0x34)
 8011208:	e0000214 	bsr      	0x8011630	// 8011630 <__pack_d>
 801120c:	1416      	addi      	r14, r14, 88
 801120e:	1498      	pop      	r4-r11, r15
 8011210:	3a42      	cmpnei      	r2, 2
 8011212:	0c2e      	bf      	0x801126e	// 801126e <__muldf3+0x1c2>
 8011214:	9848      	ld.w      	r2, (r14, 0x20)
 8011216:	986d      	ld.w      	r3, (r14, 0x34)
 8011218:	64ca      	cmpne      	r2, r3
 801121a:	c4000503 	mvc      	r3
 801121e:	1807      	addi      	r0, r14, 28
 8011220:	b868      	st.w      	r3, (r14, 0x20)
 8011222:	e0000207 	bsr      	0x8011630	// 8011630 <__pack_d>
 8011226:	1416      	addi      	r14, r14, 88
 8011228:	1498      	pop      	r4-r11, r15
 801122a:	6588      	cmphs      	r2, r6
 801122c:	0b9a      	bt      	0x8011160	// 8011160 <__muldf3+0xb4>
 801122e:	e5080000 	addi      	r8, r8, 1
 8011232:	eb480000 	cmpnei      	r8, 0
 8011236:	c5290c21 	incf      	r9, r9, 1
 801123a:	0793      	br      	0x8011160	// 8011160 <__muldf3+0xb4>
 801123c:	6600      	cmphs      	r0, r8
 801123e:	0b84      	bt      	0x8011146	// 8011146 <__muldf3+0x9a>
 8011240:	ea080000 	movi      	r8, 0
 8011244:	ea090001 	movi      	r9, 1
 8011248:	0783      	br      	0x801114e	// 801114e <__muldf3+0xa2>
 801124a:	e4282100 	andi      	r1, r8, 256
 801124e:	e921ffc9 	bnez      	r1, 0x80111e0	// 80111e0 <__muldf3+0x134>
 8011252:	6c8c      	or      	r2, r3
 8011254:	e902ffc6 	bez      	r2, 0x80111e0	// 80111e0 <__muldf3+0x134>
 8011258:	3280      	movi      	r2, 128
 801125a:	3300      	movi      	r3, 0
 801125c:	3100      	movi      	r1, 0
 801125e:	6489      	cmplt      	r2, r2
 8011260:	60a1      	addc      	r2, r8
 8011262:	60e5      	addc      	r3, r9
 8011264:	29ff      	subi      	r1, 256
 8011266:	c4222028 	and      	r8, r2, r1
 801126a:	6e4f      	mov      	r9, r3
 801126c:	07ba      	br      	0x80111e0	// 80111e0 <__muldf3+0x134>
 801126e:	100f      	lrw      	r0, 0x8015400	// 80112a8 <__muldf3+0x1fc>
 8011270:	07bf      	br      	0x80111ee	// 80111ee <__muldf3+0x142>
 8011272:	c760502c 	bmaski      	r12, 28
 8011276:	6670      	cmphs      	r12, r9
 8011278:	0faf      	bf      	0x80111d6	// 80111d6 <__muldf3+0x12a>
 801127a:	2102      	addi      	r1, 3
 801127c:	3401      	movi      	r4, 1
 801127e:	3500      	movi      	r5, 0
 8011280:	6da3      	mov      	r6, r8
 8011282:	6de7      	mov      	r7, r9
 8011284:	6c07      	mov      	r0, r1
 8011286:	6621      	cmplt      	r8, r8
 8011288:	6219      	addc      	r8, r6
 801128a:	625d      	addc      	r9, r7
 801128c:	e9a30004 	bhsz      	r3, 0x8011294	// 8011294 <__muldf3+0x1e8>
 8011290:	6e10      	or      	r8, r4
 8011292:	6e54      	or      	r9, r5
 8011294:	6d8b      	mov      	r6, r2
 8011296:	6dcf      	mov      	r7, r3
 8011298:	6489      	cmplt      	r2, r2
 801129a:	6099      	addc      	r2, r6
 801129c:	60dd      	addc      	r3, r7
 801129e:	6670      	cmphs      	r12, r9
 80112a0:	2900      	subi      	r1, 1
 80112a2:	0bef      	bt      	0x8011280	// 8011280 <__muldf3+0x1d4>
 80112a4:	b813      	st.w      	r0, (r14, 0x4c)
 80112a6:	0798      	br      	0x80111d6	// 80111d6 <__muldf3+0x12a>
 80112a8:	08015400 	.long	0x08015400

080112ac <__divdf3>:
 80112ac:	14d6      	push      	r4-r9, r15
 80112ae:	142e      	subi      	r14, r14, 56
 80112b0:	b800      	st.w      	r0, (r14, 0x0)
 80112b2:	b821      	st.w      	r1, (r14, 0x4)
 80112b4:	6c3b      	mov      	r0, r14
 80112b6:	1904      	addi      	r1, r14, 16
 80112b8:	b863      	st.w      	r3, (r14, 0xc)
 80112ba:	b842      	st.w      	r2, (r14, 0x8)
 80112bc:	e0000282 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 80112c0:	1909      	addi      	r1, r14, 36
 80112c2:	1802      	addi      	r0, r14, 8
 80112c4:	e000027e 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 80112c8:	9864      	ld.w      	r3, (r14, 0x10)
 80112ca:	3b01      	cmphsi      	r3, 2
 80112cc:	0c51      	bf      	0x801136e	// 801136e <__divdf3+0xc2>
 80112ce:	9829      	ld.w      	r1, (r14, 0x24)
 80112d0:	3201      	movi      	r2, 1
 80112d2:	6448      	cmphs      	r2, r1
 80112d4:	0873      	bt      	0x80113ba	// 80113ba <__divdf3+0x10e>
 80112d6:	9845      	ld.w      	r2, (r14, 0x14)
 80112d8:	980a      	ld.w      	r0, (r14, 0x28)
 80112da:	3b44      	cmpnei      	r3, 4
 80112dc:	6c81      	xor      	r2, r0
 80112de:	b845      	st.w      	r2, (r14, 0x14)
 80112e0:	0c4c      	bf      	0x8011378	// 8011378 <__divdf3+0xcc>
 80112e2:	3b42      	cmpnei      	r3, 2
 80112e4:	0c4a      	bf      	0x8011378	// 8011378 <__divdf3+0xcc>
 80112e6:	3944      	cmpnei      	r1, 4
 80112e8:	0c4c      	bf      	0x8011380	// 8011380 <__divdf3+0xd4>
 80112ea:	3942      	cmpnei      	r1, 2
 80112ec:	0c63      	bf      	0x80113b2	// 80113b2 <__divdf3+0x106>
 80112ee:	9807      	ld.w      	r0, (r14, 0x1c)
 80112f0:	9828      	ld.w      	r1, (r14, 0x20)
 80112f2:	98cc      	ld.w      	r6, (r14, 0x30)
 80112f4:	98ed      	ld.w      	r7, (r14, 0x34)
 80112f6:	9866      	ld.w      	r3, (r14, 0x18)
 80112f8:	984b      	ld.w      	r2, (r14, 0x2c)
 80112fa:	65c4      	cmphs      	r1, r7
 80112fc:	60ca      	subu      	r3, r2
 80112fe:	b866      	st.w      	r3, (r14, 0x18)
 8011300:	0c05      	bf      	0x801130a	// 801130a <__divdf3+0x5e>
 8011302:	645e      	cmpne      	r7, r1
 8011304:	080a      	bt      	0x8011318	// 8011318 <__divdf3+0x6c>
 8011306:	6580      	cmphs      	r0, r6
 8011308:	0808      	bt      	0x8011318	// 8011318 <__divdf3+0x6c>
 801130a:	6f03      	mov      	r12, r0
 801130c:	6f47      	mov      	r13, r1
 801130e:	2b00      	subi      	r3, 1
 8011310:	6401      	cmplt      	r0, r0
 8011312:	6031      	addc      	r0, r12
 8011314:	6075      	addc      	r1, r13
 8011316:	b866      	st.w      	r3, (r14, 0x18)
 8011318:	ea0c003d 	movi      	r12, 61
 801131c:	3400      	movi      	r4, 0
 801131e:	3500      	movi      	r5, 0
 8011320:	3200      	movi      	r2, 0
 8011322:	ea231000 	movih      	r3, 4096
 8011326:	65c4      	cmphs      	r1, r7
 8011328:	0c0a      	bf      	0x801133c	// 801133c <__divdf3+0x90>
 801132a:	645e      	cmpne      	r7, r1
 801132c:	0803      	bt      	0x8011332	// 8011332 <__divdf3+0x86>
 801132e:	6580      	cmphs      	r0, r6
 8011330:	0c06      	bf      	0x801133c	// 801133c <__divdf3+0x90>
 8011332:	6d08      	or      	r4, r2
 8011334:	6d4c      	or      	r5, r3
 8011336:	6400      	cmphs      	r0, r0
 8011338:	601b      	subc      	r0, r6
 801133a:	605f      	subc      	r1, r7
 801133c:	c7e34829 	lsli      	r9, r3, 31
 8011340:	c4224848 	lsri      	r8, r2, 1
 8011344:	c423484d 	lsri      	r13, r3, 1
 8011348:	c5092422 	or      	r2, r9, r8
 801134c:	e58c1000 	subi      	r12, r12, 1
 8011350:	6e03      	mov      	r8, r0
 8011352:	6e47      	mov      	r9, r1
 8011354:	6cf7      	mov      	r3, r13
 8011356:	6401      	cmplt      	r0, r0
 8011358:	6021      	addc      	r0, r8
 801135a:	6065      	addc      	r1, r9
 801135c:	e92cffe5 	bnez      	r12, 0x8011326	// 8011326 <__divdf3+0x7a>
 8011360:	e46420ff 	andi      	r3, r4, 255
 8011364:	eb430080 	cmpnei      	r3, 128
 8011368:	0c13      	bf      	0x801138e	// 801138e <__divdf3+0xe2>
 801136a:	b887      	st.w      	r4, (r14, 0x1c)
 801136c:	b8a8      	st.w      	r5, (r14, 0x20)
 801136e:	1804      	addi      	r0, r14, 16
 8011370:	e0000160 	bsr      	0x8011630	// 8011630 <__pack_d>
 8011374:	140e      	addi      	r14, r14, 56
 8011376:	1496      	pop      	r4-r9, r15
 8011378:	644e      	cmpne      	r3, r1
 801137a:	0bfa      	bt      	0x801136e	// 801136e <__divdf3+0xc2>
 801137c:	1011      	lrw      	r0, 0x8015400	// 80113c0 <__divdf3+0x114>
 801137e:	07f9      	br      	0x8011370	// 8011370 <__divdf3+0xc4>
 8011380:	3300      	movi      	r3, 0
 8011382:	3400      	movi      	r4, 0
 8011384:	b867      	st.w      	r3, (r14, 0x1c)
 8011386:	b888      	st.w      	r4, (r14, 0x20)
 8011388:	b866      	st.w      	r3, (r14, 0x18)
 801138a:	1804      	addi      	r0, r14, 16
 801138c:	07f2      	br      	0x8011370	// 8011370 <__divdf3+0xc4>
 801138e:	e4642100 	andi      	r3, r4, 256
 8011392:	e923ffec 	bnez      	r3, 0x801136a	// 801136a <__divdf3+0xbe>
 8011396:	6c04      	or      	r0, r1
 8011398:	e900ffe9 	bez      	r0, 0x801136a	// 801136a <__divdf3+0xbe>
 801139c:	3280      	movi      	r2, 128
 801139e:	3300      	movi      	r3, 0
 80113a0:	3100      	movi      	r1, 0
 80113a2:	6489      	cmplt      	r2, r2
 80113a4:	6091      	addc      	r2, r4
 80113a6:	60d5      	addc      	r3, r5
 80113a8:	29ff      	subi      	r1, 256
 80113aa:	c4222024 	and      	r4, r2, r1
 80113ae:	6d4f      	mov      	r5, r3
 80113b0:	07dd      	br      	0x801136a	// 801136a <__divdf3+0xbe>
 80113b2:	3304      	movi      	r3, 4
 80113b4:	b864      	st.w      	r3, (r14, 0x10)
 80113b6:	1804      	addi      	r0, r14, 16
 80113b8:	07dc      	br      	0x8011370	// 8011370 <__divdf3+0xc4>
 80113ba:	1809      	addi      	r0, r14, 36
 80113bc:	07da      	br      	0x8011370	// 8011370 <__divdf3+0xc4>
 80113be:	0000      	.short	0x0000
 80113c0:	08015400 	.long	0x08015400

080113c4 <__nedf2>:
 80113c4:	14d2      	push      	r4-r5, r15
 80113c6:	142e      	subi      	r14, r14, 56
 80113c8:	b800      	st.w      	r0, (r14, 0x0)
 80113ca:	b821      	st.w      	r1, (r14, 0x4)
 80113cc:	6c3b      	mov      	r0, r14
 80113ce:	6d47      	mov      	r5, r1
 80113d0:	1904      	addi      	r1, r14, 16
 80113d2:	b863      	st.w      	r3, (r14, 0xc)
 80113d4:	b842      	st.w      	r2, (r14, 0x8)
 80113d6:	e00001f5 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 80113da:	1802      	addi      	r0, r14, 8
 80113dc:	1909      	addi      	r1, r14, 36
 80113de:	e00001f1 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 80113e2:	9864      	ld.w      	r3, (r14, 0x10)
 80113e4:	3001      	movi      	r0, 1
 80113e6:	64c0      	cmphs      	r0, r3
 80113e8:	0808      	bt      	0x80113f8	// 80113f8 <__nedf2+0x34>
 80113ea:	9869      	ld.w      	r3, (r14, 0x24)
 80113ec:	64c0      	cmphs      	r0, r3
 80113ee:	0805      	bt      	0x80113f8	// 80113f8 <__nedf2+0x34>
 80113f0:	1909      	addi      	r1, r14, 36
 80113f2:	1804      	addi      	r0, r14, 16
 80113f4:	e0000258 	bsr      	0x80118a4	// 80118a4 <__fpcmp_parts_d>
 80113f8:	140e      	addi      	r14, r14, 56
 80113fa:	1492      	pop      	r4-r5, r15

080113fc <__gtdf2>:
 80113fc:	14d2      	push      	r4-r5, r15
 80113fe:	142e      	subi      	r14, r14, 56
 8011400:	b800      	st.w      	r0, (r14, 0x0)
 8011402:	b821      	st.w      	r1, (r14, 0x4)
 8011404:	6c3b      	mov      	r0, r14
 8011406:	6d47      	mov      	r5, r1
 8011408:	1904      	addi      	r1, r14, 16
 801140a:	b842      	st.w      	r2, (r14, 0x8)
 801140c:	b863      	st.w      	r3, (r14, 0xc)
 801140e:	e00001d9 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 8011412:	1909      	addi      	r1, r14, 36
 8011414:	1802      	addi      	r0, r14, 8
 8011416:	e00001d5 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 801141a:	9844      	ld.w      	r2, (r14, 0x10)
 801141c:	3301      	movi      	r3, 1
 801141e:	648c      	cmphs      	r3, r2
 8011420:	080a      	bt      	0x8011434	// 8011434 <__gtdf2+0x38>
 8011422:	9849      	ld.w      	r2, (r14, 0x24)
 8011424:	648c      	cmphs      	r3, r2
 8011426:	0807      	bt      	0x8011434	// 8011434 <__gtdf2+0x38>
 8011428:	1909      	addi      	r1, r14, 36
 801142a:	1804      	addi      	r0, r14, 16
 801142c:	e000023c 	bsr      	0x80118a4	// 80118a4 <__fpcmp_parts_d>
 8011430:	140e      	addi      	r14, r14, 56
 8011432:	1492      	pop      	r4-r5, r15
 8011434:	3000      	movi      	r0, 0
 8011436:	2800      	subi      	r0, 1
 8011438:	140e      	addi      	r14, r14, 56
 801143a:	1492      	pop      	r4-r5, r15

0801143c <__gedf2>:
 801143c:	14d2      	push      	r4-r5, r15
 801143e:	142e      	subi      	r14, r14, 56
 8011440:	b800      	st.w      	r0, (r14, 0x0)
 8011442:	b821      	st.w      	r1, (r14, 0x4)
 8011444:	6c3b      	mov      	r0, r14
 8011446:	6d47      	mov      	r5, r1
 8011448:	1904      	addi      	r1, r14, 16
 801144a:	b842      	st.w      	r2, (r14, 0x8)
 801144c:	b863      	st.w      	r3, (r14, 0xc)
 801144e:	e00001b9 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 8011452:	1909      	addi      	r1, r14, 36
 8011454:	1802      	addi      	r0, r14, 8
 8011456:	e00001b5 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 801145a:	9844      	ld.w      	r2, (r14, 0x10)
 801145c:	3301      	movi      	r3, 1
 801145e:	648c      	cmphs      	r3, r2
 8011460:	080a      	bt      	0x8011474	// 8011474 <__gedf2+0x38>
 8011462:	9849      	ld.w      	r2, (r14, 0x24)
 8011464:	648c      	cmphs      	r3, r2
 8011466:	0807      	bt      	0x8011474	// 8011474 <__gedf2+0x38>
 8011468:	1909      	addi      	r1, r14, 36
 801146a:	1804      	addi      	r0, r14, 16
 801146c:	e000021c 	bsr      	0x80118a4	// 80118a4 <__fpcmp_parts_d>
 8011470:	140e      	addi      	r14, r14, 56
 8011472:	1492      	pop      	r4-r5, r15
 8011474:	3000      	movi      	r0, 0
 8011476:	2800      	subi      	r0, 1
 8011478:	140e      	addi      	r14, r14, 56
 801147a:	1492      	pop      	r4-r5, r15

0801147c <__ltdf2>:
 801147c:	14d2      	push      	r4-r5, r15
 801147e:	142e      	subi      	r14, r14, 56
 8011480:	b800      	st.w      	r0, (r14, 0x0)
 8011482:	b821      	st.w      	r1, (r14, 0x4)
 8011484:	6c3b      	mov      	r0, r14
 8011486:	6d47      	mov      	r5, r1
 8011488:	1904      	addi      	r1, r14, 16
 801148a:	b863      	st.w      	r3, (r14, 0xc)
 801148c:	b842      	st.w      	r2, (r14, 0x8)
 801148e:	e0000199 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 8011492:	1802      	addi      	r0, r14, 8
 8011494:	1909      	addi      	r1, r14, 36
 8011496:	e0000195 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 801149a:	9864      	ld.w      	r3, (r14, 0x10)
 801149c:	3001      	movi      	r0, 1
 801149e:	64c0      	cmphs      	r0, r3
 80114a0:	0808      	bt      	0x80114b0	// 80114b0 <__ltdf2+0x34>
 80114a2:	9869      	ld.w      	r3, (r14, 0x24)
 80114a4:	64c0      	cmphs      	r0, r3
 80114a6:	0805      	bt      	0x80114b0	// 80114b0 <__ltdf2+0x34>
 80114a8:	1909      	addi      	r1, r14, 36
 80114aa:	1804      	addi      	r0, r14, 16
 80114ac:	e00001fc 	bsr      	0x80118a4	// 80118a4 <__fpcmp_parts_d>
 80114b0:	140e      	addi      	r14, r14, 56
 80114b2:	1492      	pop      	r4-r5, r15

080114b4 <__floatsidf>:
 80114b4:	14d0      	push      	r15
 80114b6:	1425      	subi      	r14, r14, 20
 80114b8:	3303      	movi      	r3, 3
 80114ba:	b860      	st.w      	r3, (r14, 0x0)
 80114bc:	487f      	lsri      	r3, r0, 31
 80114be:	b861      	st.w      	r3, (r14, 0x4)
 80114c0:	e9200009 	bnez      	r0, 0x80114d2	// 80114d2 <__floatsidf+0x1e>
 80114c4:	3302      	movi      	r3, 2
 80114c6:	b860      	st.w      	r3, (r14, 0x0)
 80114c8:	6c3b      	mov      	r0, r14
 80114ca:	e00000b3 	bsr      	0x8011630	// 8011630 <__pack_d>
 80114ce:	1405      	addi      	r14, r14, 20
 80114d0:	1490      	pop      	r15
 80114d2:	e9a00008 	bhsz      	r0, 0x80114e2	// 80114e2 <__floatsidf+0x2e>
 80114d6:	ea238000 	movih      	r3, 32768
 80114da:	64c2      	cmpne      	r0, r3
 80114dc:	0c1c      	bf      	0x8011514	// 8011514 <__floatsidf+0x60>
 80114de:	3300      	movi      	r3, 0
 80114e0:	5b01      	subu      	r0, r3, r0
 80114e2:	c4007c42 	ff1      	r2, r0
 80114e6:	e422001c 	addi      	r1, r2, 29
 80114ea:	ea0c001f 	movi      	r12, 31
 80114ee:	2a02      	subi      	r2, 3
 80114f0:	4861      	lsri      	r3, r0, 1
 80114f2:	6306      	subu      	r12, r1
 80114f4:	c440402d 	lsl      	r13, r0, r2
 80114f8:	3adf      	btsti      	r2, 31
 80114fa:	70f1      	lsr      	r3, r12
 80114fc:	c46d0c20 	incf      	r3, r13, 0
 8011500:	7004      	lsl      	r0, r1
 8011502:	b864      	st.w      	r3, (r14, 0x10)
 8011504:	3300      	movi      	r3, 0
 8011506:	c4030c20 	incf      	r0, r3, 0
 801150a:	333c      	movi      	r3, 60
 801150c:	60c6      	subu      	r3, r1
 801150e:	b803      	st.w      	r0, (r14, 0xc)
 8011510:	b862      	st.w      	r3, (r14, 0x8)
 8011512:	07db      	br      	0x80114c8	// 80114c8 <__floatsidf+0x14>
 8011514:	3000      	movi      	r0, 0
 8011516:	ea21c1e0 	movih      	r1, 49632
 801151a:	07da      	br      	0x80114ce	// 80114ce <__floatsidf+0x1a>

0801151c <__fixdfsi>:
 801151c:	14d0      	push      	r15
 801151e:	1427      	subi      	r14, r14, 28
 8011520:	b800      	st.w      	r0, (r14, 0x0)
 8011522:	b821      	st.w      	r1, (r14, 0x4)
 8011524:	6c3b      	mov      	r0, r14
 8011526:	1902      	addi      	r1, r14, 8
 8011528:	e000014c 	bsr      	0x80117c0	// 80117c0 <__unpack_d>
 801152c:	9862      	ld.w      	r3, (r14, 0x8)
 801152e:	3202      	movi      	r2, 2
 8011530:	64c8      	cmphs      	r2, r3
 8011532:	082a      	bt      	0x8011586	// 8011586 <__fixdfsi+0x6a>
 8011534:	3b44      	cmpnei      	r3, 4
 8011536:	0c06      	bf      	0x8011542	// 8011542 <__fixdfsi+0x26>
 8011538:	9804      	ld.w      	r0, (r14, 0x10)
 801153a:	e9800026 	blz      	r0, 0x8011586	// 8011586 <__fixdfsi+0x6a>
 801153e:	383e      	cmplti      	r0, 31
 8011540:	080a      	bt      	0x8011554	// 8011554 <__fixdfsi+0x38>
 8011542:	9863      	ld.w      	r3, (r14, 0xc)
 8011544:	3b40      	cmpnei      	r3, 0
 8011546:	c4000500 	mvc      	r0
 801154a:	c7c05023 	bmaski      	r3, 31
 801154e:	600c      	addu      	r0, r3
 8011550:	1407      	addi      	r14, r14, 28
 8011552:	1490      	pop      	r15
 8011554:	323c      	movi      	r2, 60
 8011556:	5a21      	subu      	r1, r2, r0
 8011558:	e581101f 	subi      	r12, r1, 32
 801155c:	9866      	ld.w      	r3, (r14, 0x18)
 801155e:	321f      	movi      	r2, 31
 8011560:	c5834040 	lsr      	r0, r3, r12
 8011564:	6086      	subu      	r2, r1
 8011566:	4361      	lsli      	r3, r3, 1
 8011568:	70c8      	lsl      	r3, r2
 801156a:	9845      	ld.w      	r2, (r14, 0x14)
 801156c:	7085      	lsr      	r2, r1
 801156e:	6c8c      	or      	r2, r3
 8011570:	9863      	ld.w      	r3, (r14, 0xc)
 8011572:	c7ec2880 	btsti      	r12, 31
 8011576:	c4020c40 	inct      	r0, r2, 0
 801157a:	e903ffeb 	bez      	r3, 0x8011550	// 8011550 <__fixdfsi+0x34>
 801157e:	3300      	movi      	r3, 0
 8011580:	5b01      	subu      	r0, r3, r0
 8011582:	1407      	addi      	r14, r14, 28
 8011584:	1490      	pop      	r15
 8011586:	3000      	movi      	r0, 0
 8011588:	1407      	addi      	r14, r14, 28
 801158a:	1490      	pop      	r15

0801158c <__floatunsidf>:
 801158c:	14d1      	push      	r4, r15
 801158e:	1425      	subi      	r14, r14, 20
 8011590:	3100      	movi      	r1, 0
 8011592:	b821      	st.w      	r1, (r14, 0x4)
 8011594:	e9000020 	bez      	r0, 0x80115d4	// 80115d4 <__floatunsidf+0x48>
 8011598:	c4007c42 	ff1      	r2, r0
 801159c:	e582001c 	addi      	r12, r2, 29
 80115a0:	3303      	movi      	r3, 3
 80115a2:	ea0d001f 	movi      	r13, 31
 80115a6:	2a02      	subi      	r2, 3
 80115a8:	b860      	st.w      	r3, (r14, 0x0)
 80115aa:	6372      	subu      	r13, r12
 80115ac:	4861      	lsri      	r3, r0, 1
 80115ae:	c4404024 	lsl      	r4, r0, r2
 80115b2:	3adf      	btsti      	r2, 31
 80115b4:	70f5      	lsr      	r3, r13
 80115b6:	c4640c20 	incf      	r3, r4, 0
 80115ba:	7030      	lsl      	r0, r12
 80115bc:	c4010c20 	incf      	r0, r1, 0
 80115c0:	b864      	st.w      	r3, (r14, 0x10)
 80115c2:	333c      	movi      	r3, 60
 80115c4:	b803      	st.w      	r0, (r14, 0xc)
 80115c6:	60f2      	subu      	r3, r12
 80115c8:	6c3b      	mov      	r0, r14
 80115ca:	b862      	st.w      	r3, (r14, 0x8)
 80115cc:	e0000032 	bsr      	0x8011630	// 8011630 <__pack_d>
 80115d0:	1405      	addi      	r14, r14, 20
 80115d2:	1491      	pop      	r4, r15
 80115d4:	3302      	movi      	r3, 2
 80115d6:	6c3b      	mov      	r0, r14
 80115d8:	b860      	st.w      	r3, (r14, 0x0)
 80115da:	e000002b 	bsr      	0x8011630	// 8011630 <__pack_d>
 80115de:	1405      	addi      	r14, r14, 20
 80115e0:	1491      	pop      	r4, r15
	...

080115e4 <__muldi3>:
 80115e4:	14c3      	push      	r4-r6
 80115e6:	c602484d 	lsri      	r13, r2, 16
 80115ea:	c40055ec 	zext      	r12, r0, 15, 0
 80115ee:	4890      	lsri      	r4, r0, 16
 80115f0:	c40255e5 	zext      	r5, r2, 15, 0
 80115f4:	c4ac8426 	mult      	r6, r12, r5
 80115f8:	7d50      	mult      	r5, r4
 80115fa:	7f34      	mult      	r12, r13
 80115fc:	7d34      	mult      	r4, r13
 80115fe:	c4ac002d 	addu      	r13, r12, r5
 8011602:	c606484c 	lsri      	r12, r6, 16
 8011606:	6334      	addu      	r12, r13
 8011608:	6570      	cmphs      	r12, r5
 801160a:	0804      	bt      	0x8011612	// 8011612 <__muldi3+0x2e>
 801160c:	ea2d0001 	movih      	r13, 1
 8011610:	6134      	addu      	r4, r13
 8011612:	c60c484d 	lsri      	r13, r12, 16
 8011616:	7cc0      	mult      	r3, r0
 8011618:	7c48      	mult      	r1, r2
 801161a:	6134      	addu      	r4, r13
 801161c:	c60c482c 	lsli      	r12, r12, 16
 8011620:	c40655e6 	zext      	r6, r6, 15, 0
 8011624:	604c      	addu      	r1, r3
 8011626:	c4cc0020 	addu      	r0, r12, r6
 801162a:	6050      	addu      	r1, r4
 801162c:	1483      	pop      	r4-r6
	...

08011630 <__pack_d>:
 8011630:	14c5      	push      	r4-r8
 8011632:	9020      	ld.w      	r1, (r0, 0x0)
 8011634:	3901      	cmphsi      	r1, 2
 8011636:	9043      	ld.w      	r2, (r0, 0xc)
 8011638:	9064      	ld.w      	r3, (r0, 0x10)
 801163a:	d9a02001 	ld.w      	r13, (r0, 0x4)
 801163e:	0c47      	bf      	0x80116cc	// 80116cc <__pack_d+0x9c>
 8011640:	3944      	cmpnei      	r1, 4
 8011642:	0c40      	bf      	0x80116c2	// 80116c2 <__pack_d+0x92>
 8011644:	3942      	cmpnei      	r1, 2
 8011646:	0c28      	bf      	0x8011696	// 8011696 <__pack_d+0x66>
 8011648:	c4622421 	or      	r1, r2, r3
 801164c:	e9010025 	bez      	r1, 0x8011696	// 8011696 <__pack_d+0x66>
 8011650:	9022      	ld.w      	r1, (r0, 0x8)
 8011652:	ea0003fd 	movi      	r0, 1021
 8011656:	6c02      	nor      	r0, r0
 8011658:	6405      	cmplt      	r1, r0
 801165a:	0855      	bt      	0x8011704	// 8011704 <__pack_d+0xd4>
 801165c:	eb2103ff 	cmplti      	r1, 1024
 8011660:	0c31      	bf      	0x80116c2	// 80116c2 <__pack_d+0x92>
 8011662:	e40220ff 	andi      	r0, r2, 255
 8011666:	eb400080 	cmpnei      	r0, 128
 801166a:	0c43      	bf      	0x80116f0	// 80116f0 <__pack_d+0xc0>
 801166c:	347f      	movi      	r4, 127
 801166e:	3500      	movi      	r5, 0
 8011670:	6489      	cmplt      	r2, r2
 8011672:	6091      	addc      	r2, r4
 8011674:	60d5      	addc      	r3, r5
 8011676:	c7805020 	bmaski      	r0, 29
 801167a:	64c0      	cmphs      	r0, r3
 801167c:	0c19      	bf      	0x80116ae	// 80116ae <__pack_d+0x7e>
 801167e:	e58103fe 	addi      	r12, r1, 1023
 8011682:	4b28      	lsri      	r1, r3, 8
 8011684:	4398      	lsli      	r4, r3, 24
 8011686:	4a08      	lsri      	r0, r2, 8
 8011688:	c4015663 	zext      	r3, r1, 19, 0
 801168c:	6c4f      	mov      	r1, r3
 801168e:	6c10      	or      	r0, r4
 8011690:	e46c27ff 	andi      	r3, r12, 2047
 8011694:	0404      	br      	0x801169c	// 801169c <__pack_d+0x6c>
 8011696:	3300      	movi      	r3, 0
 8011698:	3000      	movi      	r0, 0
 801169a:	3100      	movi      	r1, 0
 801169c:	3200      	movi      	r2, 0
 801169e:	c4415e60 	ins      	r2, r1, 19, 0
 80116a2:	c4435d54 	ins      	r2, r3, 30, 20
 80116a6:	c44d5c1f 	ins      	r2, r13, 31, 31
 80116aa:	6c4b      	mov      	r1, r2
 80116ac:	1485      	pop      	r4-r8
 80116ae:	439f      	lsli      	r4, r3, 31
 80116b0:	c422484c 	lsri      	r12, r2, 1
 80116b4:	4b01      	lsri      	r0, r3, 1
 80116b6:	c5842422 	or      	r2, r4, r12
 80116ba:	6cc3      	mov      	r3, r0
 80116bc:	e58103ff 	addi      	r12, r1, 1024
 80116c0:	07e1      	br      	0x8011682	// 8011682 <__pack_d+0x52>
 80116c2:	ea0307ff 	movi      	r3, 2047
 80116c6:	3000      	movi      	r0, 0
 80116c8:	3100      	movi      	r1, 0
 80116ca:	07e9      	br      	0x801169c	// 801169c <__pack_d+0x6c>
 80116cc:	c703482c 	lsli      	r12, r3, 24
 80116d0:	4a48      	lsri      	r2, r2, 8
 80116d2:	c44c2420 	or      	r0, r12, r2
 80116d6:	c5035741 	zext      	r1, r3, 26, 8
 80116da:	3200      	movi      	r2, 0
 80116dc:	ea230008 	movih      	r3, 8
 80116e0:	6c08      	or      	r0, r2
 80116e2:	6c4c      	or      	r1, r3
 80116e4:	c4015663 	zext      	r3, r1, 19, 0
 80116e8:	6c4f      	mov      	r1, r3
 80116ea:	ea0307ff 	movi      	r3, 2047
 80116ee:	07d7      	br      	0x801169c	// 801169c <__pack_d+0x6c>
 80116f0:	e4022100 	andi      	r0, r2, 256
 80116f4:	e900ffc1 	bez      	r0, 0x8011676	// 8011676 <__pack_d+0x46>
 80116f8:	3480      	movi      	r4, 128
 80116fa:	3500      	movi      	r5, 0
 80116fc:	6489      	cmplt      	r2, r2
 80116fe:	6091      	addc      	r2, r4
 8011700:	60d5      	addc      	r3, r5
 8011702:	07ba      	br      	0x8011676	// 8011676 <__pack_d+0x46>
 8011704:	5825      	subu      	r1, r0, r1
 8011706:	eb210038 	cmplti      	r1, 57
 801170a:	0fc6      	bf      	0x8011696	// 8011696 <__pack_d+0x66>
 801170c:	341f      	movi      	r4, 31
 801170e:	c423482c 	lsli      	r12, r3, 1
 8011712:	6106      	subu      	r4, r1
 8011714:	e401101f 	subi      	r0, r1, 32
 8011718:	7310      	lsl      	r12, r4
 801171a:	c4224046 	lsr      	r6, r2, r1
 801171e:	38df      	btsti      	r0, 31
 8011720:	c4034045 	lsr      	r5, r3, r0
 8011724:	ea080000 	movi      	r8, 0
 8011728:	6db0      	or      	r6, r12
 801172a:	ea0c0001 	movi      	r12, 1
 801172e:	c4c50c20 	incf      	r6, r5, 0
 8011732:	c40c4020 	lsl      	r0, r12, r0
 8011736:	6d63      	mov      	r5, r8
 8011738:	c42c4024 	lsl      	r4, r12, r1
 801173c:	c4234047 	lsr      	r7, r3, r1
 8011740:	c4a00c20 	incf      	r5, r0, 0
 8011744:	c4880c20 	incf      	r4, r8, 0
 8011748:	c4e80c20 	incf      	r7, r8, 0
 801174c:	3c40      	cmpnei      	r4, 0
 801174e:	c4a50c81 	decf      	r5, r5, 1
 8011752:	2c00      	subi      	r4, 1
 8011754:	6890      	and      	r2, r4
 8011756:	68d4      	and      	r3, r5
 8011758:	6c8c      	or      	r2, r3
 801175a:	3a40      	cmpnei      	r2, 0
 801175c:	c4000502 	mvc      	r2
 8011760:	6ce3      	mov      	r3, r8
 8011762:	6d88      	or      	r6, r2
 8011764:	6dcc      	or      	r7, r3
 8011766:	e46620ff 	andi      	r3, r6, 255
 801176a:	eb430080 	cmpnei      	r3, 128
 801176e:	0814      	bt      	0x8011796	// 8011796 <__pack_d+0x166>
 8011770:	e4662100 	andi      	r3, r6, 256
 8011774:	e9230023 	bnez      	r3, 0x80117ba	// 80117ba <__pack_d+0x18a>
 8011778:	4758      	lsli      	r2, r7, 24
 801177a:	4f28      	lsri      	r1, r7, 8
 801177c:	4e08      	lsri      	r0, r6, 8
 801177e:	6c08      	or      	r0, r2
 8011780:	c4015662 	zext      	r2, r1, 19, 0
 8011784:	6c4b      	mov      	r1, r2
 8011786:	c7605022 	bmaski      	r2, 28
 801178a:	65c8      	cmphs      	r2, r7
 801178c:	0c02      	bf      	0x8011790	// 8011790 <__pack_d+0x160>
 801178e:	6f0f      	mov      	r12, r3
 8011790:	e46c2001 	andi      	r3, r12, 1
 8011794:	0784      	br      	0x801169c	// 801169c <__pack_d+0x6c>
 8011796:	327f      	movi      	r2, 127
 8011798:	3300      	movi      	r3, 0
 801179a:	6599      	cmplt      	r6, r6
 801179c:	6189      	addc      	r6, r2
 801179e:	61cd      	addc      	r7, r3
 80117a0:	4778      	lsli      	r3, r7, 24
 80117a2:	4f28      	lsri      	r1, r7, 8
 80117a4:	4e08      	lsri      	r0, r6, 8
 80117a6:	6c0c      	or      	r0, r3
 80117a8:	c4015663 	zext      	r3, r1, 19, 0
 80117ac:	6c4f      	mov      	r1, r3
 80117ae:	c7605023 	bmaski      	r3, 28
 80117b2:	65cc      	cmphs      	r3, r7
 80117b4:	0fee      	bf      	0x8011790	// 8011790 <__pack_d+0x160>
 80117b6:	6f23      	mov      	r12, r8
 80117b8:	07ec      	br      	0x8011790	// 8011790 <__pack_d+0x160>
 80117ba:	3280      	movi      	r2, 128
 80117bc:	07ee      	br      	0x8011798	// 8011798 <__pack_d+0x168>
	...

080117c0 <__unpack_d>:
 80117c0:	1421      	subi      	r14, r14, 4
 80117c2:	dd6e2000 	st.w      	r11, (r14, 0x0)
 80117c6:	8863      	ld.h      	r3, (r0, 0x6)
 80117c8:	8047      	ld.b      	r2, (r0, 0x7)
 80117ca:	c48355c3 	zext      	r3, r3, 14, 4
 80117ce:	d9802001 	ld.w      	r12, (r0, 0x4)
 80117d2:	4a47      	lsri      	r2, r2, 7
 80117d4:	d9a02000 	ld.w      	r13, (r0, 0x0)
 80117d8:	c40c566c 	zext      	r12, r12, 19, 0
 80117dc:	b141      	st.w      	r2, (r1, 0x4)
 80117de:	e9230025 	bnez      	r3, 0x8011828	// 8011828 <__unpack_d+0x68>
 80117e2:	c58d2423 	or      	r3, r13, r12
 80117e6:	e903003c 	bez      	r3, 0x801185e	// 801185e <__unpack_d+0x9e>
 80117ea:	c70d4840 	lsri      	r0, r13, 24
 80117ee:	c50c4823 	lsli      	r3, r12, 8
 80117f2:	6cc0      	or      	r3, r0
 80117f4:	3003      	movi      	r0, 3
 80117f6:	c50d4822 	lsli      	r2, r13, 8
 80117fa:	b100      	st.w      	r0, (r1, 0x0)
 80117fc:	c760502d 	bmaski      	r13, 28
 8011800:	ea0003fe 	movi      	r0, 1022
 8011804:	6c02      	nor      	r0, r0
 8011806:	6ecb      	mov      	r11, r2
 8011808:	6f0f      	mov      	r12, r3
 801180a:	6489      	cmplt      	r2, r2
 801180c:	60ad      	addc      	r2, r11
 801180e:	60f1      	addc      	r3, r12
 8011810:	64f4      	cmphs      	r13, r3
 8011812:	6f03      	mov      	r12, r0
 8011814:	2800      	subi      	r0, 1
 8011816:	0bf8      	bt      	0x8011806	// 8011806 <__unpack_d+0x46>
 8011818:	dd812002 	st.w      	r12, (r1, 0x8)
 801181c:	b143      	st.w      	r2, (r1, 0xc)
 801181e:	b164      	st.w      	r3, (r1, 0x10)
 8011820:	d96e2000 	ld.w      	r11, (r14, 0x0)
 8011824:	1401      	addi      	r14, r14, 4
 8011826:	783c      	jmp      	r15
 8011828:	eb4307ff 	cmpnei      	r3, 2047
 801182c:	0c1f      	bf      	0x801186a	// 801186a <__unpack_d+0xaa>
 801182e:	e46313fe 	subi      	r3, r3, 1023
 8011832:	b162      	st.w      	r3, (r1, 0x8)
 8011834:	3303      	movi      	r3, 3
 8011836:	c70d4840 	lsri      	r0, r13, 24
 801183a:	b160      	st.w      	r3, (r1, 0x0)
 801183c:	c50c4823 	lsli      	r3, r12, 8
 8011840:	c50d4822 	lsli      	r2, r13, 8
 8011844:	6cc0      	or      	r3, r0
 8011846:	ea0c0000 	movi      	r12, 0
 801184a:	ea2d1000 	movih      	r13, 4096
 801184e:	6cb0      	or      	r2, r12
 8011850:	6cf4      	or      	r3, r13
 8011852:	b143      	st.w      	r2, (r1, 0xc)
 8011854:	b164      	st.w      	r3, (r1, 0x10)
 8011856:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801185a:	1401      	addi      	r14, r14, 4
 801185c:	783c      	jmp      	r15
 801185e:	3302      	movi      	r3, 2
 8011860:	b160      	st.w      	r3, (r1, 0x0)
 8011862:	d96e2000 	ld.w      	r11, (r14, 0x0)
 8011866:	1401      	addi      	r14, r14, 4
 8011868:	783c      	jmp      	r15
 801186a:	c58d2423 	or      	r3, r13, r12
 801186e:	e9030018 	bez      	r3, 0x801189e	// 801189e <__unpack_d+0xde>
 8011872:	ea230008 	movih      	r3, 8
 8011876:	68f0      	and      	r3, r12
 8011878:	3b40      	cmpnei      	r3, 0
 801187a:	3201      	movi      	r2, 1
 801187c:	c4620c40 	inct      	r3, r2, 0
 8011880:	b160      	st.w      	r3, (r1, 0x0)
 8011882:	c50c482c 	lsli      	r12, r12, 8
 8011886:	c70d4843 	lsri      	r3, r13, 24
 801188a:	6f0c      	or      	r12, r3
 801188c:	c50d482d 	lsli      	r13, r13, 8
 8011890:	c76c282c 	bclri      	r12, r12, 27
 8011894:	dda12003 	st.w      	r13, (r1, 0xc)
 8011898:	dd812004 	st.w      	r12, (r1, 0x10)
 801189c:	07dd      	br      	0x8011856	// 8011856 <__unpack_d+0x96>
 801189e:	3304      	movi      	r3, 4
 80118a0:	b160      	st.w      	r3, (r1, 0x0)
 80118a2:	07da      	br      	0x8011856	// 8011856 <__unpack_d+0x96>

080118a4 <__fpcmp_parts_d>:
 80118a4:	9040      	ld.w      	r2, (r0, 0x0)
 80118a6:	3301      	movi      	r3, 1
 80118a8:	648c      	cmphs      	r3, r2
 80118aa:	0830      	bt      	0x801190a	// 801190a <__fpcmp_parts_d+0x66>
 80118ac:	d9812000 	ld.w      	r12, (r1, 0x0)
 80118b0:	670c      	cmphs      	r3, r12
 80118b2:	082c      	bt      	0x801190a	// 801190a <__fpcmp_parts_d+0x66>
 80118b4:	3a44      	cmpnei      	r2, 4
 80118b6:	0c1f      	bf      	0x80118f4	// 80118f4 <__fpcmp_parts_d+0x50>
 80118b8:	eb4c0004 	cmpnei      	r12, 4
 80118bc:	0c14      	bf      	0x80118e4	// 80118e4 <__fpcmp_parts_d+0x40>
 80118be:	3a42      	cmpnei      	r2, 2
 80118c0:	0c0f      	bf      	0x80118de	// 80118de <__fpcmp_parts_d+0x3a>
 80118c2:	eb4c0002 	cmpnei      	r12, 2
 80118c6:	0c1a      	bf      	0x80118fa	// 80118fa <__fpcmp_parts_d+0x56>
 80118c8:	9041      	ld.w      	r2, (r0, 0x4)
 80118ca:	d9812001 	ld.w      	r12, (r1, 0x4)
 80118ce:	670a      	cmpne      	r2, r12
 80118d0:	0c1f      	bf      	0x801190e	// 801190e <__fpcmp_parts_d+0x6a>
 80118d2:	3000      	movi      	r0, 0
 80118d4:	2800      	subi      	r0, 1
 80118d6:	3a40      	cmpnei      	r2, 0
 80118d8:	c4030c20 	incf      	r0, r3, 0
 80118dc:	783c      	jmp      	r15
 80118de:	eb4c0002 	cmpnei      	r12, 2
 80118e2:	0c2a      	bf      	0x8011936	// 8011936 <__fpcmp_parts_d+0x92>
 80118e4:	9141      	ld.w      	r2, (r1, 0x4)
 80118e6:	3300      	movi      	r3, 0
 80118e8:	2b00      	subi      	r3, 1
 80118ea:	3a40      	cmpnei      	r2, 0
 80118ec:	3001      	movi      	r0, 1
 80118ee:	c4030c20 	incf      	r0, r3, 0
 80118f2:	783c      	jmp      	r15
 80118f4:	eb4c0004 	cmpnei      	r12, 4
 80118f8:	0c21      	bf      	0x801193a	// 801193a <__fpcmp_parts_d+0x96>
 80118fa:	9061      	ld.w      	r3, (r0, 0x4)
 80118fc:	3000      	movi      	r0, 0
 80118fe:	3b40      	cmpnei      	r3, 0
 8011900:	2800      	subi      	r0, 1
 8011902:	3301      	movi      	r3, 1
 8011904:	c4030c20 	incf      	r0, r3, 0
 8011908:	783c      	jmp      	r15
 801190a:	6c0f      	mov      	r0, r3
 801190c:	783c      	jmp      	r15
 801190e:	d9a02002 	ld.w      	r13, (r0, 0x8)
 8011912:	d9812002 	ld.w      	r12, (r1, 0x8)
 8011916:	6771      	cmplt      	r12, r13
 8011918:	0bdd      	bt      	0x80118d2	// 80118d2 <__fpcmp_parts_d+0x2e>
 801191a:	6735      	cmplt      	r13, r12
 801191c:	0c13      	bf      	0x8011942	// 8011942 <__fpcmp_parts_d+0x9e>
 801191e:	3000      	movi      	r0, 0
 8011920:	2800      	subi      	r0, 1
 8011922:	3a40      	cmpnei      	r2, 0
 8011924:	c4030c40 	inct      	r0, r3, 0
 8011928:	07da      	br      	0x80118dc	// 80118dc <__fpcmp_parts_d+0x38>
 801192a:	644c      	cmphs      	r3, r1
 801192c:	0fdd      	bf      	0x80118e6	// 80118e6 <__fpcmp_parts_d+0x42>
 801192e:	64c6      	cmpne      	r1, r3
 8011930:	0803      	bt      	0x8011936	// 8011936 <__fpcmp_parts_d+0x92>
 8011932:	6430      	cmphs      	r12, r0
 8011934:	0fd9      	bf      	0x80118e6	// 80118e6 <__fpcmp_parts_d+0x42>
 8011936:	3000      	movi      	r0, 0
 8011938:	07d2      	br      	0x80118dc	// 80118dc <__fpcmp_parts_d+0x38>
 801193a:	9161      	ld.w      	r3, (r1, 0x4)
 801193c:	9001      	ld.w      	r0, (r0, 0x4)
 801193e:	5b01      	subu      	r0, r3, r0
 8011940:	07ce      	br      	0x80118dc	// 80118dc <__fpcmp_parts_d+0x38>
 8011942:	9064      	ld.w      	r3, (r0, 0x10)
 8011944:	d9802003 	ld.w      	r12, (r0, 0xc)
 8011948:	9103      	ld.w      	r0, (r1, 0xc)
 801194a:	9124      	ld.w      	r1, (r1, 0x10)
 801194c:	64c4      	cmphs      	r1, r3
 801194e:	0c05      	bf      	0x8011958	// 8011958 <__fpcmp_parts_d+0xb4>
 8011950:	644e      	cmpne      	r3, r1
 8011952:	0bec      	bt      	0x801192a	// 801192a <__fpcmp_parts_d+0x86>
 8011954:	6700      	cmphs      	r0, r12
 8011956:	0bea      	bt      	0x801192a	// 801192a <__fpcmp_parts_d+0x86>
 8011958:	3000      	movi      	r0, 0
 801195a:	2800      	subi      	r0, 1
 801195c:	3a40      	cmpnei      	r2, 0
 801195e:	3301      	movi      	r3, 1
 8011960:	c4030c20 	incf      	r0, r3, 0
 8011964:	07bc      	br      	0x80118dc	// 80118dc <__fpcmp_parts_d+0x38>
	...

08011968 <__GI_putchar>:
 8011968:	14d0      	push      	r15
 801196a:	1063      	lrw      	r3, 0x20000120	// 8011974 <__GI_putchar+0xc>
 801196c:	9320      	ld.w      	r1, (r3, 0x0)
 801196e:	e00000b5 	bsr      	0x8011ad8	// 8011ad8 <__GI_putc>
 8011972:	1490      	pop      	r15
 8011974:	20000120 	.long	0x20000120

08011978 <__memset_fast>:
 8011978:	7444      	zextb      	r1, r1
 801197a:	e9020023 	bez      	r2, 0x80119c0	// 80119c0 <__memset_fast+0x48>
 801197e:	6f43      	mov      	r13, r0
 8011980:	e5802003 	andi      	r12, r0, 3
 8011984:	e90c001f 	bez      	r12, 0x80119c2	// 80119c2 <__memset_fast+0x4a>
 8011988:	dc2d0000 	st.b      	r1, (r13, 0x0)
 801198c:	2a00      	subi      	r2, 1
 801198e:	e9020019 	bez      	r2, 0x80119c0	// 80119c0 <__memset_fast+0x48>
 8011992:	e5ad0000 	addi      	r13, r13, 1
 8011996:	e58d2003 	andi      	r12, r13, 3
 801199a:	e90c0014 	bez      	r12, 0x80119c2	// 80119c2 <__memset_fast+0x4a>
 801199e:	dc2d0000 	st.b      	r1, (r13, 0x0)
 80119a2:	2a00      	subi      	r2, 1
 80119a4:	e902000e 	bez      	r2, 0x80119c0	// 80119c0 <__memset_fast+0x48>
 80119a8:	e5ad0000 	addi      	r13, r13, 1
 80119ac:	e58d2003 	andi      	r12, r13, 3
 80119b0:	e90c0009 	bez      	r12, 0x80119c2	// 80119c2 <__memset_fast+0x4a>
 80119b4:	dc2d0000 	st.b      	r1, (r13, 0x0)
 80119b8:	2a00      	subi      	r2, 1
 80119ba:	e5ad0000 	addi      	r13, r13, 1
 80119be:	0402      	br      	0x80119c2	// 80119c2 <__memset_fast+0x4a>
 80119c0:	783c      	jmp      	r15
 80119c2:	4168      	lsli      	r3, r1, 8
 80119c4:	6c4c      	or      	r1, r3
 80119c6:	4170      	lsli      	r3, r1, 16
 80119c8:	6c4c      	or      	r1, r3
 80119ca:	3a2f      	cmplti      	r2, 16
 80119cc:	080e      	bt      	0x80119e8	// 80119e8 <__memset_fast+0x70>
 80119ce:	dc2d2000 	st.w      	r1, (r13, 0x0)
 80119d2:	dc2d2001 	st.w      	r1, (r13, 0x4)
 80119d6:	dc2d2002 	st.w      	r1, (r13, 0x8)
 80119da:	dc2d2003 	st.w      	r1, (r13, 0xc)
 80119de:	2a0f      	subi      	r2, 16
 80119e0:	e5ad000f 	addi      	r13, r13, 16
 80119e4:	3a2f      	cmplti      	r2, 16
 80119e6:	0ff4      	bf      	0x80119ce	// 80119ce <__memset_fast+0x56>
 80119e8:	3a23      	cmplti      	r2, 4
 80119ea:	0808      	bt      	0x80119fa	// 80119fa <__memset_fast+0x82>
 80119ec:	2a03      	subi      	r2, 4
 80119ee:	dc2d2000 	st.w      	r1, (r13, 0x0)
 80119f2:	e5ad0003 	addi      	r13, r13, 4
 80119f6:	3a23      	cmplti      	r2, 4
 80119f8:	0ffa      	bf      	0x80119ec	// 80119ec <__memset_fast+0x74>
 80119fa:	e902ffe3 	bez      	r2, 0x80119c0	// 80119c0 <__memset_fast+0x48>
 80119fe:	2a00      	subi      	r2, 1
 8011a00:	dc2d0000 	st.b      	r1, (r13, 0x0)
 8011a04:	e902ffde 	bez      	r2, 0x80119c0	// 80119c0 <__memset_fast+0x48>
 8011a08:	2a00      	subi      	r2, 1
 8011a0a:	dc2d0001 	st.b      	r1, (r13, 0x1)
 8011a0e:	e902ffd9 	bez      	r2, 0x80119c0	// 80119c0 <__memset_fast+0x48>
 8011a12:	dc2d0002 	st.b      	r1, (r13, 0x2)
 8011a16:	783c      	jmp      	r15

08011a18 <__strlen_fast>:
 8011a18:	6c43      	mov      	r1, r0
 8011a1a:	e4002003 	andi      	r0, r0, 3
 8011a1e:	e9000009 	bez      	r0, 0x8011a30	// 8011a30 <__strlen_fast+0x18>
 8011a22:	3000      	movi      	r0, 0
 8011a24:	8140      	ld.b      	r2, (r1, 0x0)
 8011a26:	e9020017 	bez      	r2, 0x8011a54	// 8011a54 <__strlen_fast+0x3c>
 8011a2a:	2100      	addi      	r1, 1
 8011a2c:	2000      	addi      	r0, 1
 8011a2e:	07fb      	br      	0x8011a24	// 8011a24 <__strlen_fast+0xc>
 8011a30:	9140      	ld.w      	r2, (r1, 0x0)
 8011a32:	680b      	tstnbz      	r2
 8011a34:	0c04      	bf      	0x8011a3c	// 8011a3c <__strlen_fast+0x24>
 8011a36:	2103      	addi      	r1, 4
 8011a38:	2003      	addi      	r0, 4
 8011a3a:	07fb      	br      	0x8011a30	// 8011a30 <__strlen_fast+0x18>
 8011a3c:	c4027103 	xtrb3      	r3, r2
 8011a40:	0c0a      	bf      	0x8011a54	// 8011a54 <__strlen_fast+0x3c>
 8011a42:	2000      	addi      	r0, 1
 8011a44:	c4027083 	xtrb2      	r3, r2
 8011a48:	0c06      	bf      	0x8011a54	// 8011a54 <__strlen_fast+0x3c>
 8011a4a:	2000      	addi      	r0, 1
 8011a4c:	c4027043 	xtrb1      	r3, r2
 8011a50:	0c02      	bf      	0x8011a54	// 8011a54 <__strlen_fast+0x3c>
 8011a52:	2000      	addi      	r0, 1
 8011a54:	783c      	jmp      	r15
	...

08011a58 <__memcpy_fast>:
 8011a58:	14c1      	push      	r4
 8011a5a:	6f03      	mov      	r12, r0
 8011a5c:	c401242d 	or      	r13, r1, r0
 8011a60:	e48d2003 	andi      	r4, r13, 3
 8011a64:	e904000e 	bez      	r4, 0x8011a80	// 8011a80 <__memcpy_fast+0x28>
 8011a68:	e902000b 	bez      	r2, 0x8011a7e	// 8011a7e <__memcpy_fast+0x26>
 8011a6c:	8160      	ld.b      	r3, (r1, 0x0)
 8011a6e:	2100      	addi      	r1, 1
 8011a70:	2a00      	subi      	r2, 1
 8011a72:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011a76:	e58c0000 	addi      	r12, r12, 1
 8011a7a:	e922fff9 	bnez      	r2, 0x8011a6c	// 8011a6c <__memcpy_fast+0x14>
 8011a7e:	1481      	pop      	r4
 8011a80:	3a2f      	cmplti      	r2, 16
 8011a82:	0815      	bt      	0x8011aac	// 8011aac <__memcpy_fast+0x54>
 8011a84:	d9a12000 	ld.w      	r13, (r1, 0x0)
 8011a88:	9161      	ld.w      	r3, (r1, 0x4)
 8011a8a:	9182      	ld.w      	r4, (r1, 0x8)
 8011a8c:	ddac2000 	st.w      	r13, (r12, 0x0)
 8011a90:	d9a12003 	ld.w      	r13, (r1, 0xc)
 8011a94:	dc6c2001 	st.w      	r3, (r12, 0x4)
 8011a98:	dc8c2002 	st.w      	r4, (r12, 0x8)
 8011a9c:	ddac2003 	st.w      	r13, (r12, 0xc)
 8011aa0:	2a0f      	subi      	r2, 16
 8011aa2:	210f      	addi      	r1, 16
 8011aa4:	e58c000f 	addi      	r12, r12, 16
 8011aa8:	3a2f      	cmplti      	r2, 16
 8011aaa:	0fed      	bf      	0x8011a84	// 8011a84 <__memcpy_fast+0x2c>
 8011aac:	3a23      	cmplti      	r2, 4
 8011aae:	080a      	bt      	0x8011ac2	// 8011ac2 <__memcpy_fast+0x6a>
 8011ab0:	9160      	ld.w      	r3, (r1, 0x0)
 8011ab2:	2a03      	subi      	r2, 4
 8011ab4:	2103      	addi      	r1, 4
 8011ab6:	dc6c2000 	st.w      	r3, (r12, 0x0)
 8011aba:	e58c0003 	addi      	r12, r12, 4
 8011abe:	3a23      	cmplti      	r2, 4
 8011ac0:	0ff8      	bf      	0x8011ab0	// 8011ab0 <__memcpy_fast+0x58>
 8011ac2:	e902ffde 	bez      	r2, 0x8011a7e	// 8011a7e <__memcpy_fast+0x26>
 8011ac6:	8160      	ld.b      	r3, (r1, 0x0)
 8011ac8:	2100      	addi      	r1, 1
 8011aca:	2a00      	subi      	r2, 1
 8011acc:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011ad0:	e58c0000 	addi      	r12, r12, 1
 8011ad4:	07f7      	br      	0x8011ac2	// 8011ac2 <__memcpy_fast+0x6a>
	...

08011ad8 <__GI_putc>:
 8011ad8:	14d0      	push      	r15
 8011ada:	e0001c1f 	bsr      	0x8015318	// 8015318 <fputc>
 8011ade:	1490      	pop      	r15

08011ae0 <HAL_GPIO_Init>:
	
	assert_param(IS_GPIO_ALL_INSTANCE(GPIOx));
	assert_param(IS_GPIO_PIN(GPIO_Init->Pin));
	assert_param(IS_GPIO_MODE(GPIO_Init->Mode));

	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011ae0:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011ae4:	e90c0044 	bez      	r12, 0x8011b6c	// 8011b6c <HAL_GPIO_Init+0x8c>
 8011ae8:	3200      	movi      	r2, 0
	{
		ioposition = (0x01 << position);
 8011aea:	ea140001 	movi      	r20, 1
			{
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
			}
			
			switch (GPIO_Init->Mode)
 8011aee:	ea96001f 	lrw      	r22, 0x8015514	// 8011b68 <HAL_GPIO_Init+0x88>
 8011af2:	0406      	br      	0x8011afe	// 8011afe <HAL_GPIO_Init+0x1e>
			{
				SET_BIT(GPIOx->IE, ioposition);
			}
		}
		
		position++;
 8011af4:	2200      	addi      	r2, 1
	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011af6:	c44c4043 	lsr      	r3, r12, r2
 8011afa:	e9030039 	bez      	r3, 0x8011b6c	// 8011b6c <HAL_GPIO_Init+0x8c>
		ioposition = (0x01 << position);
 8011afe:	c4544023 	lsl      	r3, r20, r2
		iocurrent = (uint32_t)(GPIO_Init->Pin) & ioposition;
 8011b02:	c583202d 	and      	r13, r3, r12
		if (iocurrent == ioposition)
 8011b06:	674e      	cmpne      	r3, r13
 8011b08:	0bf6      	bt      	0x8011af4	// 8011af4 <HAL_GPIO_Init+0x14>
			switch (GPIO_Init->Mode)
 8011b0a:	da612001 	ld.w      	r19, (r1, 0x4)
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8011b0e:	da402004 	ld.w      	r18, (r0, 0x10)
 8011b12:	c463248d 	nor      	r13, r3, r3
			switch (GPIO_Init->Mode)
 8011b16:	eb530002 	cmpnei      	r19, 2
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8011b1a:	c5b22032 	and      	r18, r18, r13
 8011b1e:	de402004 	st.w      	r18, (r0, 0x10)
			switch (GPIO_Init->Mode)
 8011b22:	0c44      	bf      	0x8011baa	// 8011baa <HAL_GPIO_Init+0xca>
 8011b24:	eb130002 	cmphsi      	r19, 3
 8011b28:	0823      	bt      	0x8011b6e	// 8011b6e <HAL_GPIO_Init+0x8e>
 8011b2a:	eb530001 	cmpnei      	r19, 1
 8011b2e:	08a3      	bt      	0x8011c74	// 8011c74 <HAL_GPIO_Init+0x194>
 8011b30:	ea120000 	movi      	r18, 0
 8011b34:	e6521085 	subi      	r18, r18, 134
					CLEAR_BIT(GPIOx->DIR, ioposition);
 8011b38:	daa02002 	ld.w      	r21, (r0, 0x8)
 8011b3c:	c6ad2035 	and      	r21, r13, r21
 8011b40:	dea02002 	st.w      	r21, (r0, 0x8)
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8011b44:	daa12002 	ld.w      	r21, (r1, 0x8)
 8011b48:	eb550012 	cmpnei      	r21, 18
 8011b4c:	0c1b      	bf      	0x8011b82	// 8011b82 <HAL_GPIO_Init+0xa2>
			else if (GPIO_Init->Pull == GPIO_PULLUP)
 8011b4e:	eb550013 	cmpnei      	r21, 19
 8011b52:	0c37      	bf      	0x8011bc0	// 8011bc0 <HAL_GPIO_Init+0xe0>
			else if(GPIO_Init->Pull == GPIO_PULLDOWN)
 8011b54:	eb550014 	cmpnei      	r21, 20
 8011b58:	0c91      	bf      	0x8011c7a	// 8011c7a <HAL_GPIO_Init+0x19a>
			switch (GPIO_Init->Mode)
 8011b5a:	eb120004 	cmphsi      	r18, 5
 8011b5e:	0821      	bt      	0x8011ba0	// 8011ba0 <HAL_GPIO_Init+0xc0>
 8011b60:	d2560892 	ldr.w      	r18, (r22, r18 << 2)
 8011b64:	e8d20000 	jmp      	r18
 8011b68:	08015514 	.long	0x08015514
	}
}
 8011b6c:	783c      	jmp      	r15
			switch (GPIO_Init->Mode)
 8011b6e:	e6531086 	subi      	r18, r19, 135
 8011b72:	eb120004 	cmphsi      	r18, 5
 8011b76:	0fe1      	bf      	0x8011b38	// 8011b38 <HAL_GPIO_Init+0x58>
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8011b78:	daa12002 	ld.w      	r21, (r1, 0x8)
 8011b7c:	eb550012 	cmpnei      	r21, 18
 8011b80:	0be7      	bt      	0x8011b4e	// 8011b4e <HAL_GPIO_Init+0x6e>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011b82:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011b86:	c6a32435 	or      	r21, r3, r21
 8011b8a:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011b8e:	daa02007 	ld.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8011b92:	eb120004 	cmphsi      	r18, 5
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011b96:	c6ad2035 	and      	r21, r13, r21
 8011b9a:	dea02007 	st.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8011b9e:	0fe1      	bf      	0x8011b60	// 8011b60 <HAL_GPIO_Init+0x80>
			if ((GPIO_Init->Mode & EXTI_MODE) == EXTI_MODE)
 8011ba0:	e6732080 	andi      	r19, r19, 128
 8011ba4:	e913ffa8 	bez      	r19, 0x8011af4	// 8011af4 <HAL_GPIO_Init+0x14>
 8011ba8:	0423      	br      	0x8011bee	// 8011bee <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->DIR, ioposition);
 8011baa:	da402002 	ld.w      	r18, (r0, 0x8)
 8011bae:	c6432432 	or      	r18, r3, r18
 8011bb2:	de402002 	st.w      	r18, (r0, 0x8)
 8011bb6:	ea120000 	movi      	r18, 0
 8011bba:	e6521084 	subi      	r18, r18, 133
					break;
 8011bbe:	07c3      	br      	0x8011b44	// 8011b44 <HAL_GPIO_Init+0x64>
					CLEAR_BIT(GPIOx->PULLUP_EN, ioposition);
 8011bc0:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011bc4:	c6ad2035 	and      	r21, r13, r21
 8011bc8:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011bcc:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011bd0:	c6ad2035 	and      	r21, r13, r21
 8011bd4:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011bd8:	07c1      	br      	0x8011b5a	// 8011b5a <HAL_GPIO_Init+0x7a>
					SET_BIT(GPIOx->IS, ioposition);
 8011bda:	d9a02008 	ld.w      	r13, (r0, 0x20)
 8011bde:	6f4c      	or      	r13, r3
 8011be0:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IEV, ioposition);
 8011be4:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011be8:	6f4c      	or      	r13, r3
 8011bea:	dda0200a 	st.w      	r13, (r0, 0x28)
				SET_BIT(GPIOx->IE, ioposition);
 8011bee:	d9a0200b 	ld.w      	r13, (r0, 0x2c)
 8011bf2:	6cf4      	or      	r3, r13
 8011bf4:	b06b      	st.w      	r3, (r0, 0x2c)
 8011bf6:	077f      	br      	0x8011af4	// 8011af4 <HAL_GPIO_Init+0x14>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011bf8:	da402008 	ld.w      	r18, (r0, 0x20)
 8011bfc:	c64d202d 	and      	r13, r13, r18
 8011c00:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IBE, ioposition);
 8011c04:	d9a02009 	ld.w      	r13, (r0, 0x24)
 8011c08:	6f4c      	or      	r13, r3
 8011c0a:	dda02009 	st.w      	r13, (r0, 0x24)
					break;
 8011c0e:	07f0      	br      	0x8011bee	// 8011bee <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011c10:	da402008 	ld.w      	r18, (r0, 0x20)
 8011c14:	c64d2032 	and      	r18, r13, r18
 8011c18:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011c1c:	da402009 	ld.w      	r18, (r0, 0x24)
 8011c20:	c64d2032 	and      	r18, r13, r18
 8011c24:	de402009 	st.w      	r18, (r0, 0x24)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011c28:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011c2c:	c64d202d 	and      	r13, r13, r18
 8011c30:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011c34:	07dd      	br      	0x8011bee	// 8011bee <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011c36:	da402008 	ld.w      	r18, (r0, 0x20)
 8011c3a:	c64d2032 	and      	r18, r13, r18
 8011c3e:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011c42:	da402009 	ld.w      	r18, (r0, 0x24)
 8011c46:	c64d202d 	and      	r13, r13, r18
 8011c4a:	dda02009 	st.w      	r13, (r0, 0x24)
					SET_BIT(GPIOx->IEV, ioposition);
 8011c4e:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011c52:	6f4c      	or      	r13, r3
 8011c54:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011c58:	07cb      	br      	0x8011bee	// 8011bee <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->IS, ioposition);
 8011c5a:	da402008 	ld.w      	r18, (r0, 0x20)
 8011c5e:	c6432432 	or      	r18, r3, r18
 8011c62:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011c66:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011c6a:	c64d202d 	and      	r13, r13, r18
 8011c6e:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011c72:	07be      	br      	0x8011bee	// 8011bee <HAL_GPIO_Init+0x10e>
 8011c74:	e6531086 	subi      	r18, r19, 135
 8011c78:	0766      	br      	0x8011b44	// 8011b44 <HAL_GPIO_Init+0x64>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011c7a:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011c7e:	c6a32435 	or      	r21, r3, r21
 8011c82:	dea02003 	st.w      	r21, (r0, 0xc)
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011c86:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011c8a:	c6a32435 	or      	r21, r3, r21
 8011c8e:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011c92:	0764      	br      	0x8011b5a	// 8011b5a <HAL_GPIO_Init+0x7a>

08011c94 <HAL_GPIO_WritePin>:
	uint32_t data_en;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	assert_param(IS_GPIO_PIN_ACTION(PinState));

	data_en = READ_REG(GPIOx->DATA_B_EN);
 8011c94:	d9802001 	ld.w      	r12, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011c98:	9061      	ld.w      	r3, (r0, 0x4)
 8011c9a:	6cc4      	or      	r3, r1
 8011c9c:	b061      	st.w      	r3, (r0, 0x4)
	if (PinState != GPIO_PIN_RESET)
	{
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011c9e:	9060      	ld.w      	r3, (r0, 0x0)
	if (PinState != GPIO_PIN_RESET)
 8011ca0:	e9220008 	bnez      	r2, 0x8011cb0	// 8011cb0 <HAL_GPIO_WritePin+0x1c>
	}
	else
	{
		CLEAR_BIT(GPIOx->DATA, GPIO_Pin);
 8011ca4:	c4232041 	andn      	r1, r3, r1
 8011ca8:	b020      	st.w      	r1, (r0, 0x0)
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011caa:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011cae:	783c      	jmp      	r15
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011cb0:	6c4c      	or      	r1, r3
 8011cb2:	b020      	st.w      	r1, (r0, 0x0)
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011cb4:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011cb8:	783c      	jmp      	r15
	...

08011cbc <SystemClock_Get>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011cbc:	ea234000 	movih      	r3, 16384
 8011cc0:	e4630dff 	addi      	r3, r3, 3584
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011cc4:	ea0101e0 	movi      	r1, 480
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011cc8:	9344      	ld.w      	r2, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011cca:	74c8      	zextb      	r3, r2
 8011ccc:	c4618043 	divs      	r3, r1, r3
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011cd0:	c50255ec 	zext      	r12, r2, 15, 8
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011cd4:	c60256e2 	zext      	r2, r2, 23, 16
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011cd8:	b061      	st.w      	r3, (r0, 0x4)
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011cda:	c5818041 	divs      	r1, r1, r12
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011cde:	c4438023 	divu      	r3, r3, r2
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011ce2:	b022      	st.w      	r1, (r0, 0x8)
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011ce4:	b060      	st.w      	r3, (r0, 0x0)
}
 8011ce6:	783c      	jmp      	r15

08011ce8 <HAL_InitTick>:
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011ce8:	ea234000 	movih      	r3, 16384
 8011cec:	e4630dff 	addi      	r3, r3, 3584


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 8011cf0:	6f03      	mov      	r12, r0
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011cf2:	9364      	ld.w      	r3, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011cf4:	748c      	zextb      	r2, r3
 8011cf6:	ea0301e0 	movi      	r3, 480
 8011cfa:	c4438043 	divs      	r3, r3, r2
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 8011cfe:	ea02f424 	movi      	r2, 62500
 8011d02:	c4824902 	rotli      	r2, r2, 4
 8011d06:	7cc8      	mult      	r3, r2
 8011d08:	ea0203e8 	movi      	r2, 1000
 8011d0c:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011d10:	104f      	lrw      	r2, 0xe000e010	// 8011d4c <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8011d12:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011d14:	b261      	st.w      	r3, (r2, 0x4)
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011d16:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011d18:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8011d1a:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011d1c:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011d1e:	104d      	lrw      	r2, 0xe000e100	// 8011d50 <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011d20:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011d24:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8011d28:	ea0dff00 	movi      	r13, 65280
 8011d2c:	6f76      	nor      	r13, r13
 8011d2e:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011d30:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011d34:	6cc4      	or      	r3, r1
 8011d36:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011d3a:	ea230200 	movih      	r3, 512
 8011d3e:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011d40:	dc622050 	st.w      	r3, (r2, 0x140)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
 8011d44:	1064      	lrw      	r3, 0x20035a98	// 8011d54 <HAL_InitTick+0x6c>
 8011d46:	dd832000 	st.w      	r12, (r3, 0x0)
	return HAL_OK;
}
 8011d4a:	783c      	jmp      	r15
 8011d4c:	e000e010 	.long	0xe000e010
 8011d50:	e000e100 	.long	0xe000e100
 8011d54:	20035a98 	.long	0x20035a98

08011d58 <SystemClock_Config>:
{
 8011d58:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8011d5a:	5867      	subi      	r3, r0, 2
 8011d5c:	eb0300ee 	cmphsi      	r3, 239
 8011d60:	0826      	bt      	0x8011dac	// 8011dac <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 8011d62:	ea224000 	movih      	r2, 16384
 8011d66:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011d6a:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8011d6e:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8011d70:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8011d72:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011d76:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011d78:	330f      	movi      	r3, 15
 8011d7a:	b262      	st.w      	r3, (r2, 0x8)
	RegValue = READ_REG(RCC->CLK_DIV);
 8011d7c:	9264      	ld.w      	r3, (r2, 0x10)
	RegValue &= 0xFF000000;
 8011d7e:	ea22ff00 	movih      	r2, 65280
 8011d82:	68c8      	and      	r3, r2
	if(cpuDiv > 12)
 8011d84:	320c      	movi      	r2, 12
 8011d86:	6408      	cmphs      	r2, r0
	RegValue |= 0x80000000;
 8011d88:	3bbf      	bseti      	r3, 31
	if(cpuDiv > 12)
 8011d8a:	0c12      	bf      	0x8011dae	// 8011dae <SystemClock_Config+0x56>
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011d8c:	c4028022 	divu      	r2, r2, r0
 8011d90:	4250      	lsli      	r2, r2, 16
 8011d92:	ea010300 	movi      	r1, 768
 8011d96:	6c0c      	or      	r0, r3
 8011d98:	6c08      	or      	r0, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011d9a:	ea234000 	movih      	r3, 16384
 8011d9e:	e4630dff 	addi      	r3, r3, 3584
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8011da2:	6c04      	or      	r0, r1
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011da4:	b304      	st.w      	r0, (r3, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 8011da6:	3007      	movi      	r0, 7
 8011da8:	e3ffffa0 	bsr      	0x8011ce8	// 8011ce8 <HAL_InitTick>
}
 8011dac:	1490      	pop      	r15
		wlanDiv = cpuDiv/4;
 8011dae:	4822      	lsri      	r1, r0, 2
 8011db0:	4128      	lsli      	r1, r1, 8
 8011db2:	ea220001 	movih      	r2, 1
 8011db6:	07f0      	br      	0x8011d96	// 8011d96 <SystemClock_Config+0x3e>

08011db8 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
	uwTick += 1;
 8011db8:	1043      	lrw      	r2, 0x20035a94	// 8011dc4 <HAL_IncTick+0xc>
 8011dba:	9260      	ld.w      	r3, (r2, 0x0)
 8011dbc:	2300      	addi      	r3, 1
 8011dbe:	b260      	st.w      	r3, (r2, 0x0)
}
 8011dc0:	783c      	jmp      	r15
 8011dc2:	0000      	.short	0x0000
 8011dc4:	20035a94 	.long	0x20035a94

08011dc8 <HAL_NVIC_SetPriority>:
}

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8011dc8:	c4002822 	bclri      	r2, r0, 0
 8011dcc:	3a81      	bclri      	r2, 1
 8011dce:	106b      	lrw      	r3, 0xe000e100	// 8011df8 <HAL_NVIC_SetPriority+0x30>
 8011dd0:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011dd2:	e4002003 	andi      	r0, r0, 3
 8011dd6:	4003      	lsli      	r0, r0, 3
 8011dd8:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011dda:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011ddc:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8011de0:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011de2:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011de6:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011dea:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011dee:	6cc0      	or      	r3, r0
 8011df0:	dc6220c0 	st.w      	r3, (r2, 0x300)
	NVIC_SetPriority(IRQn, Priority);
}
 8011df4:	783c      	jmp      	r15
 8011df6:	0000      	.short	0x0000
 8011df8:	e000e100 	.long	0xe000e100

08011dfc <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011dfc:	e440201f 	andi      	r2, r0, 31
 8011e00:	3301      	movi      	r3, 1
 8011e02:	c4a054c0 	zext      	r0, r0, 6, 5
 8011e06:	70c8      	lsl      	r3, r2
 8011e08:	4002      	lsli      	r0, r0, 2
 8011e0a:	1044      	lrw      	r2, 0xe000e100	// 8011e18 <HAL_NVIC_EnableIRQ+0x1c>
 8011e0c:	6008      	addu      	r0, r2
 8011e0e:	b060      	st.w      	r3, (r0, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011e10:	dc602050 	st.w      	r3, (r0, 0x140)
	/* Check the parameters */
	assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

	/* Enable interrupt */
	NVIC_EnableIRQ(IRQn);
}
 8011e14:	783c      	jmp      	r15
 8011e16:	0000      	.short	0x0000
 8011e18:	e000e100 	.long	0xe000e100

08011e1c <main>:
#include "rtthread.h"

void Error_Handler(void);

int main(void)
{
 8011e1c:	14d0      	push      	r15
	app();
 8011e1e:	e0000115 	bsr      	0x8012048	// 8012048 <app>
}
 8011e22:	3000      	movi      	r0, 0
 8011e24:	1490      	pop      	r15
	...

08011e28 <CORET_IRQHandler>:
#include "user.h"

static USART_TypeDef* HUARTS[4] = {UART2, UART3, UART4, UART5};

__attribute__((isr)) void CORET_IRQHandler(void)
{
 8011e28:	1460      	nie
 8011e2a:	1462      	ipush
 8011e2c:	142e      	subi      	r14, r14, 56
 8011e2e:	d64e1c2d 	stm      	r18-r31, (r14)
 8011e32:	1428      	subi      	r14, r14, 32
 8011e34:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011e38:	14d0      	push      	r15
	uint32_t temp;
	
	temp = (*(volatile unsigned int *) (0xE000E010));
 8011e3a:	1069      	lrw      	r3, 0xe000e000	// 8011e5c <CORET_IRQHandler+0x34>
 8011e3c:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 8011e3e:	e3ffffbd 	bsr      	0x8011db8	// 8011db8 <HAL_IncTick>
	SysTick_Handler();
 8011e42:	e00002ed 	bsr      	0x801241c	// 801241c <SysTick_Handler>
}
 8011e46:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011e4a:	1401      	addi      	r14, r14, 4
 8011e4c:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011e50:	1408      	addi      	r14, r14, 32
 8011e52:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011e56:	140e      	addi      	r14, r14, 56
 8011e58:	1463      	ipop
 8011e5a:	1461      	nir
 8011e5c:	e000e000 	.long	0xe000e000

08011e60 <UART0_IRQHandler>:

__attribute__((isr)) void UART0_IRQHandler(void)
{
 8011e60:	1460      	nie
 8011e62:	1462      	ipush
 8011e64:	142e      	subi      	r14, r14, 56
 8011e66:	d64e1c2d 	stm      	r18-r31, (r14)
 8011e6a:	1428      	subi      	r14, r14, 32
 8011e6c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011e70:	14d0      	push      	r15
	uart_itr_callback(UART0);
 8011e72:	1008      	lrw      	r0, 0x40010600	// 8011e90 <UART0_IRQHandler+0x30>
 8011e74:	e000014c 	bsr      	0x801210c	// 801210c <uart_itr_callback>
}
 8011e78:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011e7c:	1401      	addi      	r14, r14, 4
 8011e7e:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011e82:	1408      	addi      	r14, r14, 32
 8011e84:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011e88:	140e      	addi      	r14, r14, 56
 8011e8a:	1463      	ipop
 8011e8c:	1461      	nir
 8011e8e:	0000      	.short	0x0000
 8011e90:	40010600 	.long	0x40010600

08011e94 <UART1_IRQHandler>:

__attribute__((isr)) void UART1_IRQHandler(void)
{
 8011e94:	1460      	nie
 8011e96:	1462      	ipush
 8011e98:	142e      	subi      	r14, r14, 56
 8011e9a:	d64e1c2d 	stm      	r18-r31, (r14)
 8011e9e:	1428      	subi      	r14, r14, 32
 8011ea0:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011ea4:	14d0      	push      	r15
	uart_itr_callback(UART1);
 8011ea6:	ea204001 	movih      	r0, 16385
 8011eaa:	38ab      	bseti      	r0, 11
 8011eac:	e0000130 	bsr      	0x801210c	// 801210c <uart_itr_callback>
}
 8011eb0:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011eb4:	1401      	addi      	r14, r14, 4
 8011eb6:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011eba:	1408      	addi      	r14, r14, 32
 8011ebc:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011ec0:	140e      	addi      	r14, r14, 56
 8011ec2:	1463      	ipop
 8011ec4:	1461      	nir
	...

08011ec8 <UART2_5_IRQHandler>:

__attribute__((isr)) void UART2_5_IRQHandler(void)
{
 8011ec8:	1460      	nie
 8011eca:	1462      	ipush
 8011ecc:	142e      	subi      	r14, r14, 56
 8011ece:	d64e1c2d 	stm      	r18-r31, (r14)
 8011ed2:	1428      	subi      	r14, r14, 32
 8011ed4:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011ed8:	102b      	lrw      	r1, 0x801552c	// 8011f04 <UART2_5_IRQHandler+0x3c>
 8011eda:	e581000b 	addi      	r12, r1, 12
 8011ede:	106b      	lrw      	r3, 0x40010a00	// 8011f08 <UART2_5_IRQHandler+0x40>
	USART_TypeDef* huart;
	uint32_t isr;
	for(i=0; i<sizeof(HUARTS)/sizeof(USART_TypeDef*); ++i)
	{
		huart = HUARTS[i];
		isr = huart->INTS;
 8011ee0:	9346      	ld.w      	r2, (r3, 0x18)
	for(i=0; i<sizeof(HUARTS)/sizeof(USART_TypeDef*); ++i)
 8011ee2:	6706      	cmpne      	r1, r12
			if(isr&(0x014C|0x03)) 
			{
				uart_itr_callback(huart);
			}
		}else{
			huart->INTS |= isr;  //清除中断标志位
 8011ee4:	9306      	ld.w      	r0, (r3, 0x18)
 8011ee6:	6c80      	or      	r2, r0
 8011ee8:	b346      	st.w      	r2, (r3, 0x18)
	for(i=0; i<sizeof(HUARTS)/sizeof(USART_TypeDef*); ++i)
 8011eea:	0c04      	bf      	0x8011ef2	// 8011ef2 <UART2_5_IRQHandler+0x2a>
 8011eec:	d0018803 	ldbi.w      	r3, (r1)
 8011ef0:	07f8      	br      	0x8011ee0	// 8011ee0 <UART2_5_IRQHandler+0x18>
		}
	}
}
 8011ef2:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011ef6:	1408      	addi      	r14, r14, 32
 8011ef8:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011efc:	140e      	addi      	r14, r14, 56
 8011efe:	1463      	ipop
 8011f00:	1461      	nir
 8011f02:	0000      	.short	0x0000
 8011f04:	0801552c 	.long	0x0801552c
 8011f08:	40010a00 	.long	0x40010a00

08011f0c <led_toggle>:
		HAL_GPIO_WritePin(leds[id].GPIOx, leds[id].pin, le);
	}
}

void led_toggle(LED_ID id)
{
 8011f0c:	14d0      	push      	r15
	if(id<LED_MAX_INDEX)
 8011f0e:	e9000003 	bez      	r0, 0x8011f14	// 8011f14 <led_toggle+0x8>
	{
		uint8_t le = (leds[id].current_level==GPIO_PIN_SET)?GPIO_PIN_RESET:GPIO_PIN_SET;
		leds[id].current_level = le;
		HAL_GPIO_WritePin(leds[id].GPIOx, leds[id].pin, le);
	}
}
 8011f12:	1490      	pop      	r15
		uint8_t le = (leds[id].current_level==GPIO_PIN_SET)?GPIO_PIN_RESET:GPIO_PIN_SET;
 8011f14:	1066      	lrw      	r3, 0x20000160	// 8011f2c <led_toggle+0x20>
 8011f16:	8342      	ld.b      	r2, (r3, 0x2)
 8011f18:	3a41      	cmpnei      	r2, 1
 8011f1a:	c4000502 	mvc      	r2
 8011f1e:	7488      	zextb      	r2, r2
		leds[id].current_level = le;
 8011f20:	a342      	st.b      	r2, (r3, 0x2)
		HAL_GPIO_WritePin(leds[id].GPIOx, leds[id].pin, le);
 8011f22:	9322      	ld.w      	r1, (r3, 0x8)
 8011f24:	9301      	ld.w      	r0, (r3, 0x4)
 8011f26:	e3fffeb7 	bsr      	0x8011c94	// 8011c94 <HAL_GPIO_WritePin>
}
 8011f2a:	1490      	pop      	r15
 8011f2c:	20000160 	.long	0x20000160

08011f30 <led_init>:

void led_init(void)
{
 8011f30:	14d2      	push      	r4-r5, r15
 8011f32:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef gpio;
	gpio.Mode = GPIO_MODE_OUTPUT;
	gpio.Pull = GPIO_PULLUP;
	if(LED_MAX_INDEX<=1)
	{
		uint8_t le = leds[0].act_level==GPIO_PIN_SET?GPIO_PIN_RESET:GPIO_PIN_SET;
 8011f34:	108c      	lrw      	r4, 0x20000160	// 8011f64 <led_init+0x34>
	gpio.Mode = GPIO_MODE_OUTPUT;
 8011f36:	3302      	movi      	r3, 2
 8011f38:	b861      	st.w      	r3, (r14, 0x4)
	gpio.Pull = GPIO_PULLUP;
 8011f3a:	3313      	movi      	r3, 19
 8011f3c:	b862      	st.w      	r3, (r14, 0x8)
		uint8_t le = leds[0].act_level==GPIO_PIN_SET?GPIO_PIN_RESET:GPIO_PIN_SET;
 8011f3e:	8461      	ld.b      	r3, (r4, 0x1)
 8011f40:	3b41      	cmpnei      	r3, 1
 8011f42:	c4000505 	mvc      	r5
		leds[0].current_level = le;
		gpio.Pin = leds[0].pin;
 8011f46:	9462      	ld.w      	r3, (r4, 0x8)
		uint8_t le = leds[0].act_level==GPIO_PIN_SET?GPIO_PIN_RESET:GPIO_PIN_SET;
 8011f48:	7554      	zextb      	r5, r5
		HAL_GPIO_Init(leds[0].GPIOx, &gpio);
 8011f4a:	6c7b      	mov      	r1, r14
 8011f4c:	9401      	ld.w      	r0, (r4, 0x4)
		gpio.Pin = leds[0].pin;
 8011f4e:	b860      	st.w      	r3, (r14, 0x0)
		leds[0].current_level = le;
 8011f50:	a4a2      	st.b      	r5, (r4, 0x2)
		HAL_GPIO_Init(leds[0].GPIOx, &gpio);
 8011f52:	e3fffdc7 	bsr      	0x8011ae0	// 8011ae0 <HAL_GPIO_Init>
		HAL_GPIO_WritePin(leds[0].GPIOx, gpio.Pin, le);
 8011f56:	6c97      	mov      	r2, r5
 8011f58:	9820      	ld.w      	r1, (r14, 0x0)
 8011f5a:	9401      	ld.w      	r0, (r4, 0x4)
 8011f5c:	e3fffe9c 	bsr      	0x8011c94	// 8011c94 <HAL_GPIO_WritePin>
		leds[2].current_level = le;
		gpio.Pin = leds[2].pin;;
		HAL_GPIO_Init(leds[2].GPIOx, &gpio);
		HAL_GPIO_WritePin(leds[2].GPIOx, gpio.Pin, le);
	}
}
 8011f60:	1403      	addi      	r14, r14, 12
 8011f62:	1492      	pop      	r4-r5, r15
 8011f64:	20000160 	.long	0x20000160

08011f68 <user_board_init>:
#include "user.h"

/// 用户板卡相关硬件、软件初始化
void user_board_init(void)
{
 8011f68:	14d0      	push      	r15
	SystemClock_Config(CPU_CLK_160M);
 8011f6a:	3003      	movi      	r0, 3
 8011f6c:	e3fffef6 	bsr      	0x8011d58	// 8011d58 <SystemClock_Config>
	led_init();
 8011f70:	e3ffffe0 	bsr      	0x8011f30	// 8011f30 <led_init>
	uart_init();
 8011f74:	e000013a 	bsr      	0x80121e8	// 80121e8 <uart_init>
}
 8011f78:	1490      	pop      	r15
	...

08011f7c <uart0_loop_send_str>:
	return -1;
}

/// 串口0循环发送数据函数
void uart0_loop_send_str(const char* str)
{
 8011f7c:	8020      	ld.b      	r1, (r0, 0x0)
	char* p = str;
	uint8_t len = 0;
	
	while(*p)
	{
		len = 32-(uint8_t)(UART0->FIFOS&0x3f);
 8011f7e:	ea8c0012 	lrw      	r12, 0x40010600	// 8011fc4 <uart0_loop_send_str+0x48>
		if(len>0 && len<=32)
 8011f82:	ea0d001f 	movi      	r13, 31
	while(*p)
 8011f86:	040a      	br      	0x8011f9a	// 8011f9a <uart0_loop_send_str+0x1e>
		len = 32-(uint8_t)(UART0->FIFOS&0x3f);
 8011f88:	d84c2007 	ld.w      	r2, (r12, 0x1c)
 8011f8c:	e442203f 	andi      	r2, r2, 63
		if(len>0 && len<=32)
 8011f90:	c44d0083 	subu      	r3, r13, r2
 8011f94:	74cc      	zextb      	r3, r3
 8011f96:	3b1f      	cmphsi      	r3, 32
 8011f98:	0c04      	bf      	0x8011fa0	// 8011fa0 <uart0_loop_send_str+0x24>
	while(*p)
 8011f9a:	e921fff7 	bnez      	r1, 0x8011f88	// 8011f88 <uart0_loop_send_str+0xc>
		{
			while(len-- && *p)
				UART0->TDW = *p++;
		}	
	}
}		
 8011f9e:	783c      	jmp      	r15
			while(len-- && *p)
 8011fa0:	eb420020 	cmpnei      	r2, 32
 8011fa4:	0ffb      	bf      	0x8011f9a	// 8011f9a <uart0_loop_send_str+0x1e>
 8011fa6:	2300      	addi      	r3, 1
 8011fa8:	60c0      	addu      	r3, r0
 8011faa:	6c83      	mov      	r2, r0
 8011fac:	0405      	br      	0x8011fb6	// 8011fb6 <uart0_loop_send_str+0x3a>
 8011fae:	8020      	ld.b      	r1, (r0, 0x0)
 8011fb0:	6c83      	mov      	r2, r0
 8011fb2:	e901fff6 	bez      	r1, 0x8011f9e	// 8011f9e <uart0_loop_send_str+0x22>
				UART0->TDW = *p++;
 8011fb6:	2000      	addi      	r0, 1
			while(len-- && *p)
 8011fb8:	640e      	cmpne      	r3, r0
				UART0->TDW = *p++;
 8011fba:	dc2c2008 	st.w      	r1, (r12, 0x20)
			while(len-- && *p)
 8011fbe:	0bf8      	bt      	0x8011fae	// 8011fae <uart0_loop_send_str+0x32>
 8011fc0:	8221      	ld.b      	r1, (r2, 0x1)
 8011fc2:	07ec      	br      	0x8011f9a	// 8011f9a <uart0_loop_send_str+0x1e>
 8011fc4:	40010600 	.long	0x40010600

08011fc8 <led_hook>:
{
 8011fc8:	14d2      	push      	r4-r5, r15
 8011fca:	1428      	subi      	r14, r14, 32
	if(c-old_time>1000)
 8011fcc:	108e      	lrw      	r4, 0x20002d10	// 8012004 <led_hook+0x3c>
	const rt_tick_t c = rt_tick_get();
 8011fce:	e0000233 	bsr      	0x8012434	// 8012434 <rt_tick_get>
	if(c-old_time>1000)
 8011fd2:	9460      	ld.w      	r3, (r4, 0x0)
 8011fd4:	586d      	subu      	r3, r0, r3
 8011fd6:	ea0203e8 	movi      	r2, 1000
 8011fda:	64c8      	cmphs      	r2, r3
	const rt_tick_t c = rt_tick_get();
 8011fdc:	6d43      	mov      	r5, r0
	if(c-old_time>1000)
 8011fde:	0810      	bt      	0x8011ffe	// 8011ffe <led_hook+0x36>
		++count;
 8011fe0:	106a      	lrw      	r3, 0x20002d0c	// 8012008 <led_hook+0x40>
 8011fe2:	9340      	ld.w      	r2, (r3, 0x0)
 8011fe4:	2200      	addi      	r2, 1
 8011fe6:	b340      	st.w      	r2, (r3, 0x0)
		sprintf(buff, "led hook: %d\n", count);
 8011fe8:	6c3b      	mov      	r0, r14
 8011fea:	1029      	lrw      	r1, 0x8015554	// 801200c <led_hook+0x44>
 8011fec:	e00019b8 	bsr      	0x801535c	// 801535c <__cskyvprintfsprintf>
		uart0_loop_send_str(buff);
 8011ff0:	6c3b      	mov      	r0, r14
 8011ff2:	e3ffffc5 	bsr      	0x8011f7c	// 8011f7c <uart0_loop_send_str>
		led_toggle(LED_ID_0);
 8011ff6:	3000      	movi      	r0, 0
		old_time = c;
 8011ff8:	b4a0      	st.w      	r5, (r4, 0x0)
		led_toggle(LED_ID_0);
 8011ffa:	e3ffff89 	bsr      	0x8011f0c	// 8011f0c <led_toggle>
}
 8011ffe:	1408      	addi      	r14, r14, 32
 8012000:	1492      	pop      	r4-r5, r15
 8012002:	0000      	.short	0x0000
 8012004:	20002d10 	.long	0x20002d10
 8012008:	20002d0c 	.long	0x20002d0c
 801200c:	08015554 	.long	0x08015554

08012010 <uart_task>:
{
 8012010:	14d5      	push      	r4-r8, r15
 8012012:	1428      	subi      	r14, r14, 32
	uint32_t count = 0;
 8012014:	3700      	movi      	r7, 0
	rt_tick_t old_time = 0;
 8012016:	6d5f      	mov      	r5, r7
		if(c-old_time>1000)
 8012018:	ea0603e8 	movi      	r6, 1000
			sprintf(buff, "Uart task: %d\n", count);
 801201c:	ea88000a 	lrw      	r8, 0x8015564	// 8012044 <uart_task+0x34>
		const rt_tick_t c = rt_tick_get();
 8012020:	e000020a 	bsr      	0x8012434	// 8012434 <rt_tick_get>
		if(c-old_time>1000)
 8012024:	5875      	subu      	r3, r0, r5
 8012026:	64d8      	cmphs      	r6, r3
		const rt_tick_t c = rt_tick_get();
 8012028:	6d03      	mov      	r4, r0
		if(c-old_time>1000)
 801202a:	0bfb      	bt      	0x8012020	// 8012020 <uart_task+0x10>
			++count;
 801202c:	2700      	addi      	r7, 1
			sprintf(buff, "Uart task: %d\n", count);
 801202e:	6c9f      	mov      	r2, r7
 8012030:	6c63      	mov      	r1, r8
 8012032:	6c3b      	mov      	r0, r14
 8012034:	e0001994 	bsr      	0x801535c	// 801535c <__cskyvprintfsprintf>
			uart0_loop_send_str(buff);
 8012038:	6c3b      	mov      	r0, r14
 801203a:	e3ffffa1 	bsr      	0x8011f7c	// 8011f7c <uart0_loop_send_str>
		const rt_tick_t c = rt_tick_get();
 801203e:	6d53      	mov      	r5, r4
 8012040:	07f0      	br      	0x8012020	// 8012020 <uart_task+0x10>
 8012042:	0000      	.short	0x0000
 8012044:	08015564 	.long	0x08015564

08012048 <app>:
{
 8012048:	14d2      	push      	r4-r5, r15
 801204a:	142a      	subi      	r14, r14, 40
	rt_thread_idle_sethook(led_hook);
 801204c:	1010      	lrw      	r0, 0x8011fc8	// 801208c <app+0x44>
 801204e:	e0000245 	bsr      	0x80124d8	// 80124d8 <rt_thread_idle_sethook>
	rt_thread_t uart_thread = rt_thread_create("UART_TASK", uart_task, (void*)0, 2048, RT_THREAD_PRIORITY_MAX-1, 50);		
 8012052:	3332      	movi      	r3, 50
 8012054:	b861      	st.w      	r3, (r14, 0x4)
 8012056:	3307      	movi      	r3, 7
 8012058:	b860      	st.w      	r3, (r14, 0x0)
 801205a:	3200      	movi      	r2, 0
 801205c:	ea030800 	movi      	r3, 2048
 8012060:	102c      	lrw      	r1, 0x8012010	// 8012090 <app+0x48>
 8012062:	100d      	lrw      	r0, 0x8015538	// 8012094 <app+0x4c>
 8012064:	e0000adc 	bsr      	0x801361c	// 801361c <rt_thread_create>
	rt_thread_startup(uart_thread);
 8012068:	e0000bd6 	bsr      	0x8013814	// 8013814 <rt_thread_startup>
	uint32_t count = 0;
 801206c:	3400      	movi      	r4, 0
		sprintf(buff, "Main task:%d\n", count);
 801206e:	10ab      	lrw      	r5, 0x8015544	// 8012098 <app+0x50>
		rt_thread_delay(1000);
 8012070:	ea0003e8 	movi      	r0, 1000
 8012074:	e0000ba8 	bsr      	0x80137c4	// 80137c4 <rt_thread_delay>
		++count;
 8012078:	2400      	addi      	r4, 1
		sprintf(buff, "Main task:%d\n", count);
 801207a:	6c93      	mov      	r2, r4
 801207c:	6c57      	mov      	r1, r5
 801207e:	1802      	addi      	r0, r14, 8
 8012080:	e000196e 	bsr      	0x801535c	// 801535c <__cskyvprintfsprintf>
		uart0_loop_send_str(buff);
 8012084:	1802      	addi      	r0, r14, 8
 8012086:	e3ffff7b 	bsr      	0x8011f7c	// 8011f7c <uart0_loop_send_str>
 801208a:	07f3      	br      	0x8012070	// 8012070 <app+0x28>
 801208c:	08011fc8 	.long	0x08011fc8
 8012090:	08012010 	.long	0x08012010
 8012094:	08015538 	.long	0x08015538
 8012098:	08015544 	.long	0x08015544

0801209c <uart_close.part.1>:

/// 关闭uart收发数据
void uart_close(UART_ID id)
{
	if(UART_DEF_IS_DISABLE(id)) return;
	_uart_def_objs[id].huart->INTM |= (((1<<8)|(1<<6)|(3<<2)|3));
 801209c:	3338      	movi      	r3, 56
 801209e:	7c0c      	mult      	r0, r3
 80120a0:	1067      	lrw      	r3, 0x20000178	// 80120bc <uart_close.part.1+0x20>
 80120a2:	600c      	addu      	r0, r3
 80120a4:	9063      	ld.w      	r3, (r0, 0xc)
 80120a6:	9345      	ld.w      	r2, (r3, 0x14)
 80120a8:	ec42014f 	ori      	r2, r2, 335
 80120ac:	b345      	st.w      	r2, (r3, 0x14)
	_uart_def_objs[id].huart->LC &= ~(3<<6);
 80120ae:	9340      	ld.w      	r2, (r3, 0x0)
 80120b0:	3a86      	bclri      	r2, 6
 80120b2:	3a87      	bclri      	r2, 7
 80120b4:	b340      	st.w      	r2, (r3, 0x0)
	_uart_def_objs[id].enable = 0;
 80120b6:	3300      	movi      	r3, 0
 80120b8:	a065      	st.b      	r3, (r0, 0x5)
}
 80120ba:	783c      	jmp      	r15
 80120bc:	20000178 	.long	0x20000178

080120c0 <uart_write>:
{
 80120c0:	14d0      	push      	r15
 80120c2:	1421      	subi      	r14, r14, 4
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return 0;
 80120c4:	74c0      	zextb      	r3, r0
{
 80120c6:	dc2e0003 	st.b      	r1, (r14, 0x3)
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return 0;
 80120ca:	e9230012 	bnez      	r3, 0x80120ee	// 80120ee <uart_write+0x2e>
 80120ce:	3238      	movi      	r2, 56
 80120d0:	ea8c000e 	lrw      	r12, 0x20000178	// 8012108 <uart_write+0x48>
 80120d4:	7c80      	mult      	r2, r0
 80120d6:	c44c0023 	addu      	r3, r12, r2
 80120da:	8365      	ld.b      	r3, (r3, 0x5)
 80120dc:	e9030006 	bez      	r3, 0x80120e8	// 80120e8 <uart_write+0x28>
	if(id<UART_ID_MAX)
 80120e0:	3805      	cmphsi      	r0, 6
 80120e2:	0c0a      	bf      	0x80120f6	// 80120f6 <uart_write+0x36>
	return data;
 80120e4:	d86e0003 	ld.b      	r3, (r14, 0x3)
}
 80120e8:	6c0f      	mov      	r0, r3
 80120ea:	1401      	addi      	r14, r14, 4
 80120ec:	1490      	pop      	r15
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return 0;
 80120ee:	3300      	movi      	r3, 0
}
 80120f0:	6c0f      	mov      	r0, r3
 80120f2:	1401      	addi      	r14, r14, 4
 80120f4:	1490      	pop      	r15
		sq = &(_uart_def_objs[id].tx_queue);
 80120f6:	220f      	addi      	r2, 16
		static_queue_insert(sq, &data);
 80120f8:	e42e0002 	addi      	r1, r14, 3
 80120fc:	c44c0020 	addu      	r0, r12, r2
 8012100:	e0000114 	bsr      	0x8012328	// 8012328 <static_queue_insert>
 8012104:	07f0      	br      	0x80120e4	// 80120e4 <uart_write+0x24>
 8012106:	0000      	.short	0x0000
 8012108:	20000178 	.long	0x20000178

0801210c <uart_itr_callback>:
{
 801210c:	14d5      	push      	r4-r8, r15
 801210e:	1421      	subi      	r14, r14, 4
	uint32_t isr = huart->INTS;
 8012110:	90a6      	ld.w      	r5, (r0, 0x18)
	huart->INTS |= isr;
 8012112:	9066      	ld.w      	r3, (r0, 0x18)
 8012114:	6cd4      	or      	r3, r5
	UART_ID id = UART_ID_MAX;
 8012116:	ea0c0006 	movi      	r12, 6
	huart->INTS |= isr;
 801211a:	b066      	st.w      	r3, (r0, 0x18)
 801211c:	103a      	lrw      	r1, 0x20000184	// 8012184 <uart_itr_callback+0x78>
 801211e:	3200      	movi      	r2, 0
	UART_ID id = UART_ID_MAX;
 8012120:	6cf3      	mov      	r3, r12
		if(huart==_uart_def_objs[i].huart)
 8012122:	d9a12000 	ld.w      	r13, (r1, 0x0)
			id = (UART_ID)i;
 8012126:	6742      	cmpne      	r0, r13
 8012128:	c5820c20 	incf      	r12, r2, 0
 801212c:	2137      	addi      	r1, 56
 801212e:	2200      	addi      	r2, 1
	for( i=0; i<UART_ID_MAX; ++i)
 8012130:	e823fff9 	bnezad      	r3, 0x8012122	// 8012122 <uart_itr_callback+0x16>
	if(UART_DEF_IS_ENABLE(id))
 8012134:	e92c000d 	bnez      	r12, 0x801214e	// 801214e <uart_itr_callback+0x42>
		if(isr&0x014C)
 8012138:	e465214c 	andi      	r3, r5, 332
 801213c:	e923000b 	bnez      	r3, 0x8012152	// 8012152 <uart_itr_callback+0x46>
		if((isr&0x03))
 8012140:	e4a52003 	andi      	r5, r5, 3
 8012144:	e9050005 	bez      	r5, 0x801214e	// 801214e <uart_itr_callback+0x42>
	_uart_def_objs[id].send_valid = 1;	
 8012148:	1070      	lrw      	r3, 0x20000178	// 8012188 <uart_itr_callback+0x7c>
 801214a:	3201      	movi      	r2, 1
 801214c:	a344      	st.b      	r2, (r3, 0x4)
}
 801214e:	1401      	addi      	r14, r14, 4
 8012150:	1495      	pop      	r4-r8, r15
	USART_TypeDef* huart = _uart_def_objs[id].huart;
 8012152:	10ce      	lrw      	r6, 0x20000178	// 8012188 <uart_itr_callback+0x7c>
{
	StaticQueue* sq;
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return;
	
	sq = &(_uart_def_objs[id].rx_queue);
	static_queue_insert(sq, &data);
 8012154:	e5060023 	addi      	r8, r6, 36
	USART_TypeDef* huart = _uart_def_objs[id].huart;
 8012158:	96e3      	ld.w      	r7, (r6, 0xc)
	uint8_t count = (huart->FIFOS&(0x3f<<6))>>6;
 801215a:	9787      	ld.w      	r4, (r7, 0x1c)
 801215c:	c4c45564 	zext      	r4, r4, 11, 6
	while(count--)
 8012160:	2c00      	subi      	r4, 1
 8012162:	7510      	zextb      	r4, r4
 8012164:	eb4400ff 	cmpnei      	r4, 255
 8012168:	0fec      	bf      	0x8012140	// 8012140 <uart_itr_callback+0x34>
		_uart_rx_queue_insert(id, (uint8_t)huart->RDW);
 801216a:	976c      	ld.w      	r3, (r7, 0x30)
 801216c:	dc6e0003 	st.b      	r3, (r14, 0x3)
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return;
 8012170:	8665      	ld.b      	r3, (r6, 0x5)
 8012172:	e903fff7 	bez      	r3, 0x8012160	// 8012160 <uart_itr_callback+0x54>
	static_queue_insert(sq, &data);
 8012176:	e42e0002 	addi      	r1, r14, 3
 801217a:	6c23      	mov      	r0, r8
 801217c:	e00000d6 	bsr      	0x8012328	// 8012328 <static_queue_insert>
 8012180:	07f0      	br      	0x8012160	// 8012160 <uart_itr_callback+0x54>
 8012182:	0000      	.short	0x0000
 8012184:	20000184 	.long	0x20000184
 8012188:	20000178 	.long	0x20000178

0801218c <uart_open>:
{
 801218c:	14d3      	push      	r4-r6, r15
 801218e:	1428      	subi      	r14, r14, 32
	if(UART_DEF_IS_DISABLE(id)) return;
 8012190:	74c0      	zextb      	r3, r0
 8012192:	e9030004 	bez      	r3, 0x801219a	// 801219a <uart_open+0xe>
}
 8012196:	1408      	addi      	r14, r14, 32
 8012198:	1493      	pop      	r4-r6, r15
	USART_TypeDef* huart = _uart_def_objs[id].huart;
 801219a:	3438      	movi      	r4, 56
 801219c:	10d1      	lrw      	r6, 0x20000178	// 80121e0 <uart_open+0x54>
 801219e:	7d00      	mult      	r4, r0
 80121a0:	5eb0      	addu      	r5, r6, r4
	huart->INTM &= ~(((1<<8)|(1<<6)|(3<<2)|3));
 80121a2:	ea01014f 	movi      	r1, 335
 80121a6:	6c46      	nor      	r1, r1
	USART_TypeDef* huart = _uart_def_objs[id].huart;
 80121a8:	9563      	ld.w      	r3, (r5, 0xc)
	huart->INTM &= ~(((1<<8)|(1<<6)|(3<<2)|3));
 80121aa:	9345      	ld.w      	r2, (r3, 0x14)
 80121ac:	6884      	and      	r2, r1
 80121ae:	b345      	st.w      	r2, (r3, 0x14)
	SET_BIT(huart->LC, (UART_MODE_TX | UART_MODE_RX));
 80121b0:	9340      	ld.w      	r2, (r3, 0x0)
 80121b2:	ec4200c0 	ori      	r2, r2, 192
 80121b6:	b340      	st.w      	r2, (r3, 0x0)
	_uart_def_objs[id].enable = 1;
 80121b8:	3301      	movi      	r3, 1
 80121ba:	a565      	st.b      	r3, (r5, 0x5)
	sprintf(buff, STR, (uint8_t)id);
 80121bc:	7480      	zextb      	r2, r0
 80121be:	102a      	lrw      	r1, 0x8015574	// 80121e4 <uart_open+0x58>
 80121c0:	6c3b      	mov      	r0, r14
 80121c2:	e00018cd 	bsr      	0x801535c	// 801535c <__cskyvprintfsprintf>
	uart_writes((UART_ID)id, (uint8_t*)buff, strlen(buff));	
 80121c6:	6c3b      	mov      	r0, r14
 80121c8:	e3fffc28 	bsr      	0x8011a18	// 8011a18 <__strlen_fast>
	if(UART_DEF_IS_DISABLE(id) || PORT_IS_DISABLE(id)) return 0;
 80121cc:	8565      	ld.b      	r3, (r5, 0x5)
 80121ce:	e903ffe4 	bez      	r3, 0x8012196	// 8012196 <uart_open+0xa>
	sq = &(_uart_def_objs[id].tx_queue);
 80121d2:	240f      	addi      	r4, 16
	return static_queue_inserts(sq, data, size);
 80121d4:	6c83      	mov      	r2, r0
 80121d6:	6c7b      	mov      	r1, r14
 80121d8:	5e10      	addu      	r0, r6, r4
 80121da:	e00000d3 	bsr      	0x8012380	// 8012380 <static_queue_inserts>
 80121de:	07dc      	br      	0x8012196	// 8012196 <uart_open+0xa>
 80121e0:	20000178 	.long	0x20000178
 80121e4:	08015574 	.long	0x08015574

080121e8 <uart_init>:
{
 80121e8:	14d5      	push      	r4-r8, r15
 80121ea:	1423      	subi      	r14, r14, 12
 80121ec:	3401      	movi      	r4, 1
	USART_TypeDef* huart = _uart_def_objs[id].huart; 
 80121ee:	12cc      	lrw      	r6, 0x20000178	// 801231c <uart_init+0x134>
			SET_BIT(GPIOB->DIR, GPIO_PIN_19);
 80121f0:	12ac      	lrw      	r5, 0x40011400	// 8012320 <uart_init+0x138>
	if (huart == UART2)
 80121f2:	12ed      	lrw      	r7, 0x40010a00	// 8012324 <uart_init+0x13c>
 80121f4:	0403      	br      	0x80121fa	// 80121fa <uart_init+0x12>
 80121f6:	2400      	addi      	r4, 1
 80121f8:	7510      	zextb      	r4, r4
		if(UARTS_DEF_ENABLE&(1<<i))
 80121fa:	3c41      	cmpnei      	r4, 1
 80121fc:	0c05      	bf      	0x8012206	// 8012206 <uart_init+0x1e>
	for( ; i<UART_ID_MAX; ++i)
 80121fe:	3c46      	cmpnei      	r4, 6
 8012200:	0bfb      	bt      	0x80121f6	// 80121f6 <uart_init+0xe>
}
 8012202:	1403      	addi      	r14, r14, 12
 8012204:	1495      	pop      	r4-r8, r15
 8012206:	3000      	movi      	r0, 0
	USART_TypeDef* huart = _uart_def_objs[id].huart; 
 8012208:	d9062003 	ld.w      	r8, (r6, 0xc)
 801220c:	e3ffff48 	bsr      	0x801209c	// 801209c <uart_close.part.1>
	__HAL_RCC_GPIO_CLK_ENABLE();
 8012210:	ea234000 	movih      	r3, 16384
 8012214:	e4630dff 	addi      	r3, r3, 3584
			HAL_NVIC_SetPriority(UART0_IRQn, 0);
 8012218:	3100      	movi      	r1, 0
	__HAL_RCC_GPIO_CLK_ENABLE();
 801221a:	9340      	ld.w      	r2, (r3, 0x0)
 801221c:	ec420800 	ori      	r2, r2, 2048
 8012220:	b340      	st.w      	r2, (r3, 0x0)
			__HAL_RCC_UART0_CLK_ENABLE();
 8012222:	9340      	ld.w      	r2, (r3, 0x0)
 8012224:	ec420002 	ori      	r2, r2, 2
 8012228:	b340      	st.w      	r2, (r3, 0x0)
			UART_HARD_REST(UART0_REST_BIT);
 801222a:	9343      	ld.w      	r2, (r3, 0xc)
 801222c:	3a8a      	bclri      	r2, 10
 801222e:	b343      	st.w      	r2, (r3, 0xc)
 8012230:	9343      	ld.w      	r2, (r3, 0xc)
 8012232:	ec420400 	ori      	r2, r2, 1024
 8012236:	b343      	st.w      	r2, (r3, 0xc)
			SET_BIT(GPIOB->DIR, GPIO_PIN_19);
 8012238:	9562      	ld.w      	r3, (r5, 0x8)
 801223a:	3bb3      	bseti      	r3, 19
 801223c:	b562      	st.w      	r3, (r5, 0x8)
			CLEAR_BIT(GPIOB->DIR, GPIO_PIN_20);
 801223e:	9562      	ld.w      	r3, (r5, 0x8)
 8012240:	3b94      	bclri      	r3, 20
 8012242:	b562      	st.w      	r3, (r5, 0x8)
			CLEAR_BIT(GPIOB->PULLUP_EN, GPIO_PIN_19|GPIO_PIN_20);
 8012244:	9563      	ld.w      	r3, (r5, 0xc)
 8012246:	3b93      	bclri      	r3, 19
 8012248:	3b94      	bclri      	r3, 20
 801224a:	b563      	st.w      	r3, (r5, 0xc)
			__HAL_AFIO_REMAP_UART0_TX(GPIOB, GPIO_PIN_19);
 801224c:	9564      	ld.w      	r3, (r5, 0x10)
 801224e:	3bb3      	bseti      	r3, 19
 8012250:	b564      	st.w      	r3, (r5, 0x10)
 8012252:	9565      	ld.w      	r3, (r5, 0x14)
 8012254:	3b93      	bclri      	r3, 19
 8012256:	b565      	st.w      	r3, (r5, 0x14)
 8012258:	9566      	ld.w      	r3, (r5, 0x18)
 801225a:	3b93      	bclri      	r3, 19
 801225c:	b566      	st.w      	r3, (r5, 0x18)
			__HAL_AFIO_REMAP_UART0_RX(GPIOB, GPIO_PIN_20);
 801225e:	9564      	ld.w      	r3, (r5, 0x10)
 8012260:	3bb4      	bseti      	r3, 20
 8012262:	b564      	st.w      	r3, (r5, 0x10)
 8012264:	9565      	ld.w      	r3, (r5, 0x14)
 8012266:	3b94      	bclri      	r3, 20
 8012268:	b565      	st.w      	r3, (r5, 0x14)
 801226a:	9566      	ld.w      	r3, (r5, 0x18)
 801226c:	3b94      	bclri      	r3, 20
 801226e:	b566      	st.w      	r3, (r5, 0x18)
 8012270:	9563      	ld.w      	r3, (r5, 0xc)
 8012272:	3b94      	bclri      	r3, 20
 8012274:	b563      	st.w      	r3, (r5, 0xc)
			HAL_NVIC_SetPriority(UART0_IRQn, 0);
 8012276:	3010      	movi      	r0, 16
 8012278:	e3fffda8 	bsr      	0x8011dc8	// 8011dc8 <HAL_NVIC_SetPriority>
			HAL_NVIC_EnableIRQ(UART0_IRQn);
 801227c:	3010      	movi      	r0, 16
 801227e:	e3fffdbf 	bsr      	0x8011dfc	// 8011dfc <HAL_NVIC_EnableIRQ>
	MODIFY_REG(huart->LC,
 8012282:	3200      	movi      	r2, 0
 8012284:	d8682000 	ld.w      	r3, (r8, 0x0)
 8012288:	2adf      	subi      	r2, 224
 801228a:	68c8      	and      	r3, r2
	if (huart == UART2)
 801228c:	65e2      	cmpne      	r8, r7
	MODIFY_REG(huart->LC,
 801228e:	ec630003 	ori      	r3, r3, 3
 8012292:	dc682000 	st.w      	r3, (r8, 0x0)
	if (huart == UART2)
 8012296:	0c3f      	bf      	0x8012314	// 8012314 <uart_init+0x12c>
	MODIFY_REG(huart->FC, (uint32_t)(UART_FC_RTSL | UART_FC_AFCE), (uint32_t)(UART_FC_RTSL_24 | UART_HWCONTROL_NONE));
 8012298:	3200      	movi      	r2, 0
 801229a:	d8682001 	ld.w      	r3, (r8, 0x4)
 801229e:	2a1d      	subi      	r2, 30
 80122a0:	68c8      	and      	r3, r2
 80122a2:	ec630014 	ori      	r3, r3, 20
 80122a6:	dc682001 	st.w      	r3, (r8, 0x4)
	MODIFY_REG(huart->DMAC, (uint32_t)(UART_DMAC_RTO | UART_DMAC_RTOE), (uint32_t)((4 << 3) | UART_DMAC_RTOE));
 80122aa:	3200      	movi      	r2, 0
 80122ac:	d8682002 	ld.w      	r3, (r8, 0x8)
 80122b0:	2afc      	subi      	r2, 253
 80122b2:	68c8      	and      	r3, r2
 80122b4:	ec630024 	ori      	r3, r3, 36
 80122b8:	dc682002 	st.w      	r3, (r8, 0x8)
	MODIFY_REG(huart->FIFOC, 
 80122bc:	d8682003 	ld.w      	r3, (r8, 0xc)
 80122c0:	ec63003f 	ori      	r3, r3, 63
 80122c4:	dc682003 	st.w      	r3, (r8, 0xc)
	SystemClock_Get(&sysclk);
 80122c8:	6c3b      	mov      	r0, r14
 80122ca:	e3fffcf9 	bsr      	0x8011cbc	// 8011cbc <SystemClock_Get>
	apbclk = sysclk.apbclk * 1000000;
 80122ce:	9860      	ld.w      	r3, (r14, 0x0)
 80122d0:	ea02f424 	movi      	r2, 62500
 80122d4:	c4824902 	rotli      	r2, r2, 4
 80122d8:	7cc8      	mult      	r3, r2
    value = (apbclk / (16 * _uart_def_objs[id].baud) - 1) | (((apbclk % (_uart_def_objs[id].baud * 16)) * 16 / ((_uart_def_objs[id].baud * 16))) << 16);
 80122da:	9642      	ld.w      	r2, (r6, 0x8)
 80122dc:	4244      	lsli      	r2, r2, 4
 80122de:	c4438021 	divu      	r1, r3, r2
 80122e2:	c4418420 	mult      	r0, r1, r2
 80122e6:	60c2      	subu      	r3, r0
 80122e8:	4364      	lsli      	r3, r3, 4
 80122ea:	c4438023 	divu      	r3, r3, r2
 80122ee:	2900      	subi      	r1, 1
 80122f0:	4370      	lsli      	r3, r3, 16
 80122f2:	6cc4      	or      	r3, r1
	huart->BAUDR = value;
 80122f4:	dc682004 	st.w      	r3, (r8, 0x10)
	memset(_uart_def_objs[id].tx_queue.data, 0, _uart_def_objs[id].tx_queue.size);
 80122f8:	9648      	ld.w      	r2, (r6, 0x20)
 80122fa:	3100      	movi      	r1, 0
 80122fc:	9604      	ld.w      	r0, (r6, 0x10)
 80122fe:	e3fffb3d 	bsr      	0x8011978	// 8011978 <__memset_fast>
	memset(_uart_def_objs[id].rx_queue.data, 0, _uart_def_objs[id].rx_queue.size);
 8012302:	964d      	ld.w      	r2, (r6, 0x34)
 8012304:	3100      	movi      	r1, 0
 8012306:	9609      	ld.w      	r0, (r6, 0x24)
 8012308:	e3fffb38 	bsr      	0x8011978	// 8011978 <__memset_fast>
			uart_open((UART_ID)i);
 801230c:	3000      	movi      	r0, 0
 801230e:	e3ffff3f 	bsr      	0x801218c	// 801218c <uart_open>
 8012312:	0772      	br      	0x80121f6	// 80121f6 <uart_init+0xe>
		CLEAR_BIT(huart->LC, (1 << 24));
 8012314:	9760      	ld.w      	r3, (r7, 0x0)
 8012316:	3b98      	bclri      	r3, 24
 8012318:	b760      	st.w      	r3, (r7, 0x0)
 801231a:	07bf      	br      	0x8012298	// 8012298 <uart_init+0xb0>
 801231c:	20000178 	.long	0x20000178
 8012320:	40011400 	.long	0x40011400
 8012324:	40010a00 	.long	0x40010a00

08012328 <static_queue_insert>:
	psq->rear = 0;
	return 1;
}

uint8_t static_queue_insert(StaticQueue* psq, const void* data)
{
 8012328:	14d1      	push      	r4, r15
 801232a:	6d03      	mov      	r4, r0
	return len;
}

uint8_t inline static_queue_is_full(StaticQueue* psq)
{
	return (psq->front==((psq->rear+1)%psq->size));
 801232c:	d9a42002 	ld.w      	r13, (r4, 0x8)
 8012330:	9444      	ld.w      	r2, (r4, 0x10)
 8012332:	e58d0000 	addi      	r12, r13, 1
 8012336:	c44c8023 	divu      	r3, r12, r2
 801233a:	7cc8      	mult      	r3, r2
 801233c:	c46c0083 	subu      	r3, r12, r3
	if(static_queue_is_full(psq)) return 0;
 8012340:	9441      	ld.w      	r2, (r4, 0x4)
 8012342:	64ca      	cmpne      	r2, r3
 8012344:	0c1b      	bf      	0x801237a	// 801237a <static_queue_insert+0x52>
	if(psq->type_size==1)
 8012346:	9443      	ld.w      	r2, (r4, 0xc)
 8012348:	3a41      	cmpnei      	r2, 1
 801234a:	0c11      	bf      	0x801236c	// 801236c <static_queue_insert+0x44>
		memcpy(psq->data+((psq->rear++)*psq->type_size), data, psq->type_size);
 801234c:	9400      	ld.w      	r0, (r4, 0x0)
 801234e:	dd842002 	st.w      	r12, (r4, 0x8)
 8012352:	f9a28440 	mula.32.l      	r0, r2, r13
 8012356:	e3fffb81 	bsr      	0x8011a58	// 8011a58 <__memcpy_fast>
	psq->rear %= psq->size;
 801235a:	9462      	ld.w      	r3, (r4, 0x8)
 801235c:	9424      	ld.w      	r1, (r4, 0x10)
 801235e:	c4238022 	divu      	r2, r3, r1
 8012362:	7c84      	mult      	r2, r1
 8012364:	60ca      	subu      	r3, r2
	return 1;
 8012366:	3001      	movi      	r0, 1
	psq->rear %= psq->size;
 8012368:	b462      	st.w      	r3, (r4, 0x8)
}
 801236a:	1491      	pop      	r4, r15
		psq->data[psq->rear++] = *((uint8_t*)data);
 801236c:	dd842002 	st.w      	r12, (r4, 0x8)
 8012370:	9460      	ld.w      	r3, (r4, 0x0)
 8012372:	8140      	ld.b      	r2, (r1, 0x0)
 8012374:	d5a30022 	str.b      	r2, (r3, r13 << 0)
 8012378:	07f1      	br      	0x801235a	// 801235a <static_queue_insert+0x32>
	if(static_queue_is_full(psq)) return 0;
 801237a:	3000      	movi      	r0, 0
}
 801237c:	1491      	pop      	r4, r15
	...

08012380 <static_queue_inserts>:
{
 8012380:	14d4      	push      	r4-r7, r15
 8012382:	6d03      	mov      	r4, r0
	uint32_t r = psq->size-static_queue_len(psq)-1;
 8012384:	9004      	ld.w      	r0, (r0, 0x10)
	return (psq->front==psq->rear);
}

uint32_t inline static_queue_len(StaticQueue* psq)
{
	if(psq->rear>=psq->front)
 8012386:	9462      	ld.w      	r3, (r4, 0x8)
 8012388:	94e1      	ld.w      	r7, (r4, 0x4)
 801238a:	65cc      	cmphs      	r3, r7
 801238c:	0c2e      	bf      	0x80123e8	// 80123e8 <static_queue_inserts+0x68>
		return psq->rear-psq->front;
 801238e:	c4e3008c 	subu      	r12, r3, r7
	uint32_t r = psq->size-static_queue_len(psq)-1;
 8012392:	58e3      	subi      	r7, r0, 1
 8012394:	61f2      	subu      	r7, r12
	len = len>r?r:len;
 8012396:	f847cd27 	min.u32      	r7, r7, r2
	for(i=0; i<len; ++i)
 801239a:	e9070025 	bez      	r7, 0x80123e4	// 80123e4 <static_queue_inserts+0x64>
 801239e:	6d87      	mov      	r6, r1
 80123a0:	3500      	movi      	r5, 0
 80123a2:	0413      	br      	0x80123c8	// 80123c8 <static_queue_inserts+0x48>
			psq->data[psq->rear++] = sdata[i];
 80123a4:	5b22      	addi      	r1, r3, 1
 80123a6:	b422      	st.w      	r1, (r4, 0x8)
 80123a8:	9440      	ld.w      	r2, (r4, 0x0)
 80123aa:	d0a60021 	ldr.b      	r1, (r6, r5 << 0)
 80123ae:	d4620021 	str.b      	r1, (r2, r3 << 0)
		psq->rear %= psq->size;
 80123b2:	9462      	ld.w      	r3, (r4, 0x8)
 80123b4:	d9842004 	ld.w      	r12, (r4, 0x10)
 80123b8:	c5838020 	divu      	r0, r3, r12
	for(i=0; i<len; ++i)
 80123bc:	2500      	addi      	r5, 1
		psq->rear %= psq->size;
 80123be:	7c30      	mult      	r0, r12
	for(i=0; i<len; ++i)
 80123c0:	655e      	cmpne      	r7, r5
		psq->rear %= psq->size;
 80123c2:	60c2      	subu      	r3, r0
 80123c4:	b462      	st.w      	r3, (r4, 0x8)
	for(i=0; i<len; ++i)
 80123c6:	0c0f      	bf      	0x80123e4	// 80123e4 <static_queue_inserts+0x64>
		if(psq->type_size==1)
 80123c8:	9443      	ld.w      	r2, (r4, 0xc)
 80123ca:	3a41      	cmpnei      	r2, 1
 80123cc:	0fec      	bf      	0x80123a4	// 80123a4 <static_queue_inserts+0x24>
			memcpy(psq->data+((psq->rear++)*psq->type_size), sdata, psq->type_size);
 80123ce:	5b22      	addi      	r1, r3, 1
 80123d0:	9400      	ld.w      	r0, (r4, 0x0)
 80123d2:	b422      	st.w      	r1, (r4, 0x8)
 80123d4:	f8628440 	mula.32.l      	r0, r2, r3
 80123d8:	6c5b      	mov      	r1, r6
 80123da:	e3fffb3f 	bsr      	0x8011a58	// 8011a58 <__memcpy_fast>
			sdata += psq->type_size;
 80123de:	9463      	ld.w      	r3, (r4, 0xc)
 80123e0:	618c      	addu      	r6, r3
 80123e2:	07e8      	br      	0x80123b2	// 80123b2 <static_queue_inserts+0x32>
}
 80123e4:	6c1f      	mov      	r0, r7
 80123e6:	1494      	pop      	r4-r7, r15
	else 
		return psq->size-(psq->front-psq->rear);
 80123e8:	c460002c 	addu      	r12, r0, r3
 80123ec:	631e      	subu      	r12, r7
 80123ee:	07d2      	br      	0x8012392	// 8012392 <static_queue_inserts+0x12>

080123f0 <rt_heap_begin_get>:
#define RT_HEAP_SIZE 1024*50          //200KB=50*4*1024
static uint32_t rt_heap[RT_HEAP_SIZE];  
RT_WEAK void *rt_heap_begin_get(void)
{
    return rt_heap;
}
 80123f0:	1001      	lrw      	r0, 0x2000353c	// 80123f4 <rt_heap_begin_get+0x4>
 80123f2:	783c      	jmp      	r15
 80123f4:	2000353c 	.long	0x2000353c

080123f8 <rt_heap_end_get>:

RT_WEAK void *rt_heap_end_get(void)
{
    return rt_heap + RT_HEAP_SIZE;
}
 80123f8:	1001      	lrw      	r0, 0x2003553c	// 80123fc <rt_heap_end_get+0x4>
 80123fa:	783c      	jmp      	r15
 80123fc:	2003553c 	.long	0x2003553c

08012400 <rt_hw_board_init>:

/**
 * This function will initial your board.
 */
void rt_hw_board_init()
{
 8012400:	14d1      	push      	r4, r15
    /* System Clock Update */
    user_board_init();
 8012402:	e3fffdb3 	bsr      	0x8011f68	// 8011f68 <user_board_init>
#ifdef RT_USING_COMPONENTS_INIT
    rt_components_board_init();
#endif

#if defined(RT_USING_USER_MAIN) && defined(RT_USING_HEAP)
    rt_system_heap_init(rt_heap_begin_get(), rt_heap_end_get());
 8012406:	e3fffff5 	bsr      	0x80123f0	// 80123f0 <rt_heap_begin_get>
 801240a:	6d03      	mov      	r4, r0
 801240c:	e3fffff6 	bsr      	0x80123f8	// 80123f8 <rt_heap_end_get>
 8012410:	6c43      	mov      	r1, r0
 8012412:	6c13      	mov      	r0, r4
 8012414:	e0000598 	bsr      	0x8012f44	// 8012f44 <rt_system_heap_init>
#endif
}
 8012418:	1491      	pop      	r4, r15
	...

0801241c <SysTick_Handler>:

void SysTick_Handler(void)
{
 801241c:	14d0      	push      	r15
    /* enter interrupt */
    rt_interrupt_enter();
 801241e:	e0000167 	bsr      	0x80126ec	// 80126ec <rt_interrupt_enter>

    rt_tick_increase();
 8012422:	e000000f 	bsr      	0x8012440	// 8012440 <rt_tick_increase>

    /* leave interrupt */
    rt_interrupt_leave();
 8012426:	e0000171 	bsr      	0x8012708	// 8012708 <rt_interrupt_leave>
}
 801242a:	1490      	pop      	r15

0801242c <rt_hw_console_output>:

INIT_BOARD_EXPORT(uart_init);

void rt_hw_console_output(const char *str)
{
 801242c:	14d0      	push      	r15
	uart0_loop_send_str(str);
 801242e:	e3fffda7 	bsr      	0x8011f7c	// 8011f7c <uart0_loop_send_str>
}
 8012432:	1490      	pop      	r15

08012434 <rt_tick_get>:
 */
rt_tick_t rt_tick_get(void)
{
    /* return the global tick */
    return rt_tick;
}
 8012434:	1062      	lrw      	r3, 0x2003553c	// 801243c <rt_tick_get+0x8>
 8012436:	9300      	ld.w      	r0, (r3, 0x0)
 8012438:	783c      	jmp      	r15
 801243a:	0000      	.short	0x0000
 801243c:	2003553c 	.long	0x2003553c

08012440 <rt_tick_increase>:
/**
 * This function will notify kernel there is one tick passed. Normally,
 * this function is invoked by clock ISR.
 */
void rt_tick_increase(void)
{
 8012440:	14d0      	push      	r15
    struct rt_thread *thread;

    /* increase the global tick */
    ++ rt_tick;
 8012442:	104a      	lrw      	r2, 0x2003553c	// 8012468 <rt_tick_increase+0x28>
 8012444:	9260      	ld.w      	r3, (r2, 0x0)
 8012446:	2300      	addi      	r3, 1
 8012448:	b260      	st.w      	r3, (r2, 0x0)

    /* check time slice */
    thread = rt_thread_self();
 801244a:	e00008e3 	bsr      	0x8013610	// 8013610 <rt_thread_self>

    -- thread->remaining_tick;
 801244e:	9070      	ld.w      	r3, (r0, 0x40)
 8012450:	2b00      	subi      	r3, 1
 8012452:	b070      	st.w      	r3, (r0, 0x40)
    if (thread->remaining_tick == 0)
 8012454:	e9230006 	bnez      	r3, 0x8012460	// 8012460 <rt_tick_increase+0x20>
    {
        /* change to initialized tick */
        thread->remaining_tick = thread->init_tick;
 8012458:	906f      	ld.w      	r3, (r0, 0x3c)
 801245a:	b070      	st.w      	r3, (r0, 0x40)

        /* yield */
        rt_thread_yield();
 801245c:	e0000930 	bsr      	0x80136bc	// 80136bc <rt_thread_yield>
    }

    /* check timer */
    rt_timer_check();
 8012460:	e0000ab4 	bsr      	0x80139c8	// 80139c8 <rt_timer_check>
}
 8012464:	1490      	pop      	r15
 8012466:	0000      	.short	0x0000
 8012468:	2003553c 	.long	0x2003553c

0801246c <main_thread_entry>:
struct rt_thread main_thread;
#endif

/* the system main thread */
void main_thread_entry(void *parameter)
{
 801246c:	14d0      	push      	r15
#endif
    /* invoke system main function */
#if defined(__CC_ARM) || defined(__CLANG_ARM)
    $Super$$main(); /* for ARMCC. */
#elif defined(__ICCARM__) || defined(__GNUC__)
    main();
 801246e:	e3fffcd7 	bsr      	0x8011e1c	// 8011e1c <main>
#endif
}
 8012472:	1490      	pop      	r15

08012474 <rt_application_init>:

void rt_application_init(void)
{
 8012474:	14d0      	push      	r15
 8012476:	1422      	subi      	r14, r14, 8
    rt_thread_t tid;

#ifdef RT_USING_HEAP
    tid = rt_thread_create("main", main_thread_entry, RT_NULL,
 8012478:	3314      	movi      	r3, 20
 801247a:	b861      	st.w      	r3, (r14, 0x4)
 801247c:	3302      	movi      	r3, 2
 801247e:	b860      	st.w      	r3, (r14, 0x0)
 8012480:	3200      	movi      	r2, 0
 8012482:	ea030400 	movi      	r3, 1024
 8012486:	1025      	lrw      	r1, 0x801246c	// 8012498 <rt_application_init+0x24>
 8012488:	1005      	lrw      	r0, 0x8015588	// 801249c <rt_application_init+0x28>
 801248a:	e00008c9 	bsr      	0x801361c	// 801361c <rt_thread_create>

    /* if not define RT_USING_HEAP, using to eliminate the warning */
    (void)result;
#endif

    rt_thread_startup(tid);
 801248e:	e00009c3 	bsr      	0x8013814	// 8013814 <rt_thread_startup>
}
 8012492:	1402      	addi      	r14, r14, 8
 8012494:	1490      	pop      	r15
 8012496:	0000      	.short	0x0000
 8012498:	0801246c 	.long	0x0801246c
 801249c:	08015588 	.long	0x08015588

080124a0 <rtthread_startup>:

int rtthread_startup(void)
{
 80124a0:	14d0      	push      	r15
    rt_hw_interrupt_disable();
 80124a2:	e3fff09f 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>

    /* board level initialization
     * NOTE: please initialize heap inside board initialization.
     */
    rt_hw_board_init();
 80124a6:	e3ffffad 	bsr      	0x8012400	// 8012400 <rt_hw_board_init>

    /* show RT-Thread version */
    rt_show_version();
 80124aa:	e00004c7 	bsr      	0x8012e38	// 8012e38 <rt_show_version>

    /* timer system initialization */
    rt_system_timer_init();
 80124ae:	e0000ae3 	bsr      	0x8013a74	// 8013a74 <rt_system_timer_init>

    /* scheduler system initialization */
    rt_system_scheduler_init();
 80124b2:	e0000727 	bsr      	0x8013300	// 8013300 <rt_system_scheduler_init>

    /* create init_thread */
    rt_application_init();
 80124b6:	e3ffffdf 	bsr      	0x8012474	// 8012474 <rt_application_init>

    /* timer thread initialization */
    rt_system_timer_thread_init();
 80124ba:	e0000ae3 	bsr      	0x8013a80	// 8013a80 <rt_system_timer_thread_init>

    /* idle thread initialization */
    rt_thread_idle_init();
 80124be:	e000005d 	bsr      	0x8012578	// 8012578 <rt_thread_idle_init>

    /* start scheduler */
    rt_system_scheduler_start();
 80124c2:	e0000741 	bsr      	0x8013344	// 8013344 <rt_system_scheduler_start>

    /* never reach here */
    return 0;
}
 80124c6:	3000      	movi      	r0, 0
 80124c8:	1490      	pop      	r15
	...

080124cc <entry>:
{
 80124cc:	14d0      	push      	r15
    rtthread_startup();
 80124ce:	e3ffffe9 	bsr      	0x80124a0	// 80124a0 <rtthread_startup>
}
 80124d2:	3000      	movi      	r0, 0
 80124d4:	1490      	pop      	r15
	...

080124d8 <rt_thread_idle_sethook>:
 *         -RT_EFULL: hook list is full
 *
 * @note the hook function must be simple and never be blocked or suspend.
 */
rt_err_t rt_thread_idle_sethook(void (*hook)(void))
{
 80124d8:	14d1      	push      	r4, r15
 80124da:	6d03      	mov      	r4, r0
    rt_size_t i;
    rt_base_t level;
    rt_err_t ret = -RT_EFULL;

    /* disable interrupt */
    level = rt_hw_interrupt_disable();
 80124dc:	e3fff082 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>

    for (i = 0; i < RT_IDLE_HOOK_LIST_SIZE; i++)
 80124e0:	3300      	movi      	r3, 0
 80124e2:	ea8c000c 	lrw      	r12, 0x200355b8	// 8012510 <rt_thread_idle_sethook+0x38>
 80124e6:	3204      	movi      	r2, 4
    {
        if (idle_hook_list[i] == RT_NULL)
 80124e8:	d06c0881 	ldr.w      	r1, (r12, r3 << 2)
 80124ec:	e901000b 	bez      	r1, 0x8012502	// 8012502 <rt_thread_idle_sethook+0x2a>
    for (i = 0; i < RT_IDLE_HOOK_LIST_SIZE; i++)
 80124f0:	2300      	addi      	r3, 1
 80124f2:	e822fffb 	bnezad      	r2, 0x80124e8	// 80124e8 <rt_thread_idle_sethook+0x10>
    rt_err_t ret = -RT_EFULL;
 80124f6:	3400      	movi      	r4, 0
 80124f8:	2c02      	subi      	r4, 3
            ret = RT_EOK;
            break;
        }
    }
    /* enable interrupt */
    rt_hw_interrupt_enable(level);
 80124fa:	e3fff078 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

    return ret;
}
 80124fe:	6c13      	mov      	r0, r4
 8012500:	1491      	pop      	r4, r15
            idle_hook_list[i] = hook;
 8012502:	d46c0884 	str.w      	r4, (r12, r3 << 2)
            ret = RT_EOK;
 8012506:	6d07      	mov      	r4, r1
    rt_hw_interrupt_enable(level);
 8012508:	e3fff071 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 801250c:	6c13      	mov      	r0, r4
 801250e:	1491      	pop      	r4, r15
 8012510:	200355b8 	.long	0x200355b8

08012514 <rt_thread_idle_excute>:
 * @ingroup Thread
 *
 * This function will perform system background job when system idle.
 */
void rt_thread_idle_excute(void)
{
 8012514:	14d3      	push      	r4-r6, r15
 8012516:	1090      	lrw      	r4, 0x20035ae8	// 8012554 <rt_thread_idle_excute+0x40>
 8012518:	0414      	br      	0x8012540	// 8012540 <rt_thread_idle_excute+0x2c>
        {
            rt_hw_interrupt_enable(lock);
            break;
        }
        /* get defunct thread */
        thread = rt_list_entry(rt_thread_defunct.next,
 801251a:	9460      	ld.w      	r3, (r4, 0x0)
 801251c:	e4a31013 	subi      	r5, r3, 20
 * @brief remove node from list.
 * @param n the node to remove from the list.
 */
rt_inline void rt_list_remove(rt_list_t *n)
{
    n->next->prev = n->prev;
 8012520:	9340      	ld.w      	r2, (r3, 0x0)
 8012522:	9321      	ld.w      	r1, (r3, 0x4)
 8012524:	b221      	st.w      	r1, (r2, 0x4)
    n->prev->next = n->next;
 8012526:	9321      	ld.w      	r1, (r3, 0x4)
                struct rt_thread,
                tlist);
        /* remove defunct thread */
        rt_list_remove(&(thread->tlist));
        /* release thread's stack */
        RT_KERNEL_FREE(thread->stack_addr);
 8012528:	9305      	ld.w      	r0, (r3, 0x14)
 801252a:	b140      	st.w      	r2, (r1, 0x0)

    n->next = n->prev = n;
 801252c:	b361      	st.w      	r3, (r3, 0x4)
 801252e:	b360      	st.w      	r3, (r3, 0x0)
 8012530:	e0000606 	bsr      	0x801313c	// 801313c <rt_free>
        /* delete thread object */
        rt_object_delete((rt_object_t)thread);
 8012534:	6c17      	mov      	r0, r5
 8012536:	e00006cb 	bsr      	0x80132cc	// 80132cc <rt_object_delete>
        rt_hw_interrupt_enable(lock);
 801253a:	6c1b      	mov      	r0, r6
 801253c:	e3fff057 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
        lock = rt_hw_interrupt_disable();
 8012540:	e3fff050 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    return l->next != l;
 8012544:	9460      	ld.w      	r3, (r4, 0x0)
        if (!_has_defunct_thread())
 8012546:	650e      	cmpne      	r3, r4
        lock = rt_hw_interrupt_disable();
 8012548:	6d83      	mov      	r6, r0
        if (!_has_defunct_thread())
 801254a:	0be8      	bt      	0x801251a	// 801251a <rt_thread_idle_excute+0x6>
            rt_hw_interrupt_enable(lock);
 801254c:	e3fff04f 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
    }
#endif
}
 8012550:	1493      	pop      	r4-r6, r15
 8012552:	0000      	.short	0x0000
 8012554:	20035ae8 	.long	0x20035ae8

08012558 <rt_thread_idle_entry>:

extern void rt_system_power_manager(void);
static void rt_thread_idle_entry(void *parameter)
{
 8012558:	14d2      	push      	r4-r5, r15
 801255a:	10a7      	lrw      	r5, 0x200355b8	// 8012574 <rt_thread_idle_entry+0x1c>
    {

#ifdef RT_USING_IDLE_HOOK
        rt_size_t i;

        for (i = 0; i < RT_IDLE_HOOK_LIST_SIZE; i++)
 801255c:	3400      	movi      	r4, 0
        {
            if (idle_hook_list[i] != RT_NULL)
 801255e:	d0850883 	ldr.w      	r3, (r5, r4 << 2)
 8012562:	e9030003 	bez      	r3, 0x8012568	// 8012568 <rt_thread_idle_entry+0x10>
            {
                idle_hook_list[i]();
 8012566:	7bcd      	jsr      	r3
        for (i = 0; i < RT_IDLE_HOOK_LIST_SIZE; i++)
 8012568:	2400      	addi      	r4, 1
 801256a:	3c44      	cmpnei      	r4, 4
 801256c:	0bf9      	bt      	0x801255e	// 801255e <rt_thread_idle_entry+0x6>
            }
        }
#endif

        rt_thread_idle_excute();
 801256e:	e3ffffd3 	bsr      	0x8012514	// 8012514 <rt_thread_idle_excute>
    {
 8012572:	07f5      	br      	0x801255c	// 801255c <rt_thread_idle_entry+0x4>
 8012574:	200355b8 	.long	0x200355b8

08012578 <rt_thread_idle_init>:
 * This function will initialize idle thread, then start it.
 *
 * @note this function must be invoked when system init.
 */
void rt_thread_idle_init(void)
{
 8012578:	14d1      	push      	r4, r15
 801257a:	1424      	subi      	r14, r14, 16
    /* initialize thread */
    rt_thread_init(&idle,
 801257c:	3320      	movi      	r3, 32
 801257e:	b863      	st.w      	r3, (r14, 0xc)
 8012580:	3307      	movi      	r3, 7
 8012582:	b862      	st.w      	r3, (r14, 0x8)
 8012584:	ea030400 	movi      	r3, 1024
 8012588:	1088      	lrw      	r4, 0x20035540	// 80125a8 <rt_thread_idle_init+0x30>
 801258a:	1049      	lrw      	r2, 0x8012558	// 80125ac <rt_thread_idle_init+0x34>
 801258c:	1029      	lrw      	r1, 0x8015590	// 80125b0 <rt_thread_idle_init+0x38>
 801258e:	6c13      	mov      	r0, r4
 8012590:	b861      	st.w      	r3, (r14, 0x4)
 8012592:	1069      	lrw      	r3, 0x200355c8	// 80125b4 <rt_thread_idle_init+0x3c>
 8012594:	b860      	st.w      	r3, (r14, 0x0)
 8012596:	3300      	movi      	r3, 0
 8012598:	e00007f6 	bsr      	0x8013584	// 8013584 <rt_thread_init>
                   sizeof(rt_thread_stack),
                   RT_THREAD_PRIORITY_MAX - 1,
                   32);

    /* startup */
    rt_thread_startup(&idle);
 801259c:	6c13      	mov      	r0, r4
 801259e:	e000093b 	bsr      	0x8013814	// 8013814 <rt_thread_startup>
}
 80125a2:	1404      	addi      	r14, r14, 16
 80125a4:	1491      	pop      	r4, r15
 80125a6:	0000      	.short	0x0000
 80125a8:	20035540 	.long	0x20035540
 80125ac:	08012558 	.long	0x08012558
 80125b0:	08015590 	.long	0x08015590
 80125b4:	200355c8 	.long	0x200355c8

080125b8 <rt_sem_init>:
 */
rt_err_t rt_sem_init(rt_sem_t    sem,
                     const char *name,
                     rt_uint32_t value,
                     rt_uint8_t  flag)
{
 80125b8:	14d3      	push      	r4-r6, r15
 80125ba:	6d03      	mov      	r4, r0
 80125bc:	6d8b      	mov      	r6, r2
    RT_ASSERT(sem != RT_NULL);
    RT_ASSERT(value < 0x10000U);

    /* initialize object */
    rt_object_init(&(sem->parent.parent), RT_Object_Class_Semaphore, name);
 80125be:	6c87      	mov      	r2, r1
 80125c0:	3102      	movi      	r1, 2
{
 80125c2:	6d4f      	mov      	r5, r3
    rt_object_init(&(sem->parent.parent), RT_Object_Class_Semaphore, name);
 80125c4:	e0000606 	bsr      	0x80131d0	// 80131d0 <rt_object_init>
    rt_list_init(&(ipc->suspend_thread));
 80125c8:	e4440013 	addi      	r2, r4, 20

    /* set parent */
    sem->parent.parent.flag = flag;

    return RT_EOK;
}
 80125cc:	3000      	movi      	r0, 0
    l->next = l->prev = l;
 80125ce:	b446      	st.w      	r2, (r4, 0x18)
 80125d0:	b445      	st.w      	r2, (r4, 0x14)
    sem->value = (rt_uint16_t)value;
 80125d2:	acce      	st.h      	r6, (r4, 0x1c)
    sem->parent.parent.flag = flag;
 80125d4:	a4a9      	st.b      	r5, (r4, 0x9)
}
 80125d6:	1493      	pop      	r4-r6, r15

080125d8 <rt_sem_take>:
 * @param time the waiting time
 *
 * @return the error code
 */
rt_err_t rt_sem_take(rt_sem_t sem, rt_int32_t time)
{
 80125d8:	14d5      	push      	r4-r8, r15
 80125da:	1421      	subi      	r14, r14, 4
 80125dc:	6d03      	mov      	r4, r0
 80125de:	b820      	st.w      	r1, (r14, 0x0)
    RT_ASSERT(rt_object_get_type(&sem->parent.parent) == RT_Object_Class_Semaphore);

    RT_OBJECT_HOOK_CALL(rt_object_trytake_hook, (&(sem->parent.parent)));

    /* disable interrupt */
    temp = rt_hw_interrupt_disable();
 80125e0:	e3fff000 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    RT_DEBUG_LOG(RT_DEBUG_IPC, ("thread %s take sem:%s, which value is: %d\n",
                                rt_thread_self()->name,
                                ((struct rt_object *)sem)->name,
                                sem->value));

    if (sem->value > 0)
 80125e4:	8cce      	ld.h      	r6, (r4, 0x1c)
    temp = rt_hw_interrupt_disable();
 80125e6:	6dc3      	mov      	r7, r0
    if (sem->value > 0)
 80125e8:	e9260045 	bnez      	r6, 0x8012672	// 8012672 <rt_sem_take+0x9a>
        rt_hw_interrupt_enable(temp);
    }
    else
    {
        /* no waiting, return with timeout */
        if (time == 0)
 80125ec:	9860      	ld.w      	r3, (r14, 0x0)
 80125ee:	e9030055 	bez      	r3, 0x8012698	// 8012698 <rt_sem_take+0xc0>
            /* current context checking */
            RT_DEBUG_IN_THREAD_CONTEXT;

            /* semaphore is unavailable, push to suspend list */
            /* get current thread */
            thread = rt_thread_self();
 80125f2:	e000080f 	bsr      	0x8013610	// 8013610 <rt_thread_self>
 80125f6:	6d43      	mov      	r5, r0

            /* reset thread error number */
            thread->error = RT_EOK;
 80125f8:	b0cc      	st.w      	r6, (r0, 0x30)

            RT_DEBUG_LOG(RT_DEBUG_IPC, ("sem take: suspend thread - %s\n",
                                        thread->name));

            /* suspend thread */
            rt_ipc_list_suspend(&(sem->parent.suspend_thread),
 80125fa:	d9040009 	ld.b      	r8, (r4, 0x9)
 80125fe:	e4c40013 	addi      	r6, r4, 20
    rt_thread_suspend(thread);
 8012602:	e0000897 	bsr      	0x8013730	// 8013730 <rt_thread_suspend>
    switch (flag)
 8012606:	e908001a 	bez      	r8, 0x801263a	// 801263a <rt_sem_take+0x62>
 801260a:	eb480001 	cmpnei      	r8, 1
 801260e:	081d      	bt      	0x8012648	// 8012648 <rt_sem_take+0x70>
            for (n = list->next; n != list; n = n->next)
 8012610:	9465      	ld.w      	r3, (r4, 0x14)
 8012612:	64da      	cmpne      	r6, r3
 8012614:	0c13      	bf      	0x801263a	// 801263a <rt_sem_take+0x62>
                sthread = rt_list_entry(n, struct rt_thread, tlist);
 8012616:	e4431013 	subi      	r2, r3, 20
                if (thread->current_priority < sthread->current_priority)
 801261a:	d8050035 	ld.b      	r0, (r5, 0x35)
 801261e:	d8220035 	ld.b      	r1, (r2, 0x35)
 8012622:	6440      	cmphs      	r0, r1
 8012624:	0808      	bt      	0x8012634	// 8012634 <rt_sem_take+0x5c>
 8012626:	042d      	br      	0x8012680	// 8012680 <rt_sem_take+0xa8>
 8012628:	d8230021 	ld.b      	r1, (r3, 0x21)
 801262c:	6440      	cmphs      	r0, r1
                sthread = rt_list_entry(n, struct rt_thread, tlist);
 801262e:	e4431013 	subi      	r2, r3, 20
                if (thread->current_priority < sthread->current_priority)
 8012632:	0c27      	bf      	0x8012680	// 8012680 <rt_sem_take+0xa8>
            for (n = list->next; n != list; n = n->next)
 8012634:	9360      	ld.w      	r3, (r3, 0x0)
 8012636:	64da      	cmpne      	r6, r3
 8012638:	0bf8      	bt      	0x8012628	// 8012628 <rt_sem_take+0x50>
    l->prev->next = n;
 801263a:	9446      	ld.w      	r2, (r4, 0x18)
                rt_list_insert_before(list, &(thread->tlist));
 801263c:	e4650013 	addi      	r3, r5, 20
 8012640:	b260      	st.w      	r3, (r2, 0x0)
    n->prev = l->prev;
 8012642:	b546      	st.w      	r2, (r5, 0x18)
    l->prev = n;
 8012644:	b466      	st.w      	r3, (r4, 0x18)
    n->next = l;
 8012646:	b5c5      	st.w      	r6, (r5, 0x14)
                                thread,
                                sem->parent.parent.flag);

            /* has waiting time, start thread timer */
            if (time > 0)
 8012648:	9860      	ld.w      	r3, (r14, 0x0)
 801264a:	e963000c 	blsz      	r3, 0x8012662	// 8012662 <rt_sem_take+0x8a>
            {
                RT_DEBUG_LOG(RT_DEBUG_IPC, ("set thread:%s to timer list\n",
                                            thread->name));

                /* reset the timeout of thread timer and start it */
                rt_timer_control(&(thread->thread_timer),
 801264e:	e4850043 	addi      	r4, r5, 68
 8012652:	6cbb      	mov      	r2, r14
 8012654:	3100      	movi      	r1, 0
 8012656:	6c13      	mov      	r0, r4
 8012658:	e0000982 	bsr      	0x801395c	// 801395c <rt_timer_control>
                                 RT_TIMER_CTRL_SET_TIME,
                                 &time);
                rt_timer_start(&(thread->thread_timer));
 801265c:	6c13      	mov      	r0, r4
 801265e:	e0000925 	bsr      	0x80138a8	// 80138a8 <rt_timer_start>
            }

            /* enable interrupt */
            rt_hw_interrupt_enable(temp);
 8012662:	6c1f      	mov      	r0, r7
 8012664:	e3ffefc3 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

            /* do schedule */
            rt_schedule();
 8012668:	e0000686 	bsr      	0x8013374	// 8013374 <rt_schedule>

            if (thread->error != RT_EOK)
 801266c:	950c      	ld.w      	r0, (r5, 0x30)
    }

    RT_OBJECT_HOOK_CALL(rt_object_take_hook, (&(sem->parent.parent)));

    return RT_EOK;
}
 801266e:	1401      	addi      	r14, r14, 4
 8012670:	1495      	pop      	r4-r8, r15
        sem->value --;
 8012672:	2e00      	subi      	r6, 1
 8012674:	acce      	st.h      	r6, (r4, 0x1c)
        rt_hw_interrupt_enable(temp);
 8012676:	e3ffefba 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
    return RT_EOK;
 801267a:	3000      	movi      	r0, 0
}
 801267c:	1401      	addi      	r14, r14, 4
 801267e:	1495      	pop      	r4-r8, r15
    l->prev->next = n;
 8012680:	9301      	ld.w      	r0, (r3, 0x4)
                    rt_list_insert_before(&(sthread->tlist), &(thread->tlist));
 8012682:	e4250013 	addi      	r1, r5, 20
 8012686:	b020      	st.w      	r1, (r0, 0x0)
    n->prev = l->prev;
 8012688:	b506      	st.w      	r0, (r5, 0x18)
    l->prev = n;
 801268a:	b321      	st.w      	r1, (r3, 0x4)
            if (time > 0)
 801268c:	9860      	ld.w      	r3, (r14, 0x0)
                    rt_list_insert_before(&(sthread->tlist), &(thread->tlist));
 801268e:	2213      	addi      	r2, 20
    n->next = l;
 8012690:	b545      	st.w      	r2, (r5, 0x14)
            if (time > 0)
 8012692:	e943ffde 	bhz      	r3, 0x801264e	// 801264e <rt_sem_take+0x76>
 8012696:	07e6      	br      	0x8012662	// 8012662 <rt_sem_take+0x8a>
            rt_hw_interrupt_enable(temp);
 8012698:	e3ffefa9 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
            return -RT_ETIMEOUT;
 801269c:	3000      	movi      	r0, 0
 801269e:	2801      	subi      	r0, 2
 80126a0:	07e7      	br      	0x801266e	// 801266e <rt_sem_take+0x96>
	...

080126a4 <rt_sem_release>:
 * @param sem the semaphore object
 *
 * @return the error code
 */
rt_err_t rt_sem_release(rt_sem_t sem)
{
 80126a4:	14d2      	push      	r4-r5, r15
 80126a6:	6d03      	mov      	r4, r0
    RT_OBJECT_HOOK_CALL(rt_object_put_hook, (&(sem->parent.parent)));

    need_schedule = RT_FALSE;

    /* disable interrupt */
    temp = rt_hw_interrupt_disable();
 80126a8:	e3ffef9c 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
 * @brief tests whether a list is empty
 * @param l the list to test.
 */
rt_inline int rt_list_isempty(const rt_list_t *l)
{
    return l->next == l;
 80126ac:	9465      	ld.w      	r3, (r4, 0x14)
    RT_DEBUG_LOG(RT_DEBUG_IPC, ("thread %s releases sem:%s, which value is: %d\n",
                                rt_thread_self()->name,
                                ((struct rt_object *)sem)->name,
                                sem->value));

    if (!rt_list_isempty(&sem->parent.suspend_thread))
 80126ae:	e4440013 	addi      	r2, r4, 20
 80126b2:	648e      	cmpne      	r3, r2
    temp = rt_hw_interrupt_disable();
 80126b4:	6d43      	mov      	r5, r0
    if (!rt_list_isempty(&sem->parent.suspend_thread))
 80126b6:	0c0c      	bf      	0x80126ce	// 80126ce <rt_sem_release+0x2a>
    rt_thread_resume(thread);
 80126b8:	e4031013 	subi      	r0, r3, 20
 80126bc:	e0000888 	bsr      	0x80137cc	// 80137cc <rt_thread_resume>
            return -RT_EFULL; /* value overflowed */
        }
    }

    /* enable interrupt */
    rt_hw_interrupt_enable(temp);
 80126c0:	6c17      	mov      	r0, r5
 80126c2:	e3ffef94 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

    /* resume a thread, re-schedule */
    if (need_schedule == RT_TRUE)
        rt_schedule();
 80126c6:	e0000657 	bsr      	0x8013374	// 8013374 <rt_schedule>

    return RT_EOK;
 80126ca:	3000      	movi      	r0, 0
}
 80126cc:	1492      	pop      	r4-r5, r15
        if(sem->value < RT_SEM_VALUE_MAX)
 80126ce:	8c6e      	ld.h      	r3, (r4, 0x1c)
 80126d0:	eb43ffff 	cmpnei      	r3, 65535
 80126d4:	0c07      	bf      	0x80126e2	// 80126e2 <rt_sem_release+0x3e>
            sem->value ++; /* increase value */
 80126d6:	2300      	addi      	r3, 1
 80126d8:	ac6e      	st.h      	r3, (r4, 0x1c)
    rt_hw_interrupt_enable(temp);
 80126da:	e3ffef88 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
    return RT_EOK;
 80126de:	3000      	movi      	r0, 0
}
 80126e0:	1492      	pop      	r4-r5, r15
            rt_hw_interrupt_enable(temp); /* enable interrupt */
 80126e2:	e3ffef84 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
            return -RT_EFULL; /* value overflowed */
 80126e6:	3000      	movi      	r0, 0
 80126e8:	2802      	subi      	r0, 3
}
 80126ea:	1492      	pop      	r4-r5, r15

080126ec <rt_interrupt_enter>:
 * @note please don't invoke this routine in application
 *
 * @see rt_interrupt_leave
 */
void rt_interrupt_enter(void)
{
 80126ec:	14d0      	push      	r15
    rt_base_t level;

    RT_DEBUG_LOG(RT_DEBUG_IRQ, ("irq coming..., irq nest:%d\n",
                                rt_interrupt_nest));

    level = rt_hw_interrupt_disable();
 80126ee:	e3ffef79 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    rt_interrupt_nest ++;
 80126f2:	1045      	lrw      	r2, 0x20035a9c	// 8012704 <rt_interrupt_enter+0x18>
 80126f4:	8260      	ld.b      	r3, (r2, 0x0)
 80126f6:	2300      	addi      	r3, 1
 80126f8:	74cc      	zextb      	r3, r3
 80126fa:	a260      	st.b      	r3, (r2, 0x0)
    RT_OBJECT_HOOK_CALL(rt_interrupt_enter_hook,());
    rt_hw_interrupt_enable(level);
 80126fc:	e3ffef77 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 8012700:	1490      	pop      	r15
 8012702:	0000      	.short	0x0000
 8012704:	20035a9c 	.long	0x20035a9c

08012708 <rt_interrupt_leave>:
 * @note please don't invoke this routine in application
 *
 * @see rt_interrupt_enter
 */
void rt_interrupt_leave(void)
{
 8012708:	14d0      	push      	r15
    rt_base_t level;

    RT_DEBUG_LOG(RT_DEBUG_IRQ, ("irq leave, irq nest:%d\n",
                                rt_interrupt_nest));

    level = rt_hw_interrupt_disable();
 801270a:	e3ffef6b 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    rt_interrupt_nest --;
 801270e:	1045      	lrw      	r2, 0x20035a9c	// 8012720 <rt_interrupt_leave+0x18>
 8012710:	8260      	ld.b      	r3, (r2, 0x0)
 8012712:	2b00      	subi      	r3, 1
 8012714:	74cc      	zextb      	r3, r3
 8012716:	a260      	st.b      	r3, (r2, 0x0)
    RT_OBJECT_HOOK_CALL(rt_interrupt_leave_hook,());
    rt_hw_interrupt_enable(level);
 8012718:	e3ffef69 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 801271c:	1490      	pop      	r15
 801271e:	0000      	.short	0x0000
 8012720:	20035a9c 	.long	0x20035a9c

08012724 <print_number>:
#endif
                          int   base,
                          int   s,
                          int   type)
#endif
{
 8012724:	14c3      	push      	r4-r6
 8012726:	1424      	subi      	r14, r14, 16
 8012728:	daae2009 	ld.w      	r21, (r14, 0x24)
    register int i;
    register int size;

    size = s;

    digits = (type & LARGE) ? large_digits : small_digits;
 801272c:	e5952040 	andi      	r12, r21, 64
    if (type & LEFT)
 8012730:	e4d52010 	andi      	r6, r21, 16
    digits = (type & LARGE) ? large_digits : small_digits;
 8012734:	eb4c0000 	cmpnei      	r12, 0
 8012738:	ea940071 	lrw      	r20, 0x80159dc	// 80128fc <print_number+0x1d8>
 801273c:	ea8c0071 	lrw      	r12, 0x8015938	// 8012900 <print_number+0x1dc>
 8012740:	c68c0c40 	inct      	r20, r12, 0
{
 8012744:	da4e2007 	ld.w      	r18, (r14, 0x1c)
 8012748:	db2e2008 	ld.w      	r25, (r14, 0x20)
    if (type & LEFT)
 801274c:	e9060004 	bez      	r6, 0x8012754	// 8012754 <print_number+0x30>
        type &= ~ZEROPAD;
 8012750:	c4152835 	bclri      	r21, r21, 0

    c = (type & ZEROPAD) ? '0' : ' ';
 8012754:	e5952001 	andi      	r12, r21, 1

    /* get sign */
    sign = 0;
    if (type & SIGN)
 8012758:	e4b52002 	andi      	r5, r21, 2
    c = (type & ZEROPAD) ? '0' : ' ';
 801275c:	eb4c0000 	cmpnei      	r12, 0
 8012760:	3420      	movi      	r4, 32
 8012762:	ea0c0030 	movi      	r12, 48
 8012766:	c48c0c40 	inct      	r4, r12, 0
    if (type & SIGN)
 801276a:	e9050009 	bez      	r5, 0x801277c	// 801277c <print_number+0x58>
    {
        if (num < 0)
 801276e:	e9820092 	blz      	r2, 0x8012892	// 8012892 <print_number+0x16e>
        {
            sign = '-';
            num = -num;
        }
        else if (type & PLUS)
 8012772:	e5952004 	andi      	r12, r21, 4
 8012776:	e90c00b1 	bez      	r12, 0x80128d8	// 80128d8 <print_number+0x1b4>
            sign = '+';
 801277a:	352b      	movi      	r5, 43
            size--;
    }
#endif

    i = 0;
    if (num == 0)
 801277c:	e9220090 	bnez      	r2, 0x801289c	// 801289c <print_number+0x178>
        tmp[i++] = '0';
 8012780:	3330      	movi      	r3, 48
 8012782:	c40e4837 	lsli      	r23, r14, 0
 8012786:	dc6e0000 	st.b      	r3, (r14, 0x0)
 801278a:	c4024833 	lsli      	r19, r2, 0
 801278e:	ea180001 	movi      	r24, 1
    size -= precision;
#else
    size -= i;
#endif

    if (!(type & (ZEROPAD | LEFT)))
 8012792:	e6b52011 	andi      	r21, r21, 17
 8012796:	fb38ccac 	max.s32      	r12, r24, r25
    size -= precision;
 801279a:	c5920092 	subu      	r18, r18, r12
    if (!(type & (ZEROPAD | LEFT)))
 801279e:	e9350022 	bnez      	r21, 0x80127e2	// 80127e2 <print_number+0xbe>
    {
        if ((sign) && (size > 0))
 80127a2:	e9250068 	bnez      	r5, 0x8012872	// 8012872 <print_number+0x14e>
            size--;

        while (size-- > 0)
 80127a6:	e6921000 	subi      	r20, r18, 1
 80127aa:	e97200a5 	blsz      	r18, 0x80128f4	// 80128f4 <print_number+0x1d0>
        tmp[i++] = '0';
 80127ae:	6cc3      	mov      	r3, r0
 80127b0:	e5b40000 	addi      	r13, r20, 1
        {
            if (buf < end)
                *buf = ' ';
 80127b4:	ea120020 	movi      	r18, 32
            if (buf < end)
 80127b8:	644c      	cmphs      	r3, r1
 80127ba:	0803      	bt      	0x80127c0	// 80127c0 <print_number+0x9c>
                *buf = ' ';
 80127bc:	de430000 	st.b      	r18, (r3, 0x0)
            ++ buf;
 80127c0:	2300      	addi      	r3, 1
 80127c2:	c46d0082 	subu      	r2, r13, r3
 80127c6:	6080      	addu      	r2, r0
        while (size-- > 0)
 80127c8:	e942fff8 	bhz      	r2, 0x80127b8	// 80127b8 <print_number+0x94>
 80127cc:	3200      	movi      	r2, 0
 80127ce:	e4741000 	subi      	r3, r20, 1
 80127d2:	f854ccb4 	max.s32      	r20, r20, r2
 80127d6:	c6830092 	subu      	r18, r3, r20
 80127da:	e6940000 	addi      	r20, r20, 1
 80127de:	c6800020 	addu      	r0, r0, r20
        }
    }

    if (sign)
 80127e2:	e9250051 	bnez      	r5, 0x8012884	// 8012884 <print_number+0x160>
        }
    }
#endif

    /* no align to the left */
    if (!(type & LEFT))
 80127e6:	e9260013 	bnez      	r6, 0x801280c	// 801280c <print_number+0xe8>
    {
        while (size-- > 0)
 80127ea:	e4721000 	subi      	r3, r18, 1
 80127ee:	e9720080 	blsz      	r18, 0x80128ee	// 80128ee <print_number+0x1ca>
 80127f2:	c6400032 	addu      	r18, r0, r18
        {
            if (buf < end)
 80127f6:	6440      	cmphs      	r0, r1
 80127f8:	0802      	bt      	0x80127fc	// 80127fc <print_number+0xd8>
                *buf = c;
 80127fa:	a080      	st.b      	r4, (r0, 0x0)
            ++ buf;
 80127fc:	2000      	addi      	r0, 1
        while (size-- > 0)
 80127fe:	c4120480 	cmpne      	r18, r0
 8012802:	0bfa      	bt      	0x80127f6	// 80127f6 <print_number+0xd2>
 8012804:	ea120000 	movi      	r18, 0
 8012808:	e6521000 	subi      	r18, r18, 1
        }
    }

#ifdef RT_PRINTF_PRECISION
    while (i < precision--)
 801280c:	c5980440 	cmplt      	r24, r12
 8012810:	0c0b      	bf      	0x8012826	// 8012826 <print_number+0x102>
 8012812:	c70c0083 	subu      	r3, r12, r24
 8012816:	60c0      	addu      	r3, r0
    {
        if (buf < end)
            *buf = '0';
 8012818:	3230      	movi      	r2, 48
        if (buf < end)
 801281a:	6440      	cmphs      	r0, r1
 801281c:	0802      	bt      	0x8012820	// 8012820 <print_number+0xfc>
            *buf = '0';
 801281e:	a040      	st.b      	r2, (r0, 0x0)
        ++ buf;
 8012820:	2000      	addi      	r0, 1
    while (i < precision--)
 8012822:	64c2      	cmpne      	r0, r3
 8012824:	0bfb      	bt      	0x801281a	// 801281a <print_number+0xf6>
    }
#endif

    /* put number in the temporary buffer */
    while (i-- > 0 && (precision_bak != 0))
 8012826:	e9190019 	bez      	r25, 0x8012858	// 8012858 <print_number+0x134>
 801282a:	ea0d0001 	movi      	r13, 1
 801282e:	c6770022 	addu      	r2, r23, r19
 8012832:	6cc3      	mov      	r3, r0
 8012834:	c6ed008d 	subu      	r13, r13, r23
    {
        if (buf < end)
 8012838:	644c      	cmphs      	r3, r1
 801283a:	0805      	bt      	0x8012844	// 8012844 <print_number+0x120>
            *buf = tmp[i];
 801283c:	d9820000 	ld.b      	r12, (r2, 0x0)
 8012840:	dd830000 	st.b      	r12, (r3, 0x0)
 8012844:	2a00      	subi      	r2, 1
    while (i-- > 0 && (precision_bak != 0))
 8012846:	c44d002c 	addu      	r12, r13, r2
        ++ buf;
 801284a:	2300      	addi      	r3, 1
    while (i-- > 0 && (precision_bak != 0))
 801284c:	e94cfff6 	bhz      	r12, 0x8012838	// 8012838 <print_number+0x114>
 8012850:	e6730000 	addi      	r19, r19, 1
 8012854:	c6600020 	addu      	r0, r0, r19
    }

    while (size-- > 0)
 8012858:	e972000b 	blsz      	r18, 0x801286e	// 801286e <print_number+0x14a>
 801285c:	c6400023 	addu      	r3, r0, r18
    {
        if (buf < end)
            *buf = ' ';
 8012860:	3220      	movi      	r2, 32
        if (buf < end)
 8012862:	6440      	cmphs      	r0, r1
 8012864:	0802      	bt      	0x8012868	// 8012868 <print_number+0x144>
            *buf = ' ';
 8012866:	a040      	st.b      	r2, (r0, 0x0)
        ++ buf;
 8012868:	2000      	addi      	r0, 1
    while (size-- > 0)
 801286a:	640e      	cmpne      	r3, r0
 801286c:	0bfb      	bt      	0x8012862	// 8012862 <print_number+0x13e>
    }

    return buf;
}
 801286e:	1404      	addi      	r14, r14, 16
 8012870:	1483      	pop      	r4-r6
        if ((sign) && (size > 0))
 8012872:	e972003b 	blsz      	r18, 0x80128e8	// 80128e8 <print_number+0x1c4>
        while (size-- > 0)
 8012876:	eb520001 	cmpnei      	r18, 1
 801287a:	e6921001 	subi      	r20, r18, 2
 801287e:	0b98      	bt      	0x80127ae	// 80127ae <print_number+0x8a>
 8012880:	c4144832 	lsli      	r18, r20, 0
        if (buf < end)
 8012884:	6440      	cmphs      	r0, r1
 8012886:	0802      	bt      	0x801288a	// 801288a <print_number+0x166>
            *buf = sign;
 8012888:	a0a0      	st.b      	r5, (r0, 0x0)
        -- size;
 801288a:	e6521000 	subi      	r18, r18, 1
        ++ buf;
 801288e:	2000      	addi      	r0, 1
 8012890:	07ab      	br      	0x80127e6	// 80127e6 <print_number+0xc2>
            num = -num;
 8012892:	ea0c0000 	movi      	r12, 0
 8012896:	c44c0082 	subu      	r2, r12, r2
            sign = '-';
 801289a:	352d      	movi      	r5, 45
 801289c:	c40e4837 	lsli      	r23, r14, 0
 80128a0:	6f7b      	mov      	r13, r14
            tmp[i++] = digits[divide(&num, base)];
 80128a2:	ea130000 	movi      	r19, 0
 80128a6:	040c      	br      	0x80128be	// 80128be <print_number+0x19a>
        res = (int)(((unsigned long)*n) % 16U);
 80128a8:	e582200f 	andi      	r12, r2, 15
        *n = (long)(((unsigned long)*n) / 16U);
 80128ac:	4a44      	lsri      	r2, r2, 4
            tmp[i++] = digits[divide(&num, base)];
 80128ae:	d194002c 	ldr.b      	r12, (r20, r12 << 0)
 80128b2:	d40d800c 	stbi.b      	r12, (r13)
        while (num != 0)
 80128b6:	e902ff6e 	bez      	r2, 0x8012792	// 8012792 <print_number+0x6e>
            tmp[i++] = digits[divide(&num, base)];
 80128ba:	c4184833 	lsli      	r19, r24, 0
    if (base == 10)
 80128be:	3b4a      	cmpnei      	r3, 10
            tmp[i++] = digits[divide(&num, base)];
 80128c0:	e7130000 	addi      	r24, r19, 1
    if (base == 10)
 80128c4:	0bf2      	bt      	0x80128a8	// 80128a8 <print_number+0x184>
        res = (int)(((unsigned long)*n) % 10U);
 80128c6:	c4628036 	divu      	r22, r2, r3
 80128ca:	c476842c 	mult      	r12, r22, r3
 80128ce:	c582008c 	subu      	r12, r2, r12
        *n = (long)(((unsigned long)*n) / 10U);
 80128d2:	c4164822 	lsli      	r2, r22, 0
 80128d6:	07ec      	br      	0x80128ae	// 80128ae <print_number+0x18a>
        else if (type & SPACE)
 80128d8:	e5952008 	andi      	r12, r21, 8
    sign = 0;
 80128dc:	eb4c0000 	cmpnei      	r12, 0
 80128e0:	c4000505 	mvc      	r5
 80128e4:	45a5      	lsli      	r5, r5, 5
 80128e6:	074b      	br      	0x801277c	// 801277c <print_number+0x58>
        while (size-- > 0)
 80128e8:	e6521000 	subi      	r18, r18, 1
 80128ec:	07cc      	br      	0x8012884	// 8012884 <print_number+0x160>
        while (size-- > 0)
 80128ee:	c4034832 	lsli      	r18, r3, 0
 80128f2:	078d      	br      	0x801280c	// 801280c <print_number+0xe8>
        while (size-- > 0)
 80128f4:	c4144832 	lsli      	r18, r20, 0
 80128f8:	0777      	br      	0x80127e6	// 80127e6 <print_number+0xc2>
 80128fa:	0000      	.short	0x0000
 80128fc:	080159dc 	.long	0x080159dc
 8012900:	08015938 	.long	0x08015938

08012904 <rt_memset>:
    if (!TOO_SMALL(count) && !UNALIGNED(s))
 8012904:	3a03      	cmphsi      	r2, 4
 8012906:	080b      	bt      	0x801291c	// 801291c <rt_memset+0x18>
    char *m = (char *)s;
 8012908:	6cc3      	mov      	r3, r0
    while (count--)
 801290a:	e9020008 	bez      	r2, 0x801291a	// 801291a <rt_memset+0x16>
 801290e:	7444      	zextb      	r1, r1
 8012910:	608c      	addu      	r2, r3
        *m++ = (char)d;
 8012912:	d4038001 	stbi.b      	r1, (r3)
    while (count--)
 8012916:	648e      	cmpne      	r3, r2
 8012918:	0bfd      	bt      	0x8012912	// 8012912 <rt_memset+0xe>
}
 801291a:	783c      	jmp      	r15
    if (!TOO_SMALL(count) && !UNALIGNED(s))
 801291c:	e4602003 	andi      	r3, r0, 3
 8012920:	e923004f 	bnez      	r3, 0x80129be	// 80129be <rt_memset+0xba>
    unsigned int d = c & 0xff;  /* To avoid sign extension, copy C to an
 8012924:	e46120ff 	andi      	r3, r1, 255
            buffer = (d << 8) | d;
 8012928:	c503482d 	lsli      	r13, r3, 8
 801292c:	6f4c      	or      	r13, r3
            buffer |= (buffer << 16);
 801292e:	c60d4823 	lsli      	r3, r13, 16
 8012932:	6f4c      	or      	r13, r3
        while (count >= LBLOCKSIZE * 4)
 8012934:	330f      	movi      	r3, 15
 8012936:	648c      	cmphs      	r3, r2
 8012938:	0845      	bt      	0x80129c2	// 80129c2 <rt_memset+0xbe>
 801293a:	ea0c0000 	movi      	r12, 0
 801293e:	e58c100f 	subi      	r12, r12, 16
 8012942:	e462100f 	subi      	r3, r2, 16
 8012946:	c5832032 	and      	r18, r3, r12
 801294a:	e652000f 	addi      	r18, r18, 16
 801294e:	c6400032 	addu      	r18, r0, r18
 8012952:	6f03      	mov      	r12, r0
            *aligned_addr++ = buffer;
 8012954:	ddac2000 	st.w      	r13, (r12, 0x0)
            *aligned_addr++ = buffer;
 8012958:	ddac2001 	st.w      	r13, (r12, 0x4)
            *aligned_addr++ = buffer;
 801295c:	ddac2002 	st.w      	r13, (r12, 0x8)
            *aligned_addr++ = buffer;
 8012960:	ddac2003 	st.w      	r13, (r12, 0xc)
 8012964:	e58c000f 	addi      	r12, r12, 16
        while (count >= LBLOCKSIZE * 4)
 8012968:	c5920480 	cmpne      	r18, r12
 801296c:	0bf4      	bt      	0x8012954	// 8012954 <rt_memset+0x50>
 801296e:	ea0c0000 	movi      	r12, 0
 8012972:	e58c100f 	subi      	r12, r12, 16
 8012976:	68f0      	and      	r3, r12
 8012978:	e442200f 	andi      	r2, r2, 15
        while (count >= LBLOCKSIZE)
 801297c:	ea0c0003 	movi      	r12, 3
 8012980:	64b0      	cmphs      	r12, r2
 8012982:	230f      	addi      	r3, 16
 8012984:	60c0      	addu      	r3, r0
 8012986:	0bc2      	bt      	0x801290a	// 801290a <rt_memset+0x6>
 8012988:	e6621003 	subi      	r19, r2, 4
 801298c:	c4132832 	bclri      	r18, r19, 0
 8012990:	c4322832 	bclri      	r18, r18, 1
 8012994:	e6520003 	addi      	r18, r18, 4
 8012998:	6f0f      	mov      	r12, r3
 801299a:	c6430032 	addu      	r18, r3, r18
            *aligned_addr++ = buffer;
 801299e:	d40c880d 	stbi.w      	r13, (r12)
        while (count >= LBLOCKSIZE)
 80129a2:	c64c0480 	cmpne      	r12, r18
 80129a6:	0bfc      	bt      	0x801299e	// 801299e <rt_memset+0x9a>
 80129a8:	c4132833 	bclri      	r19, r19, 0
 80129ac:	c4332833 	bclri      	r19, r19, 1
 80129b0:	e6730003 	addi      	r19, r19, 4
 80129b4:	e4422003 	andi      	r2, r2, 3
            *aligned_addr++ = buffer;
 80129b8:	c6630023 	addu      	r3, r3, r19
 80129bc:	07a7      	br      	0x801290a	// 801290a <rt_memset+0x6>
    char *m = (char *)s;
 80129be:	6cc3      	mov      	r3, r0
 80129c0:	07a7      	br      	0x801290e	// 801290e <rt_memset+0xa>
        aligned_addr = (unsigned long *)s;
 80129c2:	6cc3      	mov      	r3, r0
 80129c4:	07e2      	br      	0x8012988	// 8012988 <rt_memset+0x84>
	...

080129c8 <rt_strncpy>:
    if (n != 0)
 80129c8:	e9020019 	bez      	r2, 0x80129fa	// 80129fa <rt_strncpy+0x32>
 80129cc:	6cc3      	mov      	r3, r0
 80129ce:	0406      	br      	0x80129da	// 80129da <rt_strncpy+0x12>
        } while (--n != 0);
 80129d0:	2a00      	subi      	r2, 1
 80129d2:	2100      	addi      	r1, 1
            if ((*d++ = *s++) == 0)
 80129d4:	6cf7      	mov      	r3, r13
        } while (--n != 0);
 80129d6:	e9020012 	bez      	r2, 0x80129fa	// 80129fa <rt_strncpy+0x32>
            if ((*d++ = *s++) == 0)
 80129da:	d9810000 	ld.b      	r12, (r1, 0x0)
 80129de:	e5a30000 	addi      	r13, r3, 1
 80129e2:	dd830000 	st.b      	r12, (r3, 0x0)
 80129e6:	e92cfff5 	bnez      	r12, 0x80129d0	// 80129d0 <rt_strncpy+0x8>
                while (--n != 0)
 80129ea:	5a23      	subi      	r1, r2, 1
 80129ec:	e9010007 	bez      	r1, 0x80129fa	// 80129fa <rt_strncpy+0x32>
 80129f0:	60c8      	addu      	r3, r2
                    *d++ = 0;
 80129f2:	d40d800c 	stbi.b      	r12, (r13)
                while (--n != 0)
 80129f6:	64f6      	cmpne      	r13, r3
 80129f8:	0bfd      	bt      	0x80129f2	// 80129f2 <rt_strncpy+0x2a>
}
 80129fa:	783c      	jmp      	r15

080129fc <rt_vsnprintf>:

rt_int32_t rt_vsnprintf(char       *buf,
                        rt_size_t   size,
                        const char *fmt,
                        va_list     args)
{
 80129fc:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012a00:	1423      	subi      	r14, r14, 12
#ifdef RT_PRINTF_PRECISION
    int precision;      /* min. # of digits for integers and max for a string */
#endif

    str = buf;
    end = buf + size;
 8012a02:	c420002a 	addu      	r10, r0, r1

    /* Make sure end is always >= buf */
    if (end < buf)
 8012a06:	6428      	cmphs      	r10, r0
{
 8012a08:	c4014830 	lsli      	r16, r1, 0
 8012a0c:	6d0b      	mov      	r4, r2
 8012a0e:	6ecf      	mov      	r11, r3
    {
        end  = ((char *) - 1);
        size = end - buf;
 8012a10:	6e03      	mov      	r8, r0
    if (end < buf)
 8012a12:	0807      	bt      	0x8012a20	// 8012a20 <rt_vsnprintf+0x24>
        end  = ((char *) - 1);
 8012a14:	ea0a0000 	movi      	r10, 0
        size = end - buf;
 8012a18:	c4002490 	nor      	r16, r0, r0
        end  = ((char *) - 1);
 8012a1c:	e54a1000 	subi      	r10, r10, 1
    }

    for (; *fmt ; ++fmt)
 8012a20:	8460      	ld.b      	r3, (r4, 0x0)
 8012a22:	e903007d 	bez      	r3, 0x8012b1c	// 8012b1c <rt_vsnprintf+0x120>
 8012a26:	ea090000 	movi      	r9, 0
        }

        /* the default base */
        base = 10;

        switch (*fmt)
 8012a2a:	11d0      	lrw      	r6, 0x8015598	// 8012ae8 <rt_vsnprintf+0xec>
                ++ s;
            }

            while (len < field_width--)
            {
                if (str < end) *str = ' ';
 8012a2c:	ea110020 	movi      	r17, 32
        switch (*fmt)
 8012a30:	11ef      	lrw      	r7, 0x80156e8	// 8012aec <rt_vsnprintf+0xf0>
 8012a32:	0409      	br      	0x8012a44	// 8012a44 <rt_vsnprintf+0x48>
            if (str < end)
 8012a34:	6680      	cmphs      	r0, r10
 8012a36:	0802      	bt      	0x8012a3a	// 8012a3a <rt_vsnprintf+0x3e>
                *str = *fmt;
 8012a38:	a060      	st.b      	r3, (r0, 0x0)
            ++ str;
 8012a3a:	2000      	addi      	r0, 1
 8012a3c:	8461      	ld.b      	r3, (r4, 0x1)
    for (; *fmt ; ++fmt)
 8012a3e:	2400      	addi      	r4, 1
 8012a40:	e903006c 	bez      	r3, 0x8012b18	// 8012b18 <rt_vsnprintf+0x11c>
        if (*fmt != '%')
 8012a44:	eb430025 	cmpnei      	r3, 37
 8012a48:	0bf6      	bt      	0x8012a34	// 8012a34 <rt_vsnprintf+0x38>
 8012a4a:	3100      	movi      	r1, 0
 8012a4c:	0410      	br      	0x8012a6c	// 8012a6c <rt_vsnprintf+0x70>
            else if (*fmt == '+') flags |= PLUS;
 8012a4e:	eb43002b 	cmpnei      	r3, 43
 8012a52:	0c15      	bf      	0x8012a7c	// 8012a7c <rt_vsnprintf+0x80>
            else if (*fmt == ' ') flags |= SPACE;
 8012a54:	eb430020 	cmpnei      	r3, 32
 8012a58:	0c15      	bf      	0x8012a82	// 8012a82 <rt_vsnprintf+0x86>
            else if (*fmt == '#') flags |= SPECIAL;
 8012a5a:	eb430023 	cmpnei      	r3, 35
 8012a5e:	0c15      	bf      	0x8012a88	// 8012a88 <rt_vsnprintf+0x8c>
            else if (*fmt == '0') flags |= ZEROPAD;
 8012a60:	eb430030 	cmpnei      	r3, 48
 8012a64:	0815      	bt      	0x8012a8e	// 8012a8e <rt_vsnprintf+0x92>
 8012a66:	ec210001 	ori      	r1, r1, 1
 8012a6a:	6d17      	mov      	r4, r5
            if (*fmt == '-') flags |= LEFT;
 8012a6c:	8461      	ld.b      	r3, (r4, 0x1)
 8012a6e:	eb43002d 	cmpnei      	r3, 45
            ++ fmt;
 8012a72:	5ca2      	addi      	r5, r4, 1
            if (*fmt == '-') flags |= LEFT;
 8012a74:	0bed      	bt      	0x8012a4e	// 8012a4e <rt_vsnprintf+0x52>
 8012a76:	ec210010 	ori      	r1, r1, 16
 8012a7a:	07f8      	br      	0x8012a6a	// 8012a6a <rt_vsnprintf+0x6e>
            else if (*fmt == '+') flags |= PLUS;
 8012a7c:	ec210004 	ori      	r1, r1, 4
 8012a80:	07f5      	br      	0x8012a6a	// 8012a6a <rt_vsnprintf+0x6e>
            else if (*fmt == ' ') flags |= SPACE;
 8012a82:	ec210008 	ori      	r1, r1, 8
 8012a86:	07f2      	br      	0x8012a6a	// 8012a6a <rt_vsnprintf+0x6e>
            else if (*fmt == '#') flags |= SPECIAL;
 8012a88:	ec210020 	ori      	r1, r1, 32
 8012a8c:	07ef      	br      	0x8012a6a	// 8012a6a <rt_vsnprintf+0x6e>
        if (_ISDIGIT(*fmt)) field_width = skip_atoi(&fmt);
 8012a8e:	e583102f 	subi      	r12, r3, 48
 8012a92:	eb0c0009 	cmphsi      	r12, 10
 8012a96:	6c8f      	mov      	r2, r3
 8012a98:	084f      	bt      	0x8012b36	// 8012b36 <rt_vsnprintf+0x13a>
 8012a9a:	ea0c0000 	movi      	r12, 0
        i = i * 10 + *((*s)++) - '0';
 8012a9e:	ea13000a 	movi      	r19, 10
    while (_ISDIGIT(**s))
 8012aa2:	ea120009 	movi      	r18, 9
        i = i * 10 + *((*s)++) - '0';
 8012aa6:	2500      	addi      	r5, 1
 8012aa8:	fa6c8442 	mula.32.l      	r2, r12, r19
 8012aac:	e582102f 	subi      	r12, r2, 48
    while (_ISDIGIT(**s))
 8012ab0:	8540      	ld.b      	r2, (r5, 0x0)
 8012ab2:	e5a2102f 	subi      	r13, r2, 48
 8012ab6:	c5b20420 	cmphs      	r18, r13
 8012aba:	6ccb      	mov      	r3, r2
 8012abc:	0bf5      	bt      	0x8012aa6	// 8012aa6 <rt_vsnprintf+0xaa>
        if (*fmt == '.')
 8012abe:	eb43002e 	cmpnei      	r3, 46
 8012ac2:	0c44      	bf      	0x8012b4a	// 8012b4a <rt_vsnprintf+0x14e>
        precision = -1;
 8012ac4:	ea0d0000 	movi      	r13, 0
 8012ac8:	e5ad1000 	subi      	r13, r13, 1
        if (*fmt == 'h' || *fmt == 'l')
 8012acc:	e44320fb 	andi      	r2, r3, 251
 8012ad0:	eb420068 	cmpnei      	r2, 104
 8012ad4:	0c61      	bf      	0x8012b96	// 8012b96 <rt_vsnprintf+0x19a>
        switch (*fmt)
 8012ad6:	2b24      	subi      	r3, 37
 8012ad8:	74cc      	zextb      	r3, r3
 8012ada:	eb030053 	cmphsi      	r3, 84
 8012ade:	0934      	bt      	0x8012d46	// 8012d46 <rt_vsnprintf+0x34a>
 8012ae0:	d0660883 	ldr.w      	r3, (r6, r3 << 2)
 8012ae4:	780c      	jmp      	r3
 8012ae6:	0000      	.short	0x0000
 8012ae8:	08015598 	.long	0x08015598
 8012aec:	080156e8 	.long	0x080156e8
        case 'o':
            base = 8;
            break;

        case 'X':
            flags |= LARGE;
 8012af0:	ec210040 	ori      	r1, r1, 64
 8012af4:	6d17      	mov      	r4, r5
 8012af6:	3310      	movi      	r3, 16
            num = (rt_uint16_t)va_arg(args, rt_int32_t);
            if (flags & SIGN) num = (rt_int16_t)num;
        }
        else
        {
            num = va_arg(args, rt_uint32_t);
 8012af8:	d84b2000 	ld.w      	r2, (r11, 0x0)
 8012afc:	e56b0003 	addi      	r11, r11, 4
            if (flags & SIGN) num = (rt_int32_t)num;
        }
#ifdef RT_PRINTF_PRECISION
        str = print_number(str, end, num, base, field_width, precision, flags);
 8012b00:	b822      	st.w      	r1, (r14, 0x8)
 8012b02:	ddae2001 	st.w      	r13, (r14, 0x4)
 8012b06:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8012b0a:	6c6b      	mov      	r1, r10
 8012b0c:	e3fffe0c 	bsr      	0x8012724	// 8012724 <print_number>
 8012b10:	8461      	ld.b      	r3, (r4, 0x1)
    for (; *fmt ; ++fmt)
 8012b12:	2400      	addi      	r4, 1
 8012b14:	e923ff98 	bnez      	r3, 0x8012a44	// 8012a44 <rt_vsnprintf+0x48>
 8012b18:	c5000083 	subu      	r3, r0, r8
#else
        str = print_number(str, end, num, base, field_width, flags);
#endif
    }

    if (size > 0)
 8012b1c:	e9100009 	bez      	r16, 0x8012b2e	// 8012b2e <rt_vsnprintf+0x132>
    {
        if (str < end) *str = '\0';
 8012b20:	6680      	cmphs      	r0, r10
 8012b22:	0c4c      	bf      	0x8012bba	// 8012bba <rt_vsnprintf+0x1be>
        else
        {
            end[-1] = '\0';
 8012b24:	e54a1000 	subi      	r10, r10, 1
 8012b28:	3200      	movi      	r2, 0
 8012b2a:	dc4a0000 	st.b      	r2, (r10, 0x0)

    /* the trailing null byte doesn't count towards the total
    * ++str;
    */
    return str - buf;
}
 8012b2e:	6c0f      	mov      	r0, r3
 8012b30:	1403      	addi      	r14, r14, 12
 8012b32:	ebc00058 	pop      	r4-r11, r15, r16-r17
        else if (*fmt == '*')
 8012b36:	eb43002a 	cmpnei      	r3, 42
 8012b3a:	0d15      	bf      	0x8012d64	// 8012d64 <rt_vsnprintf+0x368>
        if (*fmt == '.')
 8012b3c:	eb43002e 	cmpnei      	r3, 46
        field_width = -1;
 8012b40:	ea0c0000 	movi      	r12, 0
 8012b44:	e58c1000 	subi      	r12, r12, 1
        if (*fmt == '.')
 8012b48:	0bbe      	bt      	0x8012ac4	// 8012ac4 <rt_vsnprintf+0xc8>
            if (_ISDIGIT(*fmt)) precision = skip_atoi(&fmt);
 8012b4a:	8541      	ld.b      	r2, (r5, 0x1)
 8012b4c:	e5a2102f 	subi      	r13, r2, 48
 8012b50:	eb0d0009 	cmphsi      	r13, 10
            ++ fmt;
 8012b54:	e6450000 	addi      	r18, r5, 1
            if (_ISDIGIT(*fmt)) precision = skip_atoi(&fmt);
 8012b58:	6ccb      	mov      	r3, r2
 8012b5a:	0828      	bt      	0x8012baa	// 8012baa <rt_vsnprintf+0x1ae>
 8012b5c:	ea0d0000 	movi      	r13, 0
        i = i * 10 + *((*s)++) - '0';
 8012b60:	ea15000a 	movi      	r21, 10
    while (_ISDIGIT(**s))
 8012b64:	ea140009 	movi      	r20, 9
        i = i * 10 + *((*s)++) - '0';
 8012b68:	e6520000 	addi      	r18, r18, 1
    while (_ISDIGIT(**s))
 8012b6c:	d8720000 	ld.b      	r3, (r18, 0x0)
 8012b70:	e663102f 	subi      	r19, r3, 48
 8012b74:	c6740420 	cmphs      	r20, r19
        i = i * 10 + *((*s)++) - '0';
 8012b78:	faad8442 	mula.32.l      	r2, r13, r21
 8012b7c:	e5a2102f 	subi      	r13, r2, 48
    while (_ISDIGIT(**s))
 8012b80:	6c8f      	mov      	r2, r3
 8012b82:	0bf3      	bt      	0x8012b68	// 8012b68 <rt_vsnprintf+0x16c>
        if (*fmt == 'h' || *fmt == 'l')
 8012b84:	e44320fb 	andi      	r2, r3, 251
 8012b88:	eb420068 	cmpnei      	r2, 104
 8012b8c:	f92dccad 	max.s32      	r13, r13, r9
        i = i * 10 + *((*s)++) - '0';
 8012b90:	c4124825 	lsli      	r5, r18, 0
        if (*fmt == 'h' || *fmt == 'l')
 8012b94:	0ba1      	bt      	0x8012ad6	// 8012ad6 <rt_vsnprintf+0xda>
        switch (*fmt)
 8012b96:	8541      	ld.b      	r2, (r5, 0x1)
 8012b98:	2a24      	subi      	r2, 37
 8012b9a:	7488      	zextb      	r2, r2
 8012b9c:	eb020053 	cmphsi      	r2, 84
            ++ fmt;
 8012ba0:	5d82      	addi      	r4, r5, 1
        switch (*fmt)
 8012ba2:	08d1      	bt      	0x8012d44	// 8012d44 <rt_vsnprintf+0x348>
 8012ba4:	d0470882 	ldr.w      	r2, (r7, r2 << 2)
 8012ba8:	7808      	jmp      	r2
            else if (*fmt == '*')
 8012baa:	eb42002a 	cmpnei      	r2, 42
 8012bae:	0d0d      	bf      	0x8012dc8	// 8012dc8 <rt_vsnprintf+0x3cc>
            ++ fmt;
 8012bb0:	c4124825 	lsli      	r5, r18, 0
            if (precision < 0) precision = 0;
 8012bb4:	ea0d0000 	movi      	r13, 0
 8012bb8:	078a      	br      	0x8012acc	// 8012acc <rt_vsnprintf+0xd0>
        if (str < end) *str = '\0';
 8012bba:	3200      	movi      	r2, 0
 8012bbc:	a040      	st.b      	r2, (r0, 0x0)
}
 8012bbe:	6c0f      	mov      	r0, r3
 8012bc0:	1403      	addi      	r14, r14, 12
 8012bc2:	ebc00058 	pop      	r4-r11, r15, r16-r17
            ++ fmt;
 8012bc6:	6d53      	mov      	r5, r4
            s = va_arg(args, char *);
 8012bc8:	da4b2000 	ld.w      	r18, (r11, 0x0)
 8012bcc:	e68b0003 	addi      	r20, r11, 4
            if (!s) s = "(NULL)";
 8012bd0:	e9120105 	bez      	r18, 0x8012dda	// 8012dda <rt_vsnprintf+0x3de>
            for (len = 0; (len != field_width) && (s[len] != '\0'); len++);
 8012bd4:	e90c0014 	bez      	r12, 0x8012bfc	// 8012bfc <rt_vsnprintf+0x200>
 8012bd8:	d8720000 	ld.b      	r3, (r18, 0x0)
 8012bdc:	e9030011 	bez      	r3, 0x8012bfe	// 8012bfe <rt_vsnprintf+0x202>
 8012be0:	e4520000 	addi      	r2, r18, 1
            if (!s) s = "(NULL)";
 8012be4:	3300      	movi      	r3, 0
 8012be6:	0408      	br      	0x8012bf6	// 8012bf6 <rt_vsnprintf+0x1fa>
 8012be8:	2200      	addi      	r2, 1
            for (len = 0; (len != field_width) && (s[len] != '\0'); len++);
 8012bea:	e6621000 	subi      	r19, r2, 1
 8012bee:	da730000 	ld.b      	r19, (r19, 0x0)
 8012bf2:	e9130006 	bez      	r19, 0x8012bfe	// 8012bfe <rt_vsnprintf+0x202>
 8012bf6:	2300      	addi      	r3, 1
 8012bf8:	64f2      	cmpne      	r12, r3
 8012bfa:	0bf7      	bt      	0x8012be8	// 8012be8 <rt_vsnprintf+0x1ec>
 8012bfc:	6cf3      	mov      	r3, r12
            if (!(flags & LEFT))
 8012bfe:	e4212010 	andi      	r1, r1, 16
 8012c02:	f9a3cda2 	min.s32      	r2, r3, r13
 8012c06:	eb2d0000 	cmplti      	r13, 1
 8012c0a:	c4620c20 	incf      	r3, r2, 0
 8012c0e:	e9210012 	bnez      	r1, 0x8012c32	// 8012c32 <rt_vsnprintf+0x236>
                while (len < field_width--)
 8012c12:	670d      	cmplt      	r3, r12
 8012c14:	e44c1000 	subi      	r2, r12, 1
 8012c18:	0cef      	bf      	0x8012df6	// 8012df6 <rt_vsnprintf+0x3fa>
 8012c1a:	c46c0082 	subu      	r2, r12, r3
 8012c1e:	6080      	addu      	r2, r0
                    if (str < end) *str = ' ';
 8012c20:	6680      	cmphs      	r0, r10
 8012c22:	0803      	bt      	0x8012c28	// 8012c28 <rt_vsnprintf+0x22c>
 8012c24:	de200000 	st.b      	r17, (r0, 0x0)
                    ++ str;
 8012c28:	2000      	addi      	r0, 1
                while (len < field_width--)
 8012c2a:	640a      	cmpne      	r2, r0
 8012c2c:	0bfa      	bt      	0x8012c20	// 8012c20 <rt_vsnprintf+0x224>
 8012c2e:	e5831000 	subi      	r12, r3, 1
            for (i = 0; i < len; ++i)
 8012c32:	e96300d9 	blsz      	r3, 0x8012de4	// 8012de4 <rt_vsnprintf+0x3e8>
 8012c36:	584c      	addu      	r2, r0, r3
                if (str < end) *str = *s;
 8012c38:	6680      	cmphs      	r0, r10
 8012c3a:	0804      	bt      	0x8012c42	// 8012c42 <rt_vsnprintf+0x246>
 8012c3c:	d8320000 	ld.b      	r1, (r18, 0x0)
 8012c40:	a020      	st.b      	r1, (r0, 0x0)
                ++ str;
 8012c42:	2000      	addi      	r0, 1
            for (i = 0; i < len; ++i)
 8012c44:	6482      	cmpne      	r0, r2
                ++ s;
 8012c46:	e6520000 	addi      	r18, r18, 1
            for (i = 0; i < len; ++i)
 8012c4a:	0bf7      	bt      	0x8012c38	// 8012c38 <rt_vsnprintf+0x23c>
            while (len < field_width--)
 8012c4c:	670d      	cmplt      	r3, r12
 8012c4e:	0c0b      	bf      	0x8012c64	// 8012c64 <rt_vsnprintf+0x268>
 8012c50:	c46c0083 	subu      	r3, r12, r3
 8012c54:	60c8      	addu      	r3, r2
                if (str < end) *str = ' ';
 8012c56:	6688      	cmphs      	r2, r10
 8012c58:	0803      	bt      	0x8012c5e	// 8012c5e <rt_vsnprintf+0x262>
 8012c5a:	de220000 	st.b      	r17, (r2, 0x0)
                ++ str;
 8012c5e:	2200      	addi      	r2, 1
            while (len < field_width--)
 8012c60:	64ca      	cmpne      	r2, r3
 8012c62:	0bfa      	bt      	0x8012c56	// 8012c56 <rt_vsnprintf+0x25a>
 8012c64:	8561      	ld.b      	r3, (r5, 0x1)
            s = va_arg(args, char *);
 8012c66:	c414482b 	lsli      	r11, r20, 0
            while (len < field_width--)
 8012c6a:	6d17      	mov      	r4, r5
                ++ str;
 8012c6c:	6c0b      	mov      	r0, r2
 8012c6e:	06e8      	br      	0x8012a3e	// 8012a3e <rt_vsnprintf+0x42>
            ++ fmt;
 8012c70:	6d53      	mov      	r5, r4
            if (field_width == -1)
 8012c72:	3300      	movi      	r3, 0
 8012c74:	2b00      	subi      	r3, 1
 8012c76:	64f2      	cmpne      	r12, r3
 8012c78:	0ca3      	bf      	0x8012dbe	// 8012dbe <rt_vsnprintf+0x3c2>
            str = print_number(str, end,
 8012c7a:	b822      	st.w      	r1, (r14, 0x8)
 8012c7c:	ddae2001 	st.w      	r13, (r14, 0x4)
 8012c80:	dd8e2000 	st.w      	r12, (r14, 0x0)
                               (long)va_arg(args, void *),
 8012c84:	e48b0003 	addi      	r4, r11, 4
            str = print_number(str, end,
 8012c88:	3310      	movi      	r3, 16
 8012c8a:	d84b2000 	ld.w      	r2, (r11, 0x0)
 8012c8e:	6c6b      	mov      	r1, r10
 8012c90:	e3fffd4a 	bsr      	0x8012724	// 8012724 <print_number>
                               (long)va_arg(args, void *),
 8012c94:	6ed3      	mov      	r11, r4
 8012c96:	8561      	ld.b      	r3, (r5, 0x1)
            continue;
 8012c98:	6d17      	mov      	r4, r5
 8012c9a:	06d2      	br      	0x8012a3e	// 8012a3e <rt_vsnprintf+0x42>
            ++ fmt;
 8012c9c:	6d53      	mov      	r5, r4
            if (!(flags & LEFT))
 8012c9e:	e4212010 	andi      	r1, r1, 16
 8012ca2:	e9210010 	bnez      	r1, 0x8012cc2	// 8012cc2 <rt_vsnprintf+0x2c6>
                while (--field_width > 0)
 8012ca6:	e44c1000 	subi      	r2, r12, 1
 8012caa:	e96200a4 	blsz      	r2, 0x8012df2	// 8012df2 <rt_vsnprintf+0x3f6>
 8012cae:	5868      	addu      	r3, r0, r2
                    if (str < end) *str = ' ';
 8012cb0:	6680      	cmphs      	r0, r10
 8012cb2:	0803      	bt      	0x8012cb8	// 8012cb8 <rt_vsnprintf+0x2bc>
 8012cb4:	de200000 	st.b      	r17, (r0, 0x0)
                    ++ str;
 8012cb8:	2000      	addi      	r0, 1
                while (--field_width > 0)
 8012cba:	64c2      	cmpne      	r0, r3
 8012cbc:	0bfa      	bt      	0x8012cb0	// 8012cb0 <rt_vsnprintf+0x2b4>
 8012cbe:	ea0c0000 	movi      	r12, 0
            if (str < end) *str = c;
 8012cc2:	6680      	cmphs      	r0, r10
            c = (rt_uint8_t)va_arg(args, int);
 8012cc4:	e5ab0003 	addi      	r13, r11, 4
            if (str < end) *str = c;
 8012cc8:	0c6d      	bf      	0x8012da2	// 8012da2 <rt_vsnprintf+0x3a6>
            while (--field_width > 0)
 8012cca:	eb2c0001 	cmplti      	r12, 2
            ++ str;
 8012cce:	5822      	addi      	r1, r0, 1
            while (--field_width > 0)
 8012cd0:	088c      	bt      	0x8012de8	// 8012de8 <rt_vsnprintf+0x3ec>
 8012cd2:	c5800022 	addu      	r2, r0, r12
                if (str < end) *str = ' ';
 8012cd6:	6684      	cmphs      	r1, r10
 8012cd8:	0803      	bt      	0x8012cde	// 8012cde <rt_vsnprintf+0x2e2>
 8012cda:	de210000 	st.b      	r17, (r1, 0x0)
                ++ str;
 8012cde:	2100      	addi      	r1, 1
            while (--field_width > 0)
 8012ce0:	6486      	cmpne      	r1, r2
 8012ce2:	0bfa      	bt      	0x8012cd6	// 8012cd6 <rt_vsnprintf+0x2da>
 8012ce4:	6c07      	mov      	r0, r1
 8012ce6:	8561      	ld.b      	r3, (r5, 0x1)
            c = (rt_uint8_t)va_arg(args, int);
 8012ce8:	6ef7      	mov      	r11, r13
            while (--field_width > 0)
 8012cea:	6d17      	mov      	r4, r5
 8012cec:	06a9      	br      	0x8012a3e	// 8012a3e <rt_vsnprintf+0x42>
            ++ fmt;
 8012cee:	6d53      	mov      	r5, r4
            if (str < end) *str = '%';
 8012cf0:	6680      	cmphs      	r0, r10
 8012cf2:	0803      	bt      	0x8012cf8	// 8012cf8 <rt_vsnprintf+0x2fc>
 8012cf4:	3325      	movi      	r3, 37
 8012cf6:	a060      	st.b      	r3, (r0, 0x0)
            ++ str;
 8012cf8:	2000      	addi      	r0, 1
 8012cfa:	8561      	ld.b      	r3, (r5, 0x1)
            continue;
 8012cfc:	6d17      	mov      	r4, r5
 8012cfe:	06a0      	br      	0x8012a3e	// 8012a3e <rt_vsnprintf+0x42>
        switch (*fmt)
 8012d00:	6d17      	mov      	r4, r5
 8012d02:	3308      	movi      	r3, 8
 8012d04:	06fa      	br      	0x8012af8	// 8012af8 <rt_vsnprintf+0xfc>
        qualifier = 0;
 8012d06:	3200      	movi      	r2, 0
            flags |= SIGN;
 8012d08:	6d17      	mov      	r4, r5
 8012d0a:	3310      	movi      	r3, 16
        if (qualifier == 'l')
 8012d0c:	eb42006c 	cmpnei      	r2, 108
 8012d10:	0ef4      	bf      	0x8012af8	// 8012af8 <rt_vsnprintf+0xfc>
        else if (qualifier == 'h')
 8012d12:	eb420068 	cmpnei      	r2, 104
 8012d16:	0af1      	bt      	0x8012af8	// 8012af8 <rt_vsnprintf+0xfc>
            if (flags & SIGN) num = (rt_int16_t)num;
 8012d18:	e6612002 	andi      	r19, r1, 2
            num = (rt_uint16_t)va_arg(args, rt_int32_t);
 8012d1c:	e64b0003 	addi      	r18, r11, 4
 8012d20:	d84b2000 	ld.w      	r2, (r11, 0x0)
            if (flags & SIGN) num = (rt_int16_t)num;
 8012d24:	e913002a 	bez      	r19, 0x8012d78	// 8012d78 <rt_vsnprintf+0x37c>
 8012d28:	748b      	sexth      	r2, r2
            num = (rt_uint16_t)va_arg(args, rt_int32_t);
 8012d2a:	c412482b 	lsli      	r11, r18, 0
 8012d2e:	06e9      	br      	0x8012b00	// 8012b00 <rt_vsnprintf+0x104>
        qualifier = 0;
 8012d30:	3200      	movi      	r2, 0
            flags |= SIGN;
 8012d32:	6d17      	mov      	r4, r5
 8012d34:	330a      	movi      	r3, 10
 8012d36:	07eb      	br      	0x8012d0c	// 8012d0c <rt_vsnprintf+0x310>
        qualifier = 0;
 8012d38:	3200      	movi      	r2, 0
            flags |= SIGN;
 8012d3a:	ec210002 	ori      	r1, r1, 2
 8012d3e:	6d17      	mov      	r4, r5
 8012d40:	330a      	movi      	r3, 10
 8012d42:	07e5      	br      	0x8012d0c	// 8012d0c <rt_vsnprintf+0x310>
            ++ fmt;
 8012d44:	6d53      	mov      	r5, r4
            if (str < end) *str = '%';
 8012d46:	6680      	cmphs      	r0, r10
 8012d48:	0803      	bt      	0x8012d4e	// 8012d4e <rt_vsnprintf+0x352>
 8012d4a:	3325      	movi      	r3, 37
 8012d4c:	a060      	st.b      	r3, (r0, 0x0)
            if (*fmt)
 8012d4e:	8560      	ld.b      	r3, (r5, 0x0)
            ++ str;
 8012d50:	5842      	addi      	r2, r0, 1
            if (*fmt)
 8012d52:	e903001e 	bez      	r3, 0x8012d8e	// 8012d8e <rt_vsnprintf+0x392>
                if (str < end) *str = *fmt;
 8012d56:	6688      	cmphs      	r2, r10
 8012d58:	0802      	bt      	0x8012d5c	// 8012d5c <rt_vsnprintf+0x360>
 8012d5a:	a061      	st.b      	r3, (r0, 0x1)
                ++ str;
 8012d5c:	2001      	addi      	r0, 2
 8012d5e:	8561      	ld.b      	r3, (r5, 0x1)
 8012d60:	6d17      	mov      	r4, r5
 8012d62:	066e      	br      	0x8012a3e	// 8012a3e <rt_vsnprintf+0x42>
            field_width = va_arg(args, int);
 8012d64:	d98b2000 	ld.w      	r12, (r11, 0x0)
            ++ fmt;
 8012d68:	5ca6      	addi      	r5, r4, 2
            field_width = va_arg(args, int);
 8012d6a:	e44b0003 	addi      	r2, r11, 4
            if (field_width < 0)
 8012d6e:	e98c0023 	blz      	r12, 0x8012db4	// 8012db4 <rt_vsnprintf+0x3b8>
 8012d72:	8462      	ld.b      	r3, (r4, 0x2)
            field_width = va_arg(args, int);
 8012d74:	6ecb      	mov      	r11, r2
 8012d76:	06a4      	br      	0x8012abe	// 8012abe <rt_vsnprintf+0xc2>
            num = (rt_uint16_t)va_arg(args, rt_int32_t);
 8012d78:	c40255e2 	zext      	r2, r2, 15, 0
 8012d7c:	c412482b 	lsli      	r11, r18, 0
 8012d80:	06c0      	br      	0x8012b00	// 8012b00 <rt_vsnprintf+0x104>
        if (*fmt == 'h' || *fmt == 'l')
 8012d82:	6c8f      	mov      	r2, r3
        switch (*fmt)
 8012d84:	3308      	movi      	r3, 8
 8012d86:	07c3      	br      	0x8012d0c	// 8012d0c <rt_vsnprintf+0x310>
            ++ fmt;
 8012d88:	6d53      	mov      	r5, r4
        if (*fmt == 'h' || *fmt == 'l')
 8012d8a:	6c8f      	mov      	r2, r3
 8012d8c:	07d7      	br      	0x8012d3a	// 8012d3a <rt_vsnprintf+0x33e>
            ++ str;
 8012d8e:	6c0b      	mov      	r0, r2
 8012d90:	c5000083 	subu      	r3, r0, r8
 8012d94:	06c4      	br      	0x8012b1c	// 8012b1c <rt_vsnprintf+0x120>
            ++ fmt;
 8012d96:	6d53      	mov      	r5, r4
        if (*fmt == 'h' || *fmt == 'l')
 8012d98:	6c8f      	mov      	r2, r3
 8012d9a:	07cc      	br      	0x8012d32	// 8012d32 <rt_vsnprintf+0x336>
            ++ fmt;
 8012d9c:	6d53      	mov      	r5, r4
        if (*fmt == 'h' || *fmt == 'l')
 8012d9e:	6c8f      	mov      	r2, r3
 8012da0:	07b4      	br      	0x8012d08	// 8012d08 <rt_vsnprintf+0x30c>
            c = (rt_uint8_t)va_arg(args, int);
 8012da2:	d86b0000 	ld.b      	r3, (r11, 0x0)
 8012da6:	a060      	st.b      	r3, (r0, 0x0)
 8012da8:	0791      	br      	0x8012cca	// 8012cca <rt_vsnprintf+0x2ce>
        if (*fmt == 'h' || *fmt == 'l')
 8012daa:	6c8f      	mov      	r2, r3
            flags |= LARGE;
 8012dac:	ec210040 	ori      	r1, r1, 64
 8012db0:	3310      	movi      	r3, 16
 8012db2:	07ad      	br      	0x8012d0c	// 8012d0c <rt_vsnprintf+0x310>
                field_width = -field_width;
 8012db4:	c589008c 	subu      	r12, r9, r12
                flags |= LEFT;
 8012db8:	ec210010 	ori      	r1, r1, 16
 8012dbc:	07db      	br      	0x8012d72	// 8012d72 <rt_vsnprintf+0x376>
                flags |= ZEROPAD;
 8012dbe:	ec210001 	ori      	r1, r1, 1
                field_width = sizeof(void *) << 1;
 8012dc2:	ea0c0008 	movi      	r12, 8
 8012dc6:	075a      	br      	0x8012c7a	// 8012c7a <rt_vsnprintf+0x27e>
 8012dc8:	d9ab2000 	ld.w      	r13, (r11, 0x0)
 8012dcc:	8562      	ld.b      	r3, (r5, 0x2)
 8012dce:	f92dccad 	max.s32      	r13, r13, r9
                precision = va_arg(args, int);
 8012dd2:	e56b0003 	addi      	r11, r11, 4
                ++ fmt;
 8012dd6:	2501      	addi      	r5, 2
 8012dd8:	067a      	br      	0x8012acc	// 8012acc <rt_vsnprintf+0xd0>
            for (len = 0; (len != field_width) && (s[len] != '\0'); len++);
 8012dda:	e90c0010 	bez      	r12, 0x8012dfa	// 8012dfa <rt_vsnprintf+0x3fe>
            if (!s) s = "(NULL)";
 8012dde:	ea92000a 	lrw      	r18, 0x80159d4	// 8012e04 <rt_vsnprintf+0x408>
 8012de2:	06ff      	br      	0x8012be0	// 8012be0 <rt_vsnprintf+0x1e4>
            for (i = 0; i < len; ++i)
 8012de4:	6c83      	mov      	r2, r0
 8012de6:	0733      	br      	0x8012c4c	// 8012c4c <rt_vsnprintf+0x250>
 8012de8:	8561      	ld.b      	r3, (r5, 0x1)
            c = (rt_uint8_t)va_arg(args, int);
 8012dea:	6ef7      	mov      	r11, r13
            while (--field_width > 0)
 8012dec:	6d17      	mov      	r4, r5
            ++ str;
 8012dee:	6c07      	mov      	r0, r1
 8012df0:	0627      	br      	0x8012a3e	// 8012a3e <rt_vsnprintf+0x42>
                while (--field_width > 0)
 8012df2:	6f0b      	mov      	r12, r2
 8012df4:	0767      	br      	0x8012cc2	// 8012cc2 <rt_vsnprintf+0x2c6>
                while (len < field_width--)
 8012df6:	6f0b      	mov      	r12, r2
 8012df8:	071d      	br      	0x8012c32	// 8012c32 <rt_vsnprintf+0x236>
            for (len = 0; (len != field_width) && (s[len] != '\0'); len++);
 8012dfa:	6cf3      	mov      	r3, r12
            if (!s) s = "(NULL)";
 8012dfc:	ea920002 	lrw      	r18, 0x80159d4	// 8012e04 <rt_vsnprintf+0x408>
 8012e00:	06ff      	br      	0x8012bfe	// 8012bfe <rt_vsnprintf+0x202>
 8012e02:	0000      	.short	0x0000
 8012e04:	080159d4 	.long	0x080159d4

08012e08 <rt_kprintf>:
 * This function will print a formatted string on system console
 *
 * @param fmt the format
 */
void rt_kprintf(const char *fmt, ...)
{
 8012e08:	1424      	subi      	r14, r14, 16
 8012e0a:	b863      	st.w      	r3, (r14, 0xc)
 8012e0c:	b842      	st.w      	r2, (r14, 0x8)
 8012e0e:	b821      	st.w      	r1, (r14, 0x4)
 8012e10:	b800      	st.w      	r0, (r14, 0x0)
 8012e12:	14d1      	push      	r4, r15
    /* the return value of vsnprintf is the number of bytes that would be
     * written to buffer had if the size of the buffer been sufficiently
     * large excluding the terminating null byte. If the output string
     * would be larger than the rt_log_buf, we have to adjust the output
     * length. */
    length = rt_vsnprintf(rt_log_buf, sizeof(rt_log_buf) - 1, fmt, args);
 8012e14:	1088      	lrw      	r4, 0x200359c8	// 8012e34 <rt_kprintf+0x2c>
 8012e16:	1b03      	addi      	r3, r14, 12
 8012e18:	9842      	ld.w      	r2, (r14, 0x8)
 8012e1a:	317f      	movi      	r1, 127
 8012e1c:	6c13      	mov      	r0, r4
 8012e1e:	e3fffdef 	bsr      	0x80129fc	// 80129fc <rt_vsnprintf>
        _console_device->open_flag |= RT_DEVICE_FLAG_STREAM;
        rt_device_write(_console_device, 0, rt_log_buf, length);
        _console_device->open_flag = old_flag;
    }
#else
    rt_hw_console_output(rt_log_buf);
 8012e22:	6c13      	mov      	r0, r4
 8012e24:	e3fffb04 	bsr      	0x801242c	// 801242c <rt_hw_console_output>
#endif
    va_end(args);
}
 8012e28:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 8012e2c:	9880      	ld.w      	r4, (r14, 0x0)
 8012e2e:	1406      	addi      	r14, r14, 24
 8012e30:	783c      	jmp      	r15
 8012e32:	0000      	.short	0x0000
 8012e34:	200359c8 	.long	0x200359c8

08012e38 <rt_show_version>:
{
 8012e38:	14d0      	push      	r15
 8012e3a:	1421      	subi      	r14, r14, 4
    rt_kprintf("\n \\ | /\n");
 8012e3c:	100a      	lrw      	r0, 0x801594c	// 8012e64 <rt_show_version+0x2c>
 8012e3e:	e3ffffe5 	bsr      	0x8012e08	// 8012e08 <rt_kprintf>
    rt_kprintf("- RT -     Thread Operating System\n");
 8012e42:	100a      	lrw      	r0, 0x8015958	// 8012e68 <rt_show_version+0x30>
 8012e44:	e3ffffe2 	bsr      	0x8012e08	// 8012e08 <rt_kprintf>
    rt_kprintf(" / | \\     %d.%d.%d build %s\n",
 8012e48:	1069      	lrw      	r3, 0x801599c	// 8012e6c <rt_show_version+0x34>
 8012e4a:	3201      	movi      	r2, 1
 8012e4c:	b860      	st.w      	r3, (r14, 0x0)
 8012e4e:	3103      	movi      	r1, 3
 8012e50:	3305      	movi      	r3, 5
 8012e52:	1008      	lrw      	r0, 0x801597c	// 8012e70 <rt_show_version+0x38>
 8012e54:	e3ffffda 	bsr      	0x8012e08	// 8012e08 <rt_kprintf>
    rt_kprintf(" 2006 - 2020 Copyright by rt-thread team\n");
 8012e58:	1007      	lrw      	r0, 0x80159a8	// 8012e74 <rt_show_version+0x3c>
 8012e5a:	e3ffffd7 	bsr      	0x8012e08	// 8012e08 <rt_kprintf>
}
 8012e5e:	1401      	addi      	r14, r14, 4
 8012e60:	1490      	pop      	r15
 8012e62:	0000      	.short	0x0000
 8012e64:	0801594c 	.long	0x0801594c
 8012e68:	08015958 	.long	0x08015958
 8012e6c:	0801599c 	.long	0x0801599c
 8012e70:	0801597c 	.long	0x0801597c
 8012e74:	080159a8 	.long	0x080159a8

08012e78 <__rt_ffs>:
 * @return return the index of the first bit set. If value is 0, then this function
 * shall return 0.
 */
int __rt_ffs(int value)
{
    if (value == 0) return 0;
 8012e78:	e9000015 	bez      	r0, 0x8012ea2	// 8012ea2 <__rt_ffs+0x2a>

    if (value & 0xff)
 8012e7c:	e46020ff 	andi      	r3, r0, 255
 8012e80:	e9230012 	bnez      	r3, 0x8012ea4	// 8012ea4 <__rt_ffs+0x2c>
        return __lowest_bit_bitmap[value & 0xff] + 1;

    if (value & 0xff00)
 8012e84:	ea03ff00 	movi      	r3, 65280
 8012e88:	68c0      	and      	r3, r0
 8012e8a:	e9230019 	bnez      	r3, 0x8012ebc	// 8012ebc <__rt_ffs+0x44>
        return __lowest_bit_bitmap[(value & 0xff00) >> 8] + 9;

    if (value & 0xff0000)
 8012e8e:	ea2300ff 	movih      	r3, 255
 8012e92:	68c0      	and      	r3, r0
 8012e94:	e923000d 	bnez      	r3, 0x8012eae	// 8012eae <__rt_ffs+0x36>
        return __lowest_bit_bitmap[(value & 0xff0000) >> 16] + 17;

    return __lowest_bit_bitmap[(value & 0xff000000) >> 24] + 25;
 8012e98:	106d      	lrw      	r3, 0x8015838	// 8012ecc <__rt_ffs+0x54>
 8012e9a:	4818      	lsri      	r0, r0, 24
 8012e9c:	d0030020 	ldr.b      	r0, (r3, r0 << 0)
 8012ea0:	2018      	addi      	r0, 25
}
 8012ea2:	783c      	jmp      	r15
        return __lowest_bit_bitmap[value & 0xff] + 1;
 8012ea4:	104a      	lrw      	r2, 0x8015838	// 8012ecc <__rt_ffs+0x54>
 8012ea6:	d0620020 	ldr.b      	r0, (r2, r3 << 0)
 8012eaa:	2000      	addi      	r0, 1
}
 8012eac:	783c      	jmp      	r15
        return __lowest_bit_bitmap[(value & 0xff0000) >> 16] + 17;
 8012eae:	1068      	lrw      	r3, 0x8015838	// 8012ecc <__rt_ffs+0x54>
 8012eb0:	c60056e0 	zext      	r0, r0, 23, 16
 8012eb4:	d0030020 	ldr.b      	r0, (r3, r0 << 0)
 8012eb8:	2010      	addi      	r0, 17
 8012eba:	07f4      	br      	0x8012ea2	// 8012ea2 <__rt_ffs+0x2a>
        return __lowest_bit_bitmap[(value & 0xff00) >> 8] + 9;
 8012ebc:	1064      	lrw      	r3, 0x8015838	// 8012ecc <__rt_ffs+0x54>
 8012ebe:	c50055e0 	zext      	r0, r0, 15, 8
 8012ec2:	d0030020 	ldr.b      	r0, (r3, r0 << 0)
 8012ec6:	2008      	addi      	r0, 9
}
 8012ec8:	783c      	jmp      	r15
 8012eca:	0000      	.short	0x0000
 8012ecc:	08015838 	.long	0x08015838

08012ed0 <plug_holes>:
    RT_ASSERT((rt_uint8_t *)mem >= heap_ptr);
    RT_ASSERT((rt_uint8_t *)mem < (rt_uint8_t *)heap_end);
    RT_ASSERT(mem->used == 0);

    /* plug hole forward */
    nmem = (struct heap_mem *)&heap_ptr[mem->next];
 8012ed0:	107a      	lrw      	r3, 0x20035a4c	// 8012f38 <plug_holes+0x68>
 8012ed2:	9340      	ld.w      	r2, (r3, 0x0)
 8012ed4:	9061      	ld.w      	r3, (r0, 0x4)
 8012ed6:	60c8      	addu      	r3, r2
    if (mem != nmem &&
 8012ed8:	64c2      	cmpne      	r0, r3
 8012eda:	0c13      	bf      	0x8012f00	// 8012f00 <plug_holes+0x30>
 8012edc:	8b21      	ld.h      	r1, (r3, 0x2)
 8012ede:	e9210011 	bnez      	r1, 0x8012f00	// 8012f00 <plug_holes+0x30>
        nmem->used == 0 &&
        (rt_uint8_t *)nmem != (rt_uint8_t *)heap_end)
 8012ee2:	1037      	lrw      	r1, 0x20035a48	// 8012f3c <plug_holes+0x6c>
        nmem->used == 0 &&
 8012ee4:	9120      	ld.w      	r1, (r1, 0x0)
 8012ee6:	644e      	cmpne      	r3, r1
 8012ee8:	0c0c      	bf      	0x8012f00	// 8012f00 <plug_holes+0x30>
    {
        /* if mem->next is unused and not end of heap_ptr,
         * combine mem and mem->next
         */
        if (lfree == nmem)
 8012eea:	1036      	lrw      	r1, 0x20035a70	// 8012f40 <plug_holes+0x70>
 8012eec:	d9812000 	ld.w      	r12, (r1, 0x0)
 8012ef0:	670e      	cmpne      	r3, r12
 8012ef2:	0c20      	bf      	0x8012f32	// 8012f32 <plug_holes+0x62>
        {
            lfree = mem;
        }
        mem->next = nmem->next;
 8012ef4:	9321      	ld.w      	r1, (r3, 0x4)
 8012ef6:	b021      	st.w      	r1, (r0, 0x4)
        ((struct heap_mem *)&heap_ptr[nmem->next])->prev = (rt_uint8_t *)mem - heap_ptr;
 8012ef8:	9361      	ld.w      	r3, (r3, 0x4)
 8012efa:	60c8      	addu      	r3, r2
 8012efc:	5829      	subu      	r1, r0, r2
 8012efe:	b322      	st.w      	r1, (r3, 0x8)
    }

    /* plug hole backward */
    pmem = (struct heap_mem *)&heap_ptr[mem->prev];
 8012f00:	9022      	ld.w      	r1, (r0, 0x8)
 8012f02:	5a64      	addu      	r3, r2, r1
    if (pmem != mem && pmem->used == 0)
 8012f04:	64c2      	cmpne      	r0, r3
 8012f06:	0c12      	bf      	0x8012f2a	// 8012f2a <plug_holes+0x5a>
 8012f08:	d9831001 	ld.h      	r12, (r3, 0x2)
 8012f0c:	e92c000f 	bnez      	r12, 0x8012f2a	// 8012f2a <plug_holes+0x5a>
    {
        /* if mem->prev is unused, combine mem and mem->prev */
        if (lfree == mem)
 8012f10:	ea8c000c 	lrw      	r12, 0x20035a70	// 8012f40 <plug_holes+0x70>
 8012f14:	d9ac2000 	ld.w      	r13, (r12, 0x0)
 8012f18:	6742      	cmpne      	r0, r13
 8012f1a:	0c09      	bf      	0x8012f2c	// 8012f2c <plug_holes+0x5c>
        {
            lfree = pmem;
        }
        pmem->next = mem->next;
 8012f1c:	d9802001 	ld.w      	r12, (r0, 0x4)
 8012f20:	dd832001 	st.w      	r12, (r3, 0x4)
        ((struct heap_mem *)&heap_ptr[mem->next])->prev = (rt_uint8_t *)pmem - heap_ptr;
 8012f24:	9061      	ld.w      	r3, (r0, 0x4)
 8012f26:	608c      	addu      	r2, r3
 8012f28:	b222      	st.w      	r1, (r2, 0x8)
    }
}
 8012f2a:	783c      	jmp      	r15
            lfree = pmem;
 8012f2c:	dc6c2000 	st.w      	r3, (r12, 0x0)
 8012f30:	07f6      	br      	0x8012f1c	// 8012f1c <plug_holes+0x4c>
            lfree = mem;
 8012f32:	b100      	st.w      	r0, (r1, 0x0)
 8012f34:	07e0      	br      	0x8012ef4	// 8012ef4 <plug_holes+0x24>
 8012f36:	0000      	.short	0x0000
 8012f38:	20035a4c 	.long	0x20035a4c
 8012f3c:	20035a48 	.long	0x20035a48
 8012f40:	20035a70 	.long	0x20035a70

08012f44 <rt_system_heap_init>:
 *
 * @param begin_addr the beginning address of system heap memory.
 * @param end_addr the end address of system heap memory.
 */
void rt_system_heap_init(void *begin_addr, void *end_addr)
{
 8012f44:	14d1      	push      	r4, r15
    struct heap_mem *mem;
    rt_ubase_t begin_align = RT_ALIGN((rt_ubase_t)begin_addr, RT_ALIGN_SIZE);
    rt_ubase_t end_align   = RT_ALIGN_DOWN((rt_ubase_t)end_addr, RT_ALIGN_SIZE);
 8012f46:	c4012823 	bclri      	r3, r1, 0
 8012f4a:	3b81      	bclri      	r3, 1

    RT_DEBUG_NOT_IN_INTERRUPT;

    /* alignment addr */
    if ((end_align > (2 * SIZEOF_STRUCT_MEM)) &&
 8012f4c:	3218      	movi      	r2, 24
 8012f4e:	64c8      	cmphs      	r2, r3
 8012f50:	080b      	bt      	0x8012f66	// 8012f66 <rt_system_heap_init+0x22>
    rt_ubase_t begin_align = RT_ALIGN((rt_ubase_t)begin_addr, RT_ALIGN_SIZE);
 8012f52:	e5800002 	addi      	r12, r0, 3
 8012f56:	c40c282c 	bclri      	r12, r12, 0
 8012f5a:	c42c282c 	bclri      	r12, r12, 1
        ((end_align - 2 * SIZEOF_STRUCT_MEM) >= begin_align))
 8012f5e:	e4431017 	subi      	r2, r3, 24
    if ((end_align > (2 * SIZEOF_STRUCT_MEM)) &&
 8012f62:	6708      	cmphs      	r2, r12
 8012f64:	0807      	bt      	0x8012f72	// 8012f72 <rt_system_heap_init+0x2e>
        /* calculate the aligned memory size */
        mem_size_aligned = end_align - begin_align - 2 * SIZEOF_STRUCT_MEM;
    }
    else
    {
        rt_kprintf("mem init, error begin address 0x%x, and end address 0x%x\n",
 8012f66:	6c87      	mov      	r2, r1
 8012f68:	6c43      	mov      	r1, r0
 8012f6a:	1019      	lrw      	r0, 0x8015a44	// 8012fcc <rt_system_heap_init+0x88>
 8012f6c:	e3ffff4e 	bsr      	0x8012e08	// 8012e08 <rt_kprintf>

    rt_sem_init(&heap_sem, "heap", 1, RT_IPC_FLAG_FIFO);

    /* initialize the lowest-free pointer to the start of the heap */
    lfree = (struct heap_mem *)heap_ptr;
}
 8012f70:	1491      	pop      	r4, r15
        mem_size_aligned = end_align - begin_align - 2 * SIZEOF_STRUCT_MEM;
 8012f72:	60f2      	subu      	r3, r12
 8012f74:	1057      	lrw      	r2, 0x20035a78	// 8012fd0 <rt_system_heap_init+0x8c>
 8012f76:	e4231017 	subi      	r1, r3, 24
 8012f7a:	b220      	st.w      	r1, (r2, 0x0)
    mem->magic = HEAP_MAGIC;
 8012f7c:	32f5      	movi      	r2, 245
    heap_ptr = (rt_uint8_t *)begin_align;
 8012f7e:	1096      	lrw      	r4, 0x20035a4c	// 8012fd4 <rt_system_heap_init+0x90>
    mem->magic = HEAP_MAGIC;
 8012f80:	4245      	lsli      	r2, r2, 5
 8012f82:	dc4c1000 	st.h      	r2, (r12, 0x0)
 8012f86:	6c4b      	mov      	r1, r2
    mem->next  = mem_size_aligned + SIZEOF_STRUCT_MEM;
 8012f88:	e443100b 	subi      	r2, r3, 12
    mem->prev  = 0;
 8012f8c:	3300      	movi      	r3, 0
    mem->next  = mem_size_aligned + SIZEOF_STRUCT_MEM;
 8012f8e:	dc4c2001 	st.w      	r2, (r12, 0x4)
    mem->prev  = 0;
 8012f92:	dc6c2002 	st.w      	r3, (r12, 0x8)
    mem->used  = 0;
 8012f96:	dc6c1001 	st.h      	r3, (r12, 0x2)
    heap_ptr = (rt_uint8_t *)begin_align;
 8012f9a:	dd842000 	st.w      	r12, (r4, 0x0)
    heap_end        = (struct heap_mem *)&heap_ptr[mem->next];
 8012f9e:	6308      	addu      	r12, r2
 8012fa0:	100e      	lrw      	r0, 0x20035a48	// 8012fd8 <rt_system_heap_init+0x94>
    heap_end->prev  = mem_size_aligned + SIZEOF_STRUCT_MEM;
 8012fa2:	dc4c2002 	st.w      	r2, (r12, 0x8)
    heap_end->magic = HEAP_MAGIC;
 8012fa6:	dc2c1000 	st.h      	r1, (r12, 0x0)
    heap_end->used  = 1;
 8012faa:	3101      	movi      	r1, 1
    heap_end        = (struct heap_mem *)&heap_ptr[mem->next];
 8012fac:	dd802000 	st.w      	r12, (r0, 0x0)
    heap_end->used  = 1;
 8012fb0:	dc2c1001 	st.h      	r1, (r12, 0x2)
    heap_end->next  = mem_size_aligned + SIZEOF_STRUCT_MEM;
 8012fb4:	dc4c2001 	st.w      	r2, (r12, 0x4)
    rt_sem_init(&heap_sem, "heap", 1, RT_IPC_FLAG_FIFO);
 8012fb8:	3201      	movi      	r2, 1
 8012fba:	1029      	lrw      	r1, 0x8015a3c	// 8012fdc <rt_system_heap_init+0x98>
 8012fbc:	1009      	lrw      	r0, 0x20035a50	// 8012fe0 <rt_system_heap_init+0x9c>
 8012fbe:	e3fffafd 	bsr      	0x80125b8	// 80125b8 <rt_sem_init>
    lfree = (struct heap_mem *)heap_ptr;
 8012fc2:	1069      	lrw      	r3, 0x20035a70	// 8012fe4 <rt_system_heap_init+0xa0>
 8012fc4:	9440      	ld.w      	r2, (r4, 0x0)
 8012fc6:	b340      	st.w      	r2, (r3, 0x0)
}
 8012fc8:	1491      	pop      	r4, r15
 8012fca:	0000      	.short	0x0000
 8012fcc:	08015a44 	.long	0x08015a44
 8012fd0:	20035a78 	.long	0x20035a78
 8012fd4:	20035a4c 	.long	0x20035a4c
 8012fd8:	20035a48 	.long	0x20035a48
 8012fdc:	08015a3c 	.long	0x08015a3c
 8012fe0:	20035a50 	.long	0x20035a50
 8012fe4:	20035a70 	.long	0x20035a70

08012fe8 <rt_malloc>:
 * @param size is the minimum size of the requested block in bytes.
 *
 * @return pointer to allocated memory or NULL if no free memory was found.
 */
void *rt_malloc(rt_size_t size)
{
 8012fe8:	14d2      	push      	r4-r5, r15
    rt_size_t ptr, ptr2;
    struct heap_mem *mem, *mem2;

    if (size == 0)
 8012fea:	e9000038 	bez      	r0, 0x801305a	// 801305a <rt_malloc+0x72>
        RT_DEBUG_LOG(RT_DEBUG_MEM, ("malloc size %d\n", size));

    /* alignment size */
    size = RT_ALIGN(size, RT_ALIGN_SIZE);

    if (size > mem_size_aligned)
 8012fee:	128d      	lrw      	r4, 0x20035a78	// 8013120 <rt_malloc+0x138>
    if (size != RT_ALIGN(size, RT_ALIGN_SIZE))
 8012ff0:	2002      	addi      	r0, 3
 8012ff2:	3880      	bclri      	r0, 0
 8012ff4:	3881      	bclri      	r0, 1
    if (size > mem_size_aligned)
 8012ff6:	9460      	ld.w      	r3, (r4, 0x0)
 8012ff8:	640c      	cmphs      	r3, r0
 8012ffa:	0c79      	bf      	0x80130ec	// 80130ec <rt_malloc+0x104>
 8012ffc:	350c      	movi      	r5, 12
    /* every data block must be at least MIN_SIZE_ALIGNED long */
    if (size < MIN_SIZE_ALIGNED)
        size = MIN_SIZE_ALIGNED;

    /* take memory semaphore */
    rt_sem_take(&heap_sem, RT_WAITING_FOREVER);
 8012ffe:	3100      	movi      	r1, 0
 8013000:	f8a0cc25 	max.u32      	r5, r0, r5
 8013004:	2900      	subi      	r1, 1
 8013006:	1208      	lrw      	r0, 0x20035a50	// 8013124 <rt_malloc+0x13c>
 8013008:	e3fffae8 	bsr      	0x80125d8	// 80125d8 <rt_sem_take>

    for (ptr = (rt_uint8_t *)lfree - heap_ptr;
 801300c:	ea950047 	lrw      	r21, 0x20035a70	// 8013128 <rt_malloc+0x140>
 8013010:	ea960047 	lrw      	r22, 0x20035a4c	// 801312c <rt_malloc+0x144>
 8013014:	da952000 	ld.w      	r20, (r21, 0x0)
 8013018:	d8162000 	ld.w      	r0, (r22, 0x0)
         ptr < mem_size_aligned - size;
 801301c:	da642000 	ld.w      	r19, (r4, 0x0)
    for (ptr = (rt_uint8_t *)lfree - heap_ptr;
 8013020:	c4140083 	subu      	r3, r20, r0
         ptr < mem_size_aligned - size;
 8013024:	c4b3008c 	subu      	r12, r19, r5
    for (ptr = (rt_uint8_t *)lfree - heap_ptr;
 8013028:	670c      	cmphs      	r3, r12
 801302a:	0c0d      	bf      	0x8013044	// 8013044 <rt_malloc+0x5c>
 801302c:	0413      	br      	0x8013052	// 8013052 <rt_malloc+0x6a>
         ptr = ((struct heap_mem *)&heap_ptr[ptr])->next)
    {
        mem = (struct heap_mem *)&heap_ptr[ptr];

        if ((!mem->used) && (mem->next - (ptr + SIZEOF_STRUCT_MEM)) >= size)
 801302e:	9421      	ld.w      	r1, (r4, 0x4)
 8013030:	c461008d 	subu      	r13, r1, r3
 8013034:	e64d100b 	subi      	r18, r13, 12
 8013038:	c4b20420 	cmphs      	r18, r5
 801303c:	0810      	bt      	0x801305c	// 801305c <rt_malloc+0x74>
 801303e:	6cc7      	mov      	r3, r1
    for (ptr = (rt_uint8_t *)lfree - heap_ptr;
 8013040:	670c      	cmphs      	r3, r12
 8013042:	0808      	bt      	0x8013052	// 8013052 <rt_malloc+0x6a>
        mem = (struct heap_mem *)&heap_ptr[ptr];
 8013044:	588c      	addu      	r4, r0, r3
        if ((!mem->used) && (mem->next - (ptr + SIZEOF_STRUCT_MEM)) >= size)
 8013046:	8c41      	ld.h      	r2, (r4, 0x2)
 8013048:	e902fff3 	bez      	r2, 0x801302e	// 801302e <rt_malloc+0x46>
 801304c:	9461      	ld.w      	r3, (r4, 0x4)
    for (ptr = (rt_uint8_t *)lfree - heap_ptr;
 801304e:	670c      	cmphs      	r3, r12
 8013050:	0ffa      	bf      	0x8013044	// 8013044 <rt_malloc+0x5c>
            /* return the memory data except mem struct */
            return (rt_uint8_t *)mem + SIZEOF_STRUCT_MEM;
        }
    }

    rt_sem_release(&heap_sem);
 8013052:	1115      	lrw      	r0, 0x20035a50	// 8013124 <rt_malloc+0x13c>
 8013054:	e3fffb28 	bsr      	0x80126a4	// 80126a4 <rt_sem_release>

    return RT_NULL;
 8013058:	3000      	movi      	r0, 0
}
 801305a:	1492      	pop      	r4-r5, r15
                (size + SIZEOF_STRUCT_MEM + MIN_SIZE_ALIGNED))
 801305c:	e5850017 	addi      	r12, r5, 24
            if (mem->next - (ptr + SIZEOF_STRUCT_MEM) >=
 8013060:	c5920420 	cmphs      	r18, r12
 8013064:	0c2b      	bf      	0x80130ba	// 80130ba <rt_malloc+0xd2>
                ptr2 = ptr + SIZEOF_STRUCT_MEM + size;
 8013066:	e5a5000b 	addi      	r13, r5, 12
 801306a:	634c      	addu      	r13, r3
                mem2       = (struct heap_mem *)&heap_ptr[ptr2];
 801306c:	c5a0002c 	addu      	r12, r0, r13
                mem2->magic = HEAP_MAGIC;
 8013070:	ea1200f5 	movi      	r18, 245
 8013074:	c4b24832 	lsli      	r18, r18, 5
                mem2->next = mem->next;
 8013078:	dc2c2001 	st.w      	r1, (r12, 0x4)
                mem2->prev = ptr;
 801307c:	dc6c2002 	st.w      	r3, (r12, 0x8)
                mem2->magic = HEAP_MAGIC;
 8013080:	de4c1000 	st.h      	r18, (r12, 0x0)
                mem2->used = 0;
 8013084:	dc4c1001 	st.h      	r2, (r12, 0x2)
                mem->used = 1;
 8013088:	3301      	movi      	r3, 1
                mem->next = ptr2;
 801308a:	dda42001 	st.w      	r13, (r4, 0x4)
                mem->used = 1;
 801308e:	ac61      	st.h      	r3, (r4, 0x2)
                if (mem2->next != mem_size_aligned + SIZEOF_STRUCT_MEM)
 8013090:	e673000b 	addi      	r19, r19, 12
 8013094:	d86c2001 	ld.w      	r3, (r12, 0x4)
 8013098:	c6630480 	cmpne      	r3, r19
 801309c:	0c04      	bf      	0x80130a4	// 80130a4 <rt_malloc+0xbc>
                    ((struct heap_mem *)&heap_ptr[mem2->next])->prev = ptr2;
 801309e:	600c      	addu      	r0, r3
 80130a0:	dda02002 	st.w      	r13, (r0, 0x8)
                used_mem += (size + SIZEOF_STRUCT_MEM);
 80130a4:	1163      	lrw      	r3, 0x20035a7c	// 8013130 <rt_malloc+0x148>
 80130a6:	9300      	ld.w      	r0, (r3, 0x0)
 80130a8:	200b      	addi      	r0, 12
 80130aa:	6014      	addu      	r0, r5
 80130ac:	b300      	st.w      	r0, (r3, 0x0)
                if (max_mem < used_mem)
 80130ae:	1162      	lrw      	r3, 0x20035a74	// 8013134 <rt_malloc+0x14c>
 80130b0:	9340      	ld.w      	r2, (r3, 0x0)
 80130b2:	6408      	cmphs      	r2, r0
 80130b4:	0810      	bt      	0x80130d4	// 80130d4 <rt_malloc+0xec>
                    max_mem = used_mem;
 80130b6:	b300      	st.w      	r0, (r3, 0x0)
 80130b8:	040e      	br      	0x80130d4	// 80130d4 <rt_malloc+0xec>
                mem->used = 1;
 80130ba:	3301      	movi      	r3, 1
 80130bc:	ac61      	st.h      	r3, (r4, 0x2)
                used_mem += mem->next - ((rt_uint8_t *)mem - heap_ptr);
 80130be:	107d      	lrw      	r3, 0x20035a7c	// 8013130 <rt_malloc+0x148>
 80130c0:	9340      	ld.w      	r2, (r3, 0x0)
 80130c2:	6348      	addu      	r13, r2
 80130c4:	dda32000 	st.w      	r13, (r3, 0x0)
                if (max_mem < used_mem)
 80130c8:	107b      	lrw      	r3, 0x20035a74	// 8013134 <rt_malloc+0x14c>
 80130ca:	9340      	ld.w      	r2, (r3, 0x0)
 80130cc:	6748      	cmphs      	r2, r13
 80130ce:	0803      	bt      	0x80130d4	// 80130d4 <rt_malloc+0xec>
                    max_mem = used_mem;
 80130d0:	dda32000 	st.w      	r13, (r3, 0x0)
            mem->magic = HEAP_MAGIC;
 80130d4:	33f5      	movi      	r3, 245
            if (mem == lfree)
 80130d6:	c4940480 	cmpne      	r20, r4
            mem->magic = HEAP_MAGIC;
 80130da:	4365      	lsli      	r3, r3, 5
 80130dc:	ac60      	st.h      	r3, (r4, 0x0)
            if (mem == lfree)
 80130de:	0c09      	bf      	0x80130f0	// 80130f0 <rt_malloc+0x108>
            rt_sem_release(&heap_sem);
 80130e0:	1011      	lrw      	r0, 0x20035a50	// 8013124 <rt_malloc+0x13c>
 80130e2:	e3fffae1 	bsr      	0x80126a4	// 80126a4 <rt_sem_release>
            return (rt_uint8_t *)mem + SIZEOF_STRUCT_MEM;
 80130e6:	e404000b 	addi      	r0, r4, 12
}
 80130ea:	1492      	pop      	r4-r5, r15
        return RT_NULL;
 80130ec:	3000      	movi      	r0, 0
}
 80130ee:	1492      	pop      	r4-r5, r15
                while (lfree->used && lfree != heap_end)
 80130f0:	8c61      	ld.h      	r3, (r4, 0x2)
 80130f2:	e903fff7 	bez      	r3, 0x80130e0	// 80130e0 <rt_malloc+0xf8>
 80130f6:	1071      	lrw      	r3, 0x20035a48	// 8013138 <rt_malloc+0x150>
 80130f8:	9320      	ld.w      	r1, (r3, 0x0)
 80130fa:	6452      	cmpne      	r4, r1
 80130fc:	0ff2      	bf      	0x80130e0	// 80130e0 <rt_malloc+0xf8>
 80130fe:	d8162000 	ld.w      	r0, (r22, 0x0)
 8013102:	6cd3      	mov      	r3, r4
 8013104:	0403      	br      	0x801310a	// 801310a <rt_malloc+0x122>
 8013106:	644e      	cmpne      	r3, r1
 8013108:	0c09      	bf      	0x801311a	// 801311a <rt_malloc+0x132>
                    lfree = (struct heap_mem *)&heap_ptr[lfree->next];
 801310a:	9361      	ld.w      	r3, (r3, 0x4)
 801310c:	60c0      	addu      	r3, r0
                while (lfree->used && lfree != heap_end)
 801310e:	8b41      	ld.h      	r2, (r3, 0x2)
 8013110:	e922fffb 	bnez      	r2, 0x8013106	// 8013106 <rt_malloc+0x11e>
 8013114:	dc752000 	st.w      	r3, (r21, 0x0)
 8013118:	07e4      	br      	0x80130e0	// 80130e0 <rt_malloc+0xf8>
 801311a:	dc352000 	st.w      	r1, (r21, 0x0)
 801311e:	07e1      	br      	0x80130e0	// 80130e0 <rt_malloc+0xf8>
 8013120:	20035a78 	.long	0x20035a78
 8013124:	20035a50 	.long	0x20035a50
 8013128:	20035a70 	.long	0x20035a70
 801312c:	20035a4c 	.long	0x20035a4c
 8013130:	20035a7c 	.long	0x20035a7c
 8013134:	20035a74 	.long	0x20035a74
 8013138:	20035a48 	.long	0x20035a48

0801313c <rt_free>:
 * rt_malloc. The released memory block is taken back to system heap.
 *
 * @param rmem the address of memory which will be released
 */
void rt_free(void *rmem)
{
 801313c:	14d2      	push      	r4-r5, r15
    struct heap_mem *mem;

    if (rmem == RT_NULL)
 801313e:	e900000a 	bez      	r0, 0x8013152	// 8013152 <rt_free+0x16>
    RT_ASSERT((rt_uint8_t *)rmem >= (rt_uint8_t *)heap_ptr &&
              (rt_uint8_t *)rmem < (rt_uint8_t *)heap_end);

    RT_OBJECT_HOOK_CALL(rt_free_hook, (rmem));

    if ((rt_uint8_t *)rmem < (rt_uint8_t *)heap_ptr ||
 8013142:	10bd      	lrw      	r5, 0x20035a4c	// 80131b4 <rt_free+0x78>
 8013144:	9560      	ld.w      	r3, (r5, 0x0)
 8013146:	64c0      	cmphs      	r0, r3
 8013148:	0c05      	bf      	0x8013152	// 8013152 <rt_free+0x16>
        (rt_uint8_t *)rmem >= (rt_uint8_t *)heap_end)
 801314a:	107c      	lrw      	r3, 0x20035a48	// 80131b8 <rt_free+0x7c>
    if ((rt_uint8_t *)rmem < (rt_uint8_t *)heap_ptr ||
 801314c:	9360      	ld.w      	r3, (r3, 0x0)
 801314e:	64c0      	cmphs      	r0, r3
 8013150:	0c02      	bf      	0x8013154	// 8013154 <rt_free+0x18>
#endif

    /* finally, see if prev or next are free also */
    plug_holes(mem);
    rt_sem_release(&heap_sem);
}
 8013152:	1492      	pop      	r4-r5, r15
    mem = (struct heap_mem *)((rt_uint8_t *)rmem - SIZEOF_STRUCT_MEM);
 8013154:	e480100b 	subi      	r4, r0, 12
    rt_sem_take(&heap_sem, RT_WAITING_FOREVER);
 8013158:	3100      	movi      	r1, 0
 801315a:	2900      	subi      	r1, 1
 801315c:	1018      	lrw      	r0, 0x20035a50	// 80131bc <rt_free+0x80>
 801315e:	e3fffa3d 	bsr      	0x80125d8	// 80125d8 <rt_sem_take>
    if (!mem->used || mem->magic != HEAP_MAGIC)
 8013162:	8c61      	ld.h      	r3, (r4, 0x2)
 8013164:	e9030006 	bez      	r3, 0x8013170	// 8013170 <rt_free+0x34>
 8013168:	8c60      	ld.h      	r3, (r4, 0x0)
 801316a:	eb431ea0 	cmpnei      	r3, 7840
 801316e:	0c0a      	bf      	0x8013182	// 8013182 <rt_free+0x46>
        rt_kprintf("to free a bad data block:\n");
 8013170:	1014      	lrw      	r0, 0x80159f0	// 80131c0 <rt_free+0x84>
 8013172:	e3fffe4b 	bsr      	0x8012e08	// 8012e08 <rt_kprintf>
        rt_kprintf("mem: 0x%08x, used flag: %d, magic code: 0x%04x\n", mem, mem->used, mem->magic);
 8013176:	8c60      	ld.h      	r3, (r4, 0x0)
 8013178:	8c41      	ld.h      	r2, (r4, 0x2)
 801317a:	6c53      	mov      	r1, r4
 801317c:	1012      	lrw      	r0, 0x8015a0c	// 80131c4 <rt_free+0x88>
 801317e:	e3fffe45 	bsr      	0x8012e08	// 8012e08 <rt_kprintf>
    mem->used  = 0;
 8013182:	3300      	movi      	r3, 0
 8013184:	ac61      	st.h      	r3, (r4, 0x2)
    mem->magic = HEAP_MAGIC;
 8013186:	33f5      	movi      	r3, 245
 8013188:	4365      	lsli      	r3, r3, 5
 801318a:	ac60      	st.h      	r3, (r4, 0x0)
    if (mem < lfree)
 801318c:	106f      	lrw      	r3, 0x20035a70	// 80131c8 <rt_free+0x8c>
 801318e:	9340      	ld.w      	r2, (r3, 0x0)
 8013190:	6490      	cmphs      	r4, r2
 8013192:	0802      	bt      	0x8013196	// 8013196 <rt_free+0x5a>
        lfree = mem;
 8013194:	b380      	st.w      	r4, (r3, 0x0)
    used_mem -= (mem->next - ((rt_uint8_t *)mem - heap_ptr));
 8013196:	102e      	lrw      	r1, 0x20035a7c	// 80131cc <rt_free+0x90>
    plug_holes(mem);
 8013198:	6c13      	mov      	r0, r4
    used_mem -= (mem->next - ((rt_uint8_t *)mem - heap_ptr));
 801319a:	9160      	ld.w      	r3, (r1, 0x0)
 801319c:	9441      	ld.w      	r2, (r4, 0x4)
 801319e:	60ca      	subu      	r3, r2
 80131a0:	9540      	ld.w      	r2, (r5, 0x0)
 80131a2:	5c49      	subu      	r2, r4, r2
 80131a4:	60c8      	addu      	r3, r2
 80131a6:	b160      	st.w      	r3, (r1, 0x0)
    plug_holes(mem);
 80131a8:	e3fffe94 	bsr      	0x8012ed0	// 8012ed0 <plug_holes>
    rt_sem_release(&heap_sem);
 80131ac:	1004      	lrw      	r0, 0x20035a50	// 80131bc <rt_free+0x80>
 80131ae:	e3fffa7b 	bsr      	0x80126a4	// 80126a4 <rt_sem_release>
}
 80131b2:	1492      	pop      	r4-r5, r15
 80131b4:	20035a4c 	.long	0x20035a4c
 80131b8:	20035a48 	.long	0x20035a48
 80131bc:	20035a50 	.long	0x20035a50
 80131c0:	080159f0 	.long	0x080159f0
 80131c4:	08015a0c 	.long	0x08015a0c
 80131c8:	20035a70 	.long	0x20035a70
 80131cc:	20035a7c 	.long	0x20035a7c

080131d0 <rt_object_init>:
 * @param name the object name. In system, the object's name must be unique.
 */
void rt_object_init(struct rt_object         *object,
                    enum rt_object_class_type type,
                    const char               *name)
{
 80131d0:	14d5      	push      	r4-r8, r15
 80131d2:	10db      	lrw      	r6, 0x200002c8	// 801323c <rt_object_init+0x6c>
 80131d4:	6e03      	mov      	r8, r0
 80131d6:	6dcb      	mov      	r7, r2
 80131d8:	6d47      	mov      	r5, r1
 80131da:	6cdb      	mov      	r3, r6
    for (index = 0; index < RT_Object_Info_Unknown; index ++)
 80131dc:	3000      	movi      	r0, 0
 80131de:	3204      	movi      	r2, 4
        if (rt_object_container[index].type == type) return &rt_object_container[index];
 80131e0:	9320      	ld.w      	r1, (r3, 0x0)
 80131e2:	6456      	cmpne      	r5, r1
 80131e4:	0c29      	bf      	0x8013236	// 8013236 <rt_object_init+0x66>
    for (index = 0; index < RT_Object_Info_Unknown; index ++)
 80131e6:	2000      	addi      	r0, 1
 80131e8:	230f      	addi      	r3, 16
 80131ea:	e822fffb 	bnezad      	r2, 0x80131e0	// 80131e0 <rt_object_init+0x10>
    return RT_NULL;
 80131ee:	3600      	movi      	r6, 0
    RT_ASSERT(information != RT_NULL);

    /* check object type to avoid re-initialization */

    /* enter critical */
    rt_enter_critical();
 80131f0:	e0000150 	bsr      	0x8013490	// 8013490 <rt_enter_critical>
    /* try to find object */
    for (node  = information->object_list.next;
 80131f4:	9681      	ld.w      	r4, (r6, 0x4)
            node != &(information->object_list);
 80131f6:	5e6e      	addi      	r3, r6, 4
    for (node  = information->object_list.next;
 80131f8:	650e      	cmpne      	r3, r4
 80131fa:	0c04      	bf      	0x8013202	// 8013202 <rt_object_init+0x32>
            node  = node->next)
 80131fc:	9480      	ld.w      	r4, (r4, 0x0)
    for (node  = information->object_list.next;
 80131fe:	650e      	cmpne      	r3, r4
 8013200:	0bfe      	bt      	0x80131fc	// 80131fc <rt_object_init+0x2c>
        {
            RT_ASSERT(obj != object);
        }
    }
    /* leave critical */
    rt_exit_critical();
 8013202:	e0000153 	bsr      	0x80134a8	// 80134a8 <rt_exit_critical>

    /* initialize object's parameters */
    /* set object type to static */
    object->type = type | RT_Object_Class_Static;
 8013206:	3300      	movi      	r3, 0
 8013208:	2b7f      	subi      	r3, 128
 801320a:	6d4c      	or      	r5, r3
    /* copy name */
    rt_strncpy(object->name, name, RT_NAME_MAX);
 801320c:	6c5f      	mov      	r1, r7
 801320e:	3208      	movi      	r2, 8
    object->type = type | RT_Object_Class_Static;
 8013210:	dca80008 	st.b      	r5, (r8, 0x8)
    rt_strncpy(object->name, name, RT_NAME_MAX);
 8013214:	6c23      	mov      	r0, r8
 8013216:	e3fffbd9 	bsr      	0x80129c8	// 80129c8 <rt_strncpy>

    RT_OBJECT_HOOK_CALL(rt_object_attach_hook, (object));

    /* lock interrupt */
    temp = rt_hw_interrupt_disable();
 801321a:	e3ffe9e3 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    l->next->prev = n;
 801321e:	9641      	ld.w      	r2, (r6, 0x4)

    /* insert object into information object list */
    rt_list_insert_after(&(information->object_list), &(object->list));
 8013220:	e468000b 	addi      	r3, r8, 12
 8013224:	b261      	st.w      	r3, (r2, 0x4)
    n->next = l->next;
 8013226:	dc482003 	st.w      	r2, (r8, 0xc)
    l->next = n;
 801322a:	b661      	st.w      	r3, (r6, 0x4)
    n->prev = l;
 801322c:	dc882004 	st.w      	r4, (r8, 0x10)

    /* unlock interrupt */
    rt_hw_interrupt_enable(temp);
 8013230:	e3ffe9dd 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 8013234:	1495      	pop      	r4-r8, r15
        if (rt_object_container[index].type == type) return &rt_object_container[index];
 8013236:	4004      	lsli      	r0, r0, 4
 8013238:	6180      	addu      	r6, r0
 801323a:	07db      	br      	0x80131f0	// 80131f0 <rt_object_init+0x20>
 801323c:	200002c8 	.long	0x200002c8

08013240 <rt_object_detach>:
 * and the memory of static object is not freed.
 *
 * @param object the specified object to be detached.
 */
void rt_object_detach(rt_object_t object)
{
 8013240:	14d1      	push      	r4, r15
 8013242:	6d03      	mov      	r4, r0
    RT_ASSERT(object != RT_NULL);

    RT_OBJECT_HOOK_CALL(rt_object_detach_hook, (object));

    /* reset object type */
    object->type = 0;
 8013244:	3300      	movi      	r3, 0
 8013246:	a068      	st.b      	r3, (r0, 0x8)

    /* lock interrupt */
    temp = rt_hw_interrupt_disable();
 8013248:	e3ffe9cc 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    n->next->prev = n->prev;
 801324c:	9443      	ld.w      	r2, (r4, 0xc)
 801324e:	9424      	ld.w      	r1, (r4, 0x10)
 8013250:	b221      	st.w      	r1, (r2, 0x4)
    n->prev->next = n->next;
 8013252:	9424      	ld.w      	r1, (r4, 0x10)

    /* remove from old list */
    rt_list_remove(&(object->list));
 8013254:	e464000b 	addi      	r3, r4, 12
 8013258:	b140      	st.w      	r2, (r1, 0x0)
    n->next = n->prev = n;
 801325a:	b464      	st.w      	r3, (r4, 0x10)
 801325c:	b463      	st.w      	r3, (r4, 0xc)

    /* unlock interrupt */
    rt_hw_interrupt_enable(temp);
 801325e:	e3ffe9c6 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 8013262:	1491      	pop      	r4, r15

08013264 <rt_object_allocate>:
 * @param name the object name. In system, the object's name must be unique.
 *
 * @return object
 */
rt_object_t rt_object_allocate(enum rt_object_class_type type, const char *name)
{
 8013264:	14d4      	push      	r4-r7, r15
 8013266:	1099      	lrw      	r4, 0x200002c8	// 80132c8 <rt_object_allocate+0x64>
 8013268:	6dc7      	mov      	r7, r1
 801326a:	6d83      	mov      	r6, r0
 801326c:	6cd3      	mov      	r3, r4
    for (index = 0; index < RT_Object_Info_Unknown; index ++)
 801326e:	3100      	movi      	r1, 0
 8013270:	3204      	movi      	r2, 4
        if (rt_object_container[index].type == type) return &rt_object_container[index];
 8013272:	9300      	ld.w      	r0, (r3, 0x0)
 8013274:	641a      	cmpne      	r6, r0
 8013276:	0c26      	bf      	0x80132c2	// 80132c2 <rt_object_allocate+0x5e>
    for (index = 0; index < RT_Object_Info_Unknown; index ++)
 8013278:	2100      	addi      	r1, 1
 801327a:	230f      	addi      	r3, 16
 801327c:	e822fffb 	bnezad      	r2, 0x8013272	// 8013272 <rt_object_allocate+0xe>
    return RT_NULL;
 8013280:	3400      	movi      	r4, 0

    /* get object information */
    information = rt_object_get_information(type);
    RT_ASSERT(information != RT_NULL);

    object = (struct rt_object *)RT_KERNEL_MALLOC(information->object_size);
 8013282:	9403      	ld.w      	r0, (r4, 0xc)
 8013284:	e3fffeb2 	bsr      	0x8012fe8	// 8012fe8 <rt_malloc>
 8013288:	6d43      	mov      	r5, r0
    if (object == RT_NULL)
 801328a:	e900001a 	bez      	r0, 0x80132be	// 80132be <rt_object_allocate+0x5a>
        /* no memory can be allocated */
        return RT_NULL;
    }

    /* clean memory data of object */
    rt_memset(object, 0x0, information->object_size);
 801328e:	9443      	ld.w      	r2, (r4, 0xc)
 8013290:	3100      	movi      	r1, 0
 8013292:	e3fffb39 	bsr      	0x8012904	// 8012904 <rt_memset>

    /* set object type */
    object->type = type;

    /* set object flag */
    object->flag = 0;
 8013296:	3300      	movi      	r3, 0
 8013298:	a569      	st.b      	r3, (r5, 0x9)

    /* copy name */
    rt_strncpy(object->name, name, RT_NAME_MAX);
 801329a:	3208      	movi      	r2, 8
 801329c:	6c5f      	mov      	r1, r7
    object->type = type;
 801329e:	a5c8      	st.b      	r6, (r5, 0x8)
    rt_strncpy(object->name, name, RT_NAME_MAX);
 80132a0:	6c17      	mov      	r0, r5
 80132a2:	e3fffb93 	bsr      	0x80129c8	// 80129c8 <rt_strncpy>

    RT_OBJECT_HOOK_CALL(rt_object_attach_hook, (object));

    /* lock interrupt */
    temp = rt_hw_interrupt_disable();
 80132a6:	e3ffe99d 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    l->next->prev = n;
 80132aa:	9441      	ld.w      	r2, (r4, 0x4)

    /* insert object into information object list */
    rt_list_insert_after(&(information->object_list), &(object->list));
 80132ac:	e465000b 	addi      	r3, r5, 12
 80132b0:	b261      	st.w      	r3, (r2, 0x4)
 80132b2:	2403      	addi      	r4, 4
    n->next = l->next;
 80132b4:	b543      	st.w      	r2, (r5, 0xc)
    l->next = n;
 80132b6:	b460      	st.w      	r3, (r4, 0x0)
    n->prev = l;
 80132b8:	b584      	st.w      	r4, (r5, 0x10)

    /* unlock interrupt */
    rt_hw_interrupt_enable(temp);
 80132ba:	e3ffe998 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

    /* return object */
    return object;
}
 80132be:	6c17      	mov      	r0, r5
 80132c0:	1494      	pop      	r4-r7, r15
        if (rt_object_container[index].type == type) return &rt_object_container[index];
 80132c2:	4124      	lsli      	r1, r1, 4
 80132c4:	6104      	addu      	r4, r1
 80132c6:	07de      	br      	0x8013282	// 8013282 <rt_object_allocate+0x1e>
 80132c8:	200002c8 	.long	0x200002c8

080132cc <rt_object_delete>:
 * This function will delete an object and release object memory.
 *
 * @param object the specified object to be deleted.
 */
void rt_object_delete(rt_object_t object)
{
 80132cc:	14d1      	push      	r4, r15
 80132ce:	6d03      	mov      	r4, r0
    RT_ASSERT(!(object->type & RT_Object_Class_Static));

    RT_OBJECT_HOOK_CALL(rt_object_detach_hook, (object));

    /* reset object type */
    object->type = RT_Object_Class_Null;
 80132d0:	3300      	movi      	r3, 0
 80132d2:	a068      	st.b      	r3, (r0, 0x8)

    /* lock interrupt */
    temp = rt_hw_interrupt_disable();
 80132d4:	e3ffe986 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    n->next->prev = n->prev;
 80132d8:	9443      	ld.w      	r2, (r4, 0xc)
 80132da:	9424      	ld.w      	r1, (r4, 0x10)
 80132dc:	b221      	st.w      	r1, (r2, 0x4)
    n->prev->next = n->next;
 80132de:	9424      	ld.w      	r1, (r4, 0x10)

    /* remove from old list */
    rt_list_remove(&(object->list));
 80132e0:	e464000b 	addi      	r3, r4, 12
 80132e4:	b140      	st.w      	r2, (r1, 0x0)
    n->next = n->prev = n;
 80132e6:	b464      	st.w      	r3, (r4, 0x10)
 80132e8:	b463      	st.w      	r3, (r4, 0xc)

    /* unlock interrupt */
    rt_hw_interrupt_enable(temp);
 80132ea:	e3ffe980 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

    /* free the memory of object */
    RT_KERNEL_FREE(object);
 80132ee:	6c13      	mov      	r0, r4
 80132f0:	e3ffff26 	bsr      	0x801313c	// 801313c <rt_free>
}
 80132f4:	1491      	pop      	r4, r15
	...

080132f8 <rt_object_is_systemobject>:
rt_bool_t rt_object_is_systemobject(rt_object_t object)
{
    /* object check */
    RT_ASSERT(object != RT_NULL);

    if (object->type & RT_Object_Class_Static)
 80132f8:	d8004008 	ld.bs      	r0, (r0, 0x8)
        return RT_TRUE;

    return RT_FALSE;
}
 80132fc:	481f      	lsri      	r0, r0, 31
 80132fe:	783c      	jmp      	r15

08013300 <rt_system_scheduler_init>:
 */
void rt_system_scheduler_init(void)
{
    register rt_base_t offset;

    rt_scheduler_lock_nest = 0;
 8013300:	106b      	lrw      	r3, 0x20035a84	// 801332c <rt_system_scheduler_init+0x2c>
 8013302:	3200      	movi      	r2, 0
 8013304:	ab40      	st.h      	r2, (r3, 0x0)
 8013306:	3208      	movi      	r2, 8
 8013308:	106a      	lrw      	r3, 0x20035aa0	// 8013330 <rt_system_scheduler_init+0x30>
    l->next = l->prev = l;
 801330a:	b361      	st.w      	r3, (r3, 0x4)
 801330c:	b360      	st.w      	r3, (r3, 0x0)
 801330e:	2307      	addi      	r3, 8

    RT_DEBUG_LOG(RT_DEBUG_SCHEDULER, ("start scheduler: max priority 0x%02x\n",
                                      RT_THREAD_PRIORITY_MAX));

    for (offset = 0; offset < RT_THREAD_PRIORITY_MAX; offset ++)
 8013310:	e822fffd 	bnezad      	r2, 0x801330a	// 801330a <rt_system_scheduler_init+0xa>
    {
        rt_list_init(&rt_thread_priority_table[offset]);
    }

    rt_current_priority = RT_THREAD_PRIORITY_MAX - 1;
 8013314:	1068      	lrw      	r3, 0x20035ae0	// 8013334 <rt_system_scheduler_init+0x34>
 8013316:	3207      	movi      	r2, 7
 8013318:	a340      	st.b      	r2, (r3, 0x0)
    rt_current_thread = RT_NULL;
 801331a:	3300      	movi      	r3, 0
 801331c:	1047      	lrw      	r2, 0x20035a80	// 8013338 <rt_system_scheduler_init+0x38>
 801331e:	b260      	st.w      	r3, (r2, 0x0)

    /* initialize ready priority group */
    rt_thread_ready_priority_group = 0;
 8013320:	1047      	lrw      	r2, 0x20035ae4	// 801333c <rt_system_scheduler_init+0x3c>
 8013322:	b260      	st.w      	r3, (r2, 0x0)
 8013324:	1067      	lrw      	r3, 0x20035ae8	// 8013340 <rt_system_scheduler_init+0x40>
 8013326:	b360      	st.w      	r3, (r3, 0x0)
 8013328:	b361      	st.w      	r3, (r3, 0x4)
    rt_memset(rt_thread_ready_table, 0, sizeof(rt_thread_ready_table));
#endif

    /* initialize thread defunct */
    rt_list_init(&rt_thread_defunct);
}
 801332a:	783c      	jmp      	r15
 801332c:	20035a84 	.long	0x20035a84
 8013330:	20035aa0 	.long	0x20035aa0
 8013334:	20035ae0 	.long	0x20035ae0
 8013338:	20035a80 	.long	0x20035a80
 801333c:	20035ae4 	.long	0x20035ae4
 8013340:	20035ae8 	.long	0x20035ae8

08013344 <rt_system_scheduler_start>:
 * @ingroup SystemInit
 * This function will startup scheduler. It will select one thread
 * with the highest priority level, then switch to it.
 */
void rt_system_scheduler_start(void)
{
 8013344:	14d0      	push      	r15
    register rt_ubase_t number;

    number = __rt_ffs(rt_thread_ready_priority_group) - 1;
    highest_ready_priority = (number << 3) + __rt_ffs(rt_thread_ready_table[number]) - 1;
#else
    highest_ready_priority = __rt_ffs(rt_thread_ready_priority_group) - 1;
 8013346:	1069      	lrw      	r3, 0x20035ae4	// 8013368 <rt_system_scheduler_start+0x24>
 8013348:	9300      	ld.w      	r0, (r3, 0x0)
 801334a:	e3fffd97 	bsr      	0x8012e78	// 8012e78 <__rt_ffs>
#endif

    /* get switch to thread */
    to_thread = rt_list_entry(rt_thread_priority_table[highest_ready_priority].next,
 801334e:	2800      	subi      	r0, 1
 8013350:	1067      	lrw      	r3, 0x20035aa0	// 801336c <rt_system_scheduler_start+0x28>
 8013352:	d0030900 	ldr.w      	r0, (r3, r0 << 3)
 8013356:	e4401013 	subi      	r2, r0, 20
                              struct rt_thread,
                              tlist);

    rt_current_thread = to_thread;
 801335a:	1066      	lrw      	r3, 0x20035a80	// 8013370 <rt_system_scheduler_start+0x2c>

    /* switch to new thread */
    rt_hw_context_switch_to((rt_uint32_t)&to_thread->sp);
 801335c:	2007      	addi      	r0, 8
    rt_current_thread = to_thread;
 801335e:	b340      	st.w      	r2, (r3, 0x0)
    rt_hw_context_switch_to((rt_uint32_t)&to_thread->sp);
 8013360:	e3ffe948 	bsr      	0x80105f0	// 80105f0 <rt_hw_context_switch_to>

    /* never come back */
}
 8013364:	1490      	pop      	r15
 8013366:	0000      	.short	0x0000
 8013368:	20035ae4 	.long	0x20035ae4
 801336c:	20035aa0 	.long	0x20035aa0
 8013370:	20035a80 	.long	0x20035a80

08013374 <rt_schedule>:
/**
 * This function will perform one schedule. It will select one thread
 * with the highest priority level, then switch to it.
 */
void rt_schedule(void)
{
 8013374:	14d1      	push      	r4, r15
    rt_base_t level;
    struct rt_thread *to_thread;
    struct rt_thread *from_thread;

    /* disable interrupt */
    level = rt_hw_interrupt_disable();
 8013376:	e3ffe935 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>

    /* check the scheduler is enabled or not */
    if (rt_scheduler_lock_nest == 0)
 801337a:	1077      	lrw      	r3, 0x20035a84	// 80133d4 <rt_schedule+0x60>
    level = rt_hw_interrupt_disable();
 801337c:	6d03      	mov      	r4, r0
    if (rt_scheduler_lock_nest == 0)
 801337e:	d8635000 	ld.hs      	r3, (r3, 0x0)
 8013382:	e923001f 	bnez      	r3, 0x80133c0	// 80133c0 <rt_schedule+0x4c>
    {
        register rt_ubase_t highest_ready_priority;

#if RT_THREAD_PRIORITY_MAX <= 32
        highest_ready_priority = __rt_ffs(rt_thread_ready_priority_group) - 1;
 8013386:	1075      	lrw      	r3, 0x20035ae4	// 80133d8 <rt_schedule+0x64>
 8013388:	9300      	ld.w      	r0, (r3, 0x0)
 801338a:	e3fffd77 	bsr      	0x8012e78	// 8012e78 <__rt_ffs>
 801338e:	2800      	subi      	r0, 1
        number = __rt_ffs(rt_thread_ready_priority_group) - 1;
        highest_ready_priority = (number << 3) + __rt_ffs(rt_thread_ready_table[number]) - 1;
#endif

        /* get switch to thread */
        to_thread = rt_list_entry(rt_thread_priority_table[highest_ready_priority].next,
 8013390:	1073      	lrw      	r3, 0x20035aa0	// 80133dc <rt_schedule+0x68>
 8013392:	d0030901 	ldr.w      	r1, (r3, r0 << 3)
 8013396:	e4411013 	subi      	r2, r1, 20
                                  struct rt_thread,
                                  tlist);

        /* if the destination thread is not the same as current thread */
        if (to_thread != rt_current_thread)
 801339a:	1072      	lrw      	r3, 0x20035a80	// 80133e0 <rt_schedule+0x6c>
 801339c:	d9832000 	ld.w      	r12, (r3, 0x0)
 80133a0:	670a      	cmpne      	r2, r12
 80133a2:	0c0f      	bf      	0x80133c0	// 80133c0 <rt_schedule+0x4c>
        {
            rt_current_priority = (rt_uint8_t)highest_ready_priority;
            from_thread         = rt_current_thread;
            rt_current_thread   = to_thread;
 80133a4:	b340      	st.w      	r2, (r3, 0x0)
            _rt_scheduler_stack_check(to_thread);
#endif

            if (rt_interrupt_nest == 0)
            {
                rt_hw_context_switch((rt_ubase_t)&from_thread->sp,
 80133a6:	2107      	addi      	r1, 8
            if (rt_interrupt_nest == 0)
 80133a8:	106f      	lrw      	r3, 0x20035a9c	// 80133e4 <rt_schedule+0x70>
            rt_current_priority = (rt_uint8_t)highest_ready_priority;
 80133aa:	ea8d0010 	lrw      	r13, 0x20035ae0	// 80133e8 <rt_schedule+0x74>
            if (rt_interrupt_nest == 0)
 80133ae:	8360      	ld.b      	r3, (r3, 0x0)
            rt_current_priority = (rt_uint8_t)highest_ready_priority;
 80133b0:	dc0d0000 	st.b      	r0, (r13, 0x0)
                rt_hw_context_switch((rt_ubase_t)&from_thread->sp,
 80133b4:	e40c001b 	addi      	r0, r12, 28
            if (rt_interrupt_nest == 0)
 80133b8:	e9030008 	bez      	r3, 0x80133c8	// 80133c8 <rt_schedule+0x54>
            }
            else
            {
                RT_DEBUG_LOG(RT_DEBUG_SCHEDULER, ("switch in interrupt\n"));

                rt_hw_context_switch_interrupt((rt_ubase_t)&from_thread->sp,
 80133bc:	e3ffe931 	bsr      	0x801061e	// 801061e <rt_hw_context_switch_interrupt>
            }
        }
    }

    /* enable interrupt */
    rt_hw_interrupt_enable(level);
 80133c0:	6c13      	mov      	r0, r4
 80133c2:	e3ffe914 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 80133c6:	1491      	pop      	r4, r15
                rt_hw_context_switch((rt_ubase_t)&from_thread->sp,
 80133c8:	e3ffe93a 	bsr      	0x801063c	// 801063c <rt_hw_context_switch>
                rt_hw_interrupt_enable(level);
 80133cc:	6c13      	mov      	r0, r4
 80133ce:	e3ffe90e 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 80133d2:	1491      	pop      	r4, r15
 80133d4:	20035a84 	.long	0x20035a84
 80133d8:	20035ae4 	.long	0x20035ae4
 80133dc:	20035aa0 	.long	0x20035aa0
 80133e0:	20035a80 	.long	0x20035a80
 80133e4:	20035a9c 	.long	0x20035a9c
 80133e8:	20035ae0 	.long	0x20035ae0

080133ec <rt_schedule_insert_thread>:
 *
 * @param thread the thread to be inserted
 * @note Please do not invoke this function in user application.
 */
void rt_schedule_insert_thread(struct rt_thread *thread)
{
 80133ec:	14d1      	push      	r4, r15
 80133ee:	6d03      	mov      	r4, r0
    register rt_base_t temp;

    RT_ASSERT(thread != RT_NULL);

    /* disable interrupt */
    temp = rt_hw_interrupt_disable();
 80133f0:	e3ffe8f8 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>

    /* change stat */
    thread->stat = RT_THREAD_READY | (thread->stat & ~RT_THREAD_STAT_MASK);
 80133f4:	3200      	movi      	r2, 0
 80133f6:	d8640034 	ld.b      	r3, (r4, 0x34)
 80133fa:	2a0f      	subi      	r2, 16
 80133fc:	68c8      	and      	r3, r2
 80133fe:	ec630001 	ori      	r3, r3, 1
 8013402:	dc640034 	st.b      	r3, (r4, 0x34)

    /* insert thread to ready list */
    rt_list_insert_before(&(rt_thread_priority_table[thread->current_priority]),
 8013406:	d8640035 	ld.b      	r3, (r4, 0x35)
    l->prev->next = n;
 801340a:	4343      	lsli      	r2, r3, 3
 801340c:	ea8c000c 	lrw      	r12, 0x20035aa0	// 801343c <rt_schedule_insert_thread+0x50>
 8013410:	60b0      	addu      	r2, r12
 8013412:	e4240013 	addi      	r1, r4, 20
 8013416:	d9822001 	ld.w      	r12, (r2, 0x4)
 801341a:	4363      	lsli      	r3, r3, 3
 801341c:	dc2c2000 	st.w      	r1, (r12, 0x0)
    n->prev = l->prev;
 8013420:	dd842006 	st.w      	r12, (r4, 0x18)
    l->prev = n;
 8013424:	b221      	st.w      	r1, (r2, 0x4)
 8013426:	1046      	lrw      	r2, 0x20035aa0	// 801343c <rt_schedule_insert_thread+0x50>
 8013428:	60c8      	addu      	r3, r2
#endif

#if RT_THREAD_PRIORITY_MAX > 32
    rt_thread_ready_table[thread->number] |= thread->high_mask;
#endif
    rt_thread_ready_priority_group |= thread->number_mask;
 801342a:	1046      	lrw      	r2, 0x20035ae4	// 8013440 <rt_schedule_insert_thread+0x54>
    n->next = l;
 801342c:	b465      	st.w      	r3, (r4, 0x14)
 801342e:	9220      	ld.w      	r1, (r2, 0x0)
 8013430:	946e      	ld.w      	r3, (r4, 0x38)
 8013432:	6cc4      	or      	r3, r1
 8013434:	b260      	st.w      	r3, (r2, 0x0)

    /* enable interrupt */
    rt_hw_interrupt_enable(temp);
 8013436:	e3ffe8da 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 801343a:	1491      	pop      	r4, r15
 801343c:	20035aa0 	.long	0x20035aa0
 8013440:	20035ae4 	.long	0x20035ae4

08013444 <rt_schedule_remove_thread>:
 * @param thread the thread to be removed
 *
 * @note Please do not invoke this function in user application.
 */
void rt_schedule_remove_thread(struct rt_thread *thread)
{
 8013444:	14d1      	push      	r4, r15
 8013446:	6d03      	mov      	r4, r0
    register rt_base_t temp;

    RT_ASSERT(thread != RT_NULL);

    /* disable interrupt */
    temp = rt_hw_interrupt_disable();
 8013448:	e3ffe8cc 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    n->next->prev = n->prev;
 801344c:	9445      	ld.w      	r2, (r4, 0x14)
 801344e:	9426      	ld.w      	r1, (r4, 0x18)
 8013450:	b221      	st.w      	r1, (r2, 0x4)
    n->prev->next = n->next;
 8013452:	9426      	ld.w      	r1, (r4, 0x18)
                  thread->number_mask,
                  thread->high_mask));
#endif

    /* remove thread from ready list */
    rt_list_remove(&(thread->tlist));
 8013454:	e4640013 	addi      	r3, r4, 20
 8013458:	b140      	st.w      	r2, (r1, 0x0)
    if (rt_list_isempty(&(rt_thread_priority_table[thread->current_priority])))
 801345a:	d8440035 	ld.b      	r2, (r4, 0x35)
    n->next = n->prev = n;
 801345e:	b465      	st.w      	r3, (r4, 0x14)
 8013460:	b466      	st.w      	r3, (r4, 0x18)
 8013462:	4263      	lsli      	r3, r2, 3
 8013464:	1029      	lrw      	r1, 0x20035aa0	// 8013488 <rt_schedule_remove_thread+0x44>
 8013466:	60c4      	addu      	r3, r1
 8013468:	d0410902 	ldr.w      	r2, (r1, r2 << 3)
 801346c:	64ca      	cmpne      	r2, r3
 801346e:	0c04      	bf      	0x8013476	// 8013476 <rt_schedule_remove_thread+0x32>
        rt_thread_ready_priority_group &= ~thread->number_mask;
#endif
    }

    /* enable interrupt */
    rt_hw_interrupt_enable(temp);
 8013470:	e3ffe8bd 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 8013474:	1491      	pop      	r4, r15
        rt_thread_ready_priority_group &= ~thread->number_mask;
 8013476:	1046      	lrw      	r2, 0x20035ae4	// 801348c <rt_schedule_remove_thread+0x48>
 8013478:	946e      	ld.w      	r3, (r4, 0x38)
 801347a:	9220      	ld.w      	r1, (r2, 0x0)
 801347c:	c4612043 	andn      	r3, r1, r3
 8013480:	b260      	st.w      	r3, (r2, 0x0)
    rt_hw_interrupt_enable(temp);
 8013482:	e3ffe8b4 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 8013486:	1491      	pop      	r4, r15
 8013488:	20035aa0 	.long	0x20035aa0
 801348c:	20035ae4 	.long	0x20035ae4

08013490 <rt_enter_critical>:

/**
 * This function will lock the thread scheduler.
 */
void rt_enter_critical(void)
{
 8013490:	14d0      	push      	r15
    register rt_base_t level;

    /* disable interrupt */
    level = rt_hw_interrupt_disable();
 8013492:	e3ffe8a7 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>

    /*
     * the maximal number of nest is RT_UINT16_MAX, which is big
     * enough and does not check here
     */
    rt_scheduler_lock_nest ++;
 8013496:	1044      	lrw      	r2, 0x20035a84	// 80134a4 <rt_enter_critical+0x14>
 8013498:	8a60      	ld.h      	r3, (r2, 0x0)
 801349a:	2300      	addi      	r3, 1
 801349c:	aa60      	st.h      	r3, (r2, 0x0)

    /* enable interrupt */
    rt_hw_interrupt_enable(level);
 801349e:	e3ffe8a6 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 80134a2:	1490      	pop      	r15
 80134a4:	20035a84 	.long	0x20035a84

080134a8 <rt_exit_critical>:

/**
 * This function will unlock the thread scheduler.
 */
void rt_exit_critical(void)
{
 80134a8:	14d0      	push      	r15
    register rt_base_t level;

    /* disable interrupt */
    level = rt_hw_interrupt_disable();
 80134aa:	e3ffe89b 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>

    rt_scheduler_lock_nest --;
 80134ae:	104b      	lrw      	r2, 0x20035a84	// 80134d8 <rt_exit_critical+0x30>
 80134b0:	8a60      	ld.h      	r3, (r2, 0x0)
 80134b2:	2b00      	subi      	r3, 1
 80134b4:	74cf      	sexth      	r3, r3
 80134b6:	aa60      	st.h      	r3, (r2, 0x0)
    if (rt_scheduler_lock_nest <= 0)
 80134b8:	e9630005 	blsz      	r3, 0x80134c2	// 80134c2 <rt_exit_critical+0x1a>
        }
    }
    else
    {
        /* enable interrupt */
        rt_hw_interrupt_enable(level);
 80134bc:	e3ffe897 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
    }
}
 80134c0:	1490      	pop      	r15
        rt_scheduler_lock_nest = 0;
 80134c2:	3300      	movi      	r3, 0
 80134c4:	aa60      	st.h      	r3, (r2, 0x0)
        rt_hw_interrupt_enable(level);
 80134c6:	e3ffe892 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
        if (rt_current_thread)
 80134ca:	1065      	lrw      	r3, 0x20035a80	// 80134dc <rt_exit_critical+0x34>
 80134cc:	9360      	ld.w      	r3, (r3, 0x0)
 80134ce:	e903fff9 	bez      	r3, 0x80134c0	// 80134c0 <rt_exit_critical+0x18>
            rt_schedule();
 80134d2:	e3ffff51 	bsr      	0x8013374	// 8013374 <rt_schedule>
}
 80134d6:	1490      	pop      	r15
 80134d8:	20035a84 	.long	0x20035a84
 80134dc:	20035a80 	.long	0x20035a80

080134e0 <_thread_cleanup_execute>:

#endif

/* must be invoke witch rt_hw_interrupt_disable */
static void _thread_cleanup_execute(rt_thread_t thread)
{
 80134e0:	14d2      	push      	r4-r5, r15
 80134e2:	6d03      	mov      	r4, r0
    register rt_base_t level;

    level = rt_hw_interrupt_disable();
 80134e4:	e3ffe87e 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>

    /* invoke thread cleanup */
    if (thread->cleanup != RT_NULL)
 80134e8:	947c      	ld.w      	r3, (r4, 0x70)
    level = rt_hw_interrupt_disable();
 80134ea:	6d43      	mov      	r5, r0
    if (thread->cleanup != RT_NULL)
 80134ec:	e9030004 	bez      	r3, 0x80134f4	// 80134f4 <_thread_cleanup_execute+0x14>
        thread->cleanup(thread);
 80134f0:	6c13      	mov      	r0, r4
 80134f2:	7bcd      	jsr      	r3

    rt_hw_interrupt_enable(level);
 80134f4:	6c17      	mov      	r0, r5
 80134f6:	e3ffe87a 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 80134fa:	1492      	pop      	r4-r5, r15

080134fc <rt_thread_exit>:

void rt_thread_exit(void)
{
 80134fc:	14d2      	push      	r4-r5, r15
    struct rt_thread *thread;
    register rt_base_t level;

    /* get current thread */
    thread = rt_current_thread;
 80134fe:	1075      	lrw      	r3, 0x20035a80	// 8013550 <rt_thread_exit+0x54>
 8013500:	9380      	ld.w      	r4, (r3, 0x0)

    /* disable interrupt */
    level = rt_hw_interrupt_disable();
 8013502:	e3ffe86f 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
 8013506:	6d43      	mov      	r5, r0

    _thread_cleanup_execute(thread);
 8013508:	6c13      	mov      	r0, r4
 801350a:	e3ffffeb 	bsr      	0x80134e0	// 80134e0 <_thread_cleanup_execute>

    /* remove from schedule */
    rt_schedule_remove_thread(thread);
 801350e:	6c13      	mov      	r0, r4
 8013510:	e3ffff9a 	bsr      	0x8013444	// 8013444 <rt_schedule_remove_thread>
    /* change stat */
    thread->stat = RT_THREAD_CLOSE;
 8013514:	3304      	movi      	r3, 4
 8013516:	dc640034 	st.b      	r3, (r4, 0x34)

    /* remove it from timer list */
    rt_timer_detach(&thread->thread_timer);
 801351a:	e4040043 	addi      	r0, r4, 68
 801351e:	e00001ad 	bsr      	0x8013878	// 8013878 <rt_timer_detach>

    if (rt_object_is_systemobject((rt_object_t)thread) == RT_TRUE)
 8013522:	6c13      	mov      	r0, r4
 8013524:	e3fffeea 	bsr      	0x80132f8	// 80132f8 <rt_object_is_systemobject>
 8013528:	3841      	cmpnei      	r0, 1
 801352a:	0c0f      	bf      	0x8013548	// 8013548 <rt_thread_exit+0x4c>
    l->next->prev = n;
 801352c:	106a      	lrw      	r3, 0x20035ae8	// 8013554 <rt_thread_exit+0x58>
        rt_object_detach((rt_object_t)thread);
    }
    else
    {
        /* insert to defunct thread list */
        rt_list_insert_after(&rt_thread_defunct, &(thread->tlist));
 801352e:	e4440013 	addi      	r2, r4, 20
 8013532:	9320      	ld.w      	r1, (r3, 0x0)
    l->next = n;
 8013534:	b340      	st.w      	r2, (r3, 0x0)
    l->next->prev = n;
 8013536:	b141      	st.w      	r2, (r1, 0x4)
    n->next = l->next;
 8013538:	b425      	st.w      	r1, (r4, 0x14)
    n->prev = l;
 801353a:	b466      	st.w      	r3, (r4, 0x18)
    }

    /* switch to next task */
    rt_schedule();
 801353c:	e3ffff1c 	bsr      	0x8013374	// 8013374 <rt_schedule>

    /* enable interrupt */
    rt_hw_interrupt_enable(level);
 8013540:	6c17      	mov      	r0, r5
 8013542:	e3ffe854 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 8013546:	1492      	pop      	r4-r5, r15
        rt_object_detach((rt_object_t)thread);
 8013548:	6c13      	mov      	r0, r4
 801354a:	e3fffe7b 	bsr      	0x8013240	// 8013240 <rt_object_detach>
 801354e:	07f7      	br      	0x801353c	// 801353c <rt_thread_exit+0x40>
 8013550:	20035a80 	.long	0x20035a80
 8013554:	20035ae8 	.long	0x20035ae8

08013558 <rt_thread_timeout>:
 * when thread is timeout to wait some resource.
 *
 * @param parameter the parameter of thread timeout function
 */
void rt_thread_timeout(void *parameter)
{
 8013558:	14d0      	push      	r15
    n->next->prev = n->prev;
 801355a:	9025      	ld.w      	r1, (r0, 0x14)
    RT_ASSERT(thread != RT_NULL);
    RT_ASSERT((thread->stat & RT_THREAD_STAT_MASK) == RT_THREAD_SUSPEND);
    RT_ASSERT(rt_object_get_type((rt_object_t)thread) == RT_Object_Class_Thread);

    /* set error number */
    thread->error = -RT_ETIMEOUT;
 801355c:	3200      	movi      	r2, 0
 801355e:	d9802006 	ld.w      	r12, (r0, 0x18)
 8013562:	2a01      	subi      	r2, 2
 8013564:	b04c      	st.w      	r2, (r0, 0x30)
 8013566:	dd812001 	st.w      	r12, (r1, 0x4)
    n->prev->next = n->next;
 801356a:	d9802006 	ld.w      	r12, (r0, 0x18)

    /* remove from suspend list */
    rt_list_remove(&(thread->tlist));
 801356e:	e4400013 	addi      	r2, r0, 20
 8013572:	dc2c2000 	st.w      	r1, (r12, 0x0)
    n->next = n->prev = n;
 8013576:	b046      	st.w      	r2, (r0, 0x18)
 8013578:	b045      	st.w      	r2, (r0, 0x14)

    /* insert to schedule ready list */
    rt_schedule_insert_thread(thread);
 801357a:	e3ffff39 	bsr      	0x80133ec	// 80133ec <rt_schedule_insert_thread>

    /* do schedule */
    rt_schedule();
 801357e:	e3fffefb 	bsr      	0x8013374	// 8013374 <rt_schedule>
}
 8013582:	1490      	pop      	r15

08013584 <rt_thread_init>:
{
 8013584:	14d7      	push      	r4-r10, r15
 8013586:	1422      	subi      	r14, r14, 8
 8013588:	6d03      	mov      	r4, r0
 801358a:	6e8b      	mov      	r10, r2
    rt_object_init((rt_object_t)thread, RT_Object_Class_Thread, name);
 801358c:	6c87      	mov      	r2, r1
 801358e:	3101      	movi      	r1, 1
{
 8013590:	6e4f      	mov      	r9, r3
 8013592:	d8ae0030 	ld.b      	r5, (r14, 0x30)
 8013596:	98ea      	ld.w      	r7, (r14, 0x28)
 8013598:	d90e200b 	ld.w      	r8, (r14, 0x2c)
 801359c:	98cd      	ld.w      	r6, (r14, 0x34)
    rt_object_init((rt_object_t)thread, RT_Object_Class_Thread, name);
 801359e:	e3fffe19 	bsr      	0x80131d0	// 80131d0 <rt_object_init>
    rt_list_init(&(thread->tlist));
 80135a2:	e4440013 	addi      	r2, r4, 20
    l->next = l->prev = l;
 80135a6:	b446      	st.w      	r2, (r4, 0x18)
 80135a8:	b445      	st.w      	r2, (r4, 0x14)
    thread->entry = (void *)entry;
 80135aa:	dd442008 	st.w      	r10, (r4, 0x20)
    rt_memset(thread->stack_addr, '#', thread->stack_size);
 80135ae:	6ca3      	mov      	r2, r8
    thread->parameter = parameter;
 80135b0:	dd242009 	st.w      	r9, (r4, 0x24)
    thread->stack_addr = stack_start;
 80135b4:	b4ea      	st.w      	r7, (r4, 0x28)
    thread->stack_size = stack_size;
 80135b6:	dd04200b 	st.w      	r8, (r4, 0x2c)
    rt_memset(thread->stack_addr, '#', thread->stack_size);
 80135ba:	3123      	movi      	r1, 35
 80135bc:	6c1f      	mov      	r0, r7
 80135be:	e3fff9a3 	bsr      	0x8012904	// 8012904 <rt_memset>
                                          (rt_uint8_t *)((char *)thread->stack_addr + thread->stack_size - sizeof(rt_ubase_t)),
 80135c2:	944b      	ld.w      	r2, (r4, 0x2c)
    thread->sp = (void *)rt_hw_stack_init(thread->entry, thread->parameter,
 80135c4:	942a      	ld.w      	r1, (r4, 0x28)
                                          (rt_uint8_t *)((char *)thread->stack_addr + thread->stack_size - sizeof(rt_ubase_t)),
 80135c6:	2a03      	subi      	r2, 4
    thread->sp = (void *)rt_hw_stack_init(thread->entry, thread->parameter,
 80135c8:	6084      	addu      	r2, r1
 80135ca:	1070      	lrw      	r3, 0x80134fc	// 8013608 <rt_thread_init+0x84>
 80135cc:	9408      	ld.w      	r0, (r4, 0x20)
 80135ce:	9429      	ld.w      	r1, (r4, 0x24)
 80135d0:	e0000ede 	bsr      	0x801538c	// 801538c <rt_hw_stack_init>
    thread->init_priority    = priority;
 80135d4:	dca40036 	st.b      	r5, (r4, 0x36)
    thread->current_priority = priority;
 80135d8:	dca40035 	st.b      	r5, (r4, 0x35)
    thread->number_mask = 0;
 80135dc:	3500      	movi      	r5, 0
    thread->sp = (void *)rt_hw_stack_init(thread->entry, thread->parameter,
 80135de:	b407      	st.w      	r0, (r4, 0x1c)
    thread->number_mask = 0;
 80135e0:	b4ae      	st.w      	r5, (r4, 0x38)
    rt_timer_init(&(thread->thread_timer),
 80135e2:	e4040043 	addi      	r0, r4, 68
    thread->init_tick      = tick;
 80135e6:	b4cf      	st.w      	r6, (r4, 0x3c)
    thread->remaining_tick = tick;
 80135e8:	b4d0      	st.w      	r6, (r4, 0x40)
    thread->error = RT_EOK;
 80135ea:	b4ac      	st.w      	r5, (r4, 0x30)
    thread->stat  = RT_THREAD_INIT;
 80135ec:	dca40034 	st.b      	r5, (r4, 0x34)
    thread->cleanup   = 0;
 80135f0:	b4bc      	st.w      	r5, (r4, 0x70)
    thread->user_data = 0;
 80135f2:	b4bd      	st.w      	r5, (r4, 0x74)
    rt_timer_init(&(thread->thread_timer),
 80135f4:	b8a1      	st.w      	r5, (r14, 0x4)
 80135f6:	b8a0      	st.w      	r5, (r14, 0x0)
 80135f8:	6cd3      	mov      	r3, r4
 80135fa:	1045      	lrw      	r2, 0x8013558	// 801360c <rt_thread_init+0x88>
 80135fc:	6c53      	mov      	r1, r4
 80135fe:	e0000123 	bsr      	0x8013844	// 8013844 <rt_timer_init>
}
 8013602:	6c17      	mov      	r0, r5
 8013604:	1402      	addi      	r14, r14, 8
 8013606:	1497      	pop      	r4-r10, r15
 8013608:	080134fc 	.long	0x080134fc
 801360c:	08013558 	.long	0x08013558

08013610 <rt_thread_self>:
}
 8013610:	1062      	lrw      	r3, 0x20035a80	// 8013618 <rt_thread_self+0x8>
 8013612:	9300      	ld.w      	r0, (r3, 0x0)
 8013614:	783c      	jmp      	r15
 8013616:	0000      	.short	0x0000
 8013618:	20035a80 	.long	0x20035a80

0801361c <rt_thread_create>:
{
 801361c:	14d7      	push      	r4-r10, r15
 801361e:	1422      	subi      	r14, r14, 8
 8013620:	6e87      	mov      	r10, r1
    thread = (struct rt_thread *)rt_object_allocate(RT_Object_Class_Thread,
 8013622:	6c43      	mov      	r1, r0
 8013624:	3001      	movi      	r0, 1
{
 8013626:	6e4b      	mov      	r9, r2
 8013628:	6d4f      	mov      	r5, r3
 801362a:	98cb      	ld.w      	r6, (r14, 0x2c)
 801362c:	d8ee0028 	ld.b      	r7, (r14, 0x28)
    thread = (struct rt_thread *)rt_object_allocate(RT_Object_Class_Thread,
 8013630:	e3fffe1a 	bsr      	0x8013264	// 8013264 <rt_object_allocate>
 8013634:	6d03      	mov      	r4, r0
    if (thread == RT_NULL)
 8013636:	e9000036 	bez      	r0, 0x80136a2	// 80136a2 <rt_thread_create+0x86>
    stack_start = (void *)RT_KERNEL_MALLOC(stack_size);
 801363a:	6c17      	mov      	r0, r5
 801363c:	e3fffcd6 	bsr      	0x8012fe8	// 8012fe8 <rt_malloc>
 8013640:	6e03      	mov      	r8, r0
    if (stack_start == RT_NULL)
 8013642:	e9000033 	bez      	r0, 0x80136a8	// 80136a8 <rt_thread_create+0x8c>
    rt_list_init(&(thread->tlist));
 8013646:	e4640013 	addi      	r3, r4, 20
 801364a:	b466      	st.w      	r3, (r4, 0x18)
 801364c:	b465      	st.w      	r3, (r4, 0x14)
    rt_memset(thread->stack_addr, '#', thread->stack_size);
 801364e:	6c97      	mov      	r2, r5
 8013650:	3123      	movi      	r1, 35
    thread->entry = (void *)entry;
 8013652:	dd442008 	st.w      	r10, (r4, 0x20)
    thread->parameter = parameter;
 8013656:	dd242009 	st.w      	r9, (r4, 0x24)
    thread->stack_addr = stack_start;
 801365a:	b40a      	st.w      	r0, (r4, 0x28)
    thread->stack_size = stack_size;
 801365c:	b4ab      	st.w      	r5, (r4, 0x2c)
    rt_memset(thread->stack_addr, '#', thread->stack_size);
 801365e:	e3fff953 	bsr      	0x8012904	// 8012904 <rt_memset>
                                          (rt_uint8_t *)((char *)thread->stack_addr + thread->stack_size - sizeof(rt_ubase_t)),
 8013662:	944b      	ld.w      	r2, (r4, 0x2c)
    thread->sp = (void *)rt_hw_stack_init(thread->entry, thread->parameter,
 8013664:	942a      	ld.w      	r1, (r4, 0x28)
                                          (rt_uint8_t *)((char *)thread->stack_addr + thread->stack_size - sizeof(rt_ubase_t)),
 8013666:	2a03      	subi      	r2, 4
    thread->sp = (void *)rt_hw_stack_init(thread->entry, thread->parameter,
 8013668:	6084      	addu      	r2, r1
 801366a:	1073      	lrw      	r3, 0x80134fc	// 80136b4 <rt_thread_create+0x98>
 801366c:	9408      	ld.w      	r0, (r4, 0x20)
 801366e:	9429      	ld.w      	r1, (r4, 0x24)
 8013670:	e0000e8e 	bsr      	0x801538c	// 801538c <rt_hw_stack_init>
    thread->number_mask = 0;
 8013674:	3300      	movi      	r3, 0
    thread->sp = (void *)rt_hw_stack_init(thread->entry, thread->parameter,
 8013676:	b407      	st.w      	r0, (r4, 0x1c)
    thread->number_mask = 0;
 8013678:	b46e      	st.w      	r3, (r4, 0x38)
    thread->error = RT_EOK;
 801367a:	b46c      	st.w      	r3, (r4, 0x30)
    thread->stat  = RT_THREAD_INIT;
 801367c:	dc640034 	st.b      	r3, (r4, 0x34)
    thread->cleanup   = 0;
 8013680:	b47c      	st.w      	r3, (r4, 0x70)
    thread->user_data = 0;
 8013682:	b47d      	st.w      	r3, (r4, 0x74)
    thread->init_priority    = priority;
 8013684:	dce40036 	st.b      	r7, (r4, 0x36)
    thread->current_priority = priority;
 8013688:	dce40035 	st.b      	r7, (r4, 0x35)
    thread->init_tick      = tick;
 801368c:	b4cf      	st.w      	r6, (r4, 0x3c)
    thread->remaining_tick = tick;
 801368e:	b4d0      	st.w      	r6, (r4, 0x40)
    rt_timer_init(&(thread->thread_timer),
 8013690:	6c53      	mov      	r1, r4
 8013692:	b861      	st.w      	r3, (r14, 0x4)
 8013694:	b860      	st.w      	r3, (r14, 0x0)
 8013696:	e4040043 	addi      	r0, r4, 68
 801369a:	6cd3      	mov      	r3, r4
 801369c:	1047      	lrw      	r2, 0x8013558	// 80136b8 <rt_thread_create+0x9c>
 801369e:	e00000d3 	bsr      	0x8013844	// 8013844 <rt_timer_init>
}
 80136a2:	6c13      	mov      	r0, r4
 80136a4:	1402      	addi      	r14, r14, 8
 80136a6:	1497      	pop      	r4-r10, r15
        rt_object_delete((rt_object_t)thread);
 80136a8:	6c13      	mov      	r0, r4
 80136aa:	e3fffe11 	bsr      	0x80132cc	// 80132cc <rt_object_delete>
        return RT_NULL;
 80136ae:	6d23      	mov      	r4, r8
 80136b0:	07f9      	br      	0x80136a2	// 80136a2 <rt_thread_create+0x86>
 80136b2:	0000      	.short	0x0000
 80136b4:	080134fc 	.long	0x080134fc
 80136b8:	08013558 	.long	0x08013558

080136bc <rt_thread_yield>:
{
 80136bc:	14d0      	push      	r15
    level = rt_hw_interrupt_disable();
 80136be:	e3ffe791 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    thread = rt_current_thread;
 80136c2:	107a      	lrw      	r3, 0x20035a80	// 8013728 <rt_thread_yield+0x6c>
    level = rt_hw_interrupt_disable();
 80136c4:	6c43      	mov      	r1, r0
    thread = rt_current_thread;
 80136c6:	9360      	ld.w      	r3, (r3, 0x0)
    if ((thread->stat & RT_THREAD_STAT_MASK) == RT_THREAD_READY &&
 80136c8:	d8430034 	ld.b      	r2, (r3, 0x34)
 80136cc:	e442200f 	andi      	r2, r2, 15
 80136d0:	3a41      	cmpnei      	r2, 1
 80136d2:	0c06      	bf      	0x80136de	// 80136de <rt_thread_yield+0x22>
    rt_hw_interrupt_enable(level);
 80136d4:	6c07      	mov      	r0, r1
 80136d6:	e3ffe78a 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 80136da:	3000      	movi      	r0, 0
 80136dc:	1490      	pop      	r15
        thread->tlist.next != thread->tlist.prev)
 80136de:	9345      	ld.w      	r2, (r3, 0x14)
 80136e0:	d9832006 	ld.w      	r12, (r3, 0x18)
    if ((thread->stat & RT_THREAD_STAT_MASK) == RT_THREAD_READY &&
 80136e4:	670a      	cmpne      	r2, r12
 80136e6:	0ff7      	bf      	0x80136d4	// 80136d4 <rt_thread_yield+0x18>
    n->next->prev = n->prev;
 80136e8:	dd822001 	st.w      	r12, (r2, 0x4)
    n->prev->next = n->next;
 80136ec:	9326      	ld.w      	r1, (r3, 0x18)
        rt_list_remove(&(thread->tlist));
 80136ee:	e5a30013 	addi      	r13, r3, 20
 80136f2:	b140      	st.w      	r2, (r1, 0x0)
        rt_list_insert_before(&(rt_thread_priority_table[thread->current_priority]),
 80136f4:	d8430035 	ld.b      	r2, (r3, 0x35)
    l->prev->next = n;
 80136f8:	4223      	lsli      	r1, r2, 3
 80136fa:	ea8c000d 	lrw      	r12, 0x20035aa0	// 801372c <rt_thread_yield+0x70>
 80136fe:	6070      	addu      	r1, r12
    n->next = n->prev = n;
 8013700:	dda32006 	st.w      	r13, (r3, 0x18)
    l->prev->next = n;
 8013704:	d9812001 	ld.w      	r12, (r1, 0x4)
 8013708:	4243      	lsli      	r2, r2, 3
 801370a:	ddac2000 	st.w      	r13, (r12, 0x0)
    n->prev = l->prev;
 801370e:	dd832006 	st.w      	r12, (r3, 0x18)
    l->prev = n;
 8013712:	dda12001 	st.w      	r13, (r1, 0x4)
 8013716:	1026      	lrw      	r1, 0x20035aa0	// 801372c <rt_thread_yield+0x70>
 8013718:	6084      	addu      	r2, r1
    n->next = l;
 801371a:	b345      	st.w      	r2, (r3, 0x14)
        rt_hw_interrupt_enable(level);
 801371c:	e3ffe767 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
        rt_schedule();
 8013720:	e3fffe2a 	bsr      	0x8013374	// 8013374 <rt_schedule>
}
 8013724:	3000      	movi      	r0, 0
 8013726:	1490      	pop      	r15
 8013728:	20035a80 	.long	0x20035a80
 801372c:	20035aa0 	.long	0x20035aa0

08013730 <rt_thread_suspend>:
{
 8013730:	14d2      	push      	r4-r5, r15
    if ((thread->stat & RT_THREAD_STAT_MASK) != RT_THREAD_READY)
 8013732:	d8600034 	ld.b      	r3, (r0, 0x34)
 8013736:	e463200f 	andi      	r3, r3, 15
 801373a:	3b41      	cmpnei      	r3, 1
{
 801373c:	6d03      	mov      	r4, r0
    if ((thread->stat & RT_THREAD_STAT_MASK) != RT_THREAD_READY)
 801373e:	0819      	bt      	0x8013770	// 8013770 <rt_thread_suspend+0x40>
    temp = rt_hw_interrupt_disable();
 8013740:	e3ffe750 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
 8013744:	6d43      	mov      	r5, r0
    rt_schedule_remove_thread(thread);
 8013746:	6c13      	mov      	r0, r4
 8013748:	e3fffe7e 	bsr      	0x8013444	// 8013444 <rt_schedule_remove_thread>
    thread->stat = RT_THREAD_SUSPEND | (thread->stat & ~RT_THREAD_STAT_MASK);
 801374c:	3200      	movi      	r2, 0
 801374e:	d8640034 	ld.b      	r3, (r4, 0x34)
 8013752:	2a0f      	subi      	r2, 16
 8013754:	68c8      	and      	r3, r2
 8013756:	ec630002 	ori      	r3, r3, 2
 801375a:	dc640034 	st.b      	r3, (r4, 0x34)
    rt_timer_stop(&(thread->thread_timer));
 801375e:	e4040043 	addi      	r0, r4, 68
 8013762:	e00000e1 	bsr      	0x8013924	// 8013924 <rt_timer_stop>
    rt_hw_interrupt_enable(temp);
 8013766:	6c17      	mov      	r0, r5
 8013768:	e3ffe741 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
    return RT_EOK;
 801376c:	3000      	movi      	r0, 0
}
 801376e:	1492      	pop      	r4-r5, r15
        return -RT_ERROR;
 8013770:	3000      	movi      	r0, 0
 8013772:	2800      	subi      	r0, 1
}
 8013774:	1492      	pop      	r4-r5, r15
	...

08013778 <rt_thread_sleep>:
{
 8013778:	14d3      	push      	r4-r6, r15
 801377a:	1421      	subi      	r14, r14, 4
 801377c:	b800      	st.w      	r0, (r14, 0x0)
    temp = rt_hw_interrupt_disable();
 801377e:	e3ffe731 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    thread = rt_current_thread;
 8013782:	1070      	lrw      	r3, 0x20035a80	// 80137c0 <rt_thread_sleep+0x48>
    temp = rt_hw_interrupt_disable();
 8013784:	6d83      	mov      	r6, r0
    thread = rt_current_thread;
 8013786:	9380      	ld.w      	r4, (r3, 0x0)
    rt_timer_control(&(thread->thread_timer), RT_TIMER_CTRL_SET_TIME, &tick);
 8013788:	e4a40043 	addi      	r5, r4, 68
    rt_thread_suspend(thread);
 801378c:	6c13      	mov      	r0, r4
 801378e:	e3ffffd1 	bsr      	0x8013730	// 8013730 <rt_thread_suspend>
    rt_timer_control(&(thread->thread_timer), RT_TIMER_CTRL_SET_TIME, &tick);
 8013792:	6cbb      	mov      	r2, r14
 8013794:	3100      	movi      	r1, 0
 8013796:	6c17      	mov      	r0, r5
 8013798:	e00000e2 	bsr      	0x801395c	// 801395c <rt_timer_control>
    rt_timer_start(&(thread->thread_timer));
 801379c:	6c17      	mov      	r0, r5
 801379e:	e0000085 	bsr      	0x80138a8	// 80138a8 <rt_timer_start>
    rt_hw_interrupt_enable(temp);
 80137a2:	6c1b      	mov      	r0, r6
 80137a4:	e3ffe723 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
    rt_schedule();
 80137a8:	e3fffde6 	bsr      	0x8013374	// 8013374 <rt_schedule>
    if (thread->error == -RT_ETIMEOUT)
 80137ac:	3300      	movi      	r3, 0
 80137ae:	944c      	ld.w      	r2, (r4, 0x30)
 80137b0:	2b01      	subi      	r3, 2
 80137b2:	64ca      	cmpne      	r2, r3
 80137b4:	0803      	bt      	0x80137ba	// 80137ba <rt_thread_sleep+0x42>
        thread->error = RT_EOK;
 80137b6:	3300      	movi      	r3, 0
 80137b8:	b46c      	st.w      	r3, (r4, 0x30)
}
 80137ba:	3000      	movi      	r0, 0
 80137bc:	1401      	addi      	r14, r14, 4
 80137be:	1493      	pop      	r4-r6, r15
 80137c0:	20035a80 	.long	0x20035a80

080137c4 <rt_thread_delay>:
{
 80137c4:	14d0      	push      	r15
    return rt_thread_sleep(tick);
 80137c6:	e3ffffd9 	bsr      	0x8013778	// 8013778 <rt_thread_sleep>
}
 80137ca:	1490      	pop      	r15

080137cc <rt_thread_resume>:
{
 80137cc:	14d2      	push      	r4-r5, r15
    if ((thread->stat & RT_THREAD_STAT_MASK) != RT_THREAD_SUSPEND)
 80137ce:	d8600034 	ld.b      	r3, (r0, 0x34)
 80137d2:	e463200f 	andi      	r3, r3, 15
 80137d6:	3b42      	cmpnei      	r3, 2
{
 80137d8:	6d03      	mov      	r4, r0
    if ((thread->stat & RT_THREAD_STAT_MASK) != RT_THREAD_SUSPEND)
 80137da:	0819      	bt      	0x801380c	// 801380c <rt_thread_resume+0x40>
    temp = rt_hw_interrupt_disable();
 80137dc:	e3ffe702 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    n->next->prev = n->prev;
 80137e0:	9445      	ld.w      	r2, (r4, 0x14)
 80137e2:	9426      	ld.w      	r1, (r4, 0x18)
 80137e4:	b221      	st.w      	r1, (r2, 0x4)
    n->prev->next = n->next;
 80137e6:	9426      	ld.w      	r1, (r4, 0x18)
    rt_list_remove(&(thread->tlist));
 80137e8:	e4640013 	addi      	r3, r4, 20
 80137ec:	b140      	st.w      	r2, (r1, 0x0)
    temp = rt_hw_interrupt_disable();
 80137ee:	6d43      	mov      	r5, r0
    n->next = n->prev = n;
 80137f0:	b466      	st.w      	r3, (r4, 0x18)
 80137f2:	b465      	st.w      	r3, (r4, 0x14)
    rt_timer_stop(&thread->thread_timer);
 80137f4:	e4040043 	addi      	r0, r4, 68
 80137f8:	e0000096 	bsr      	0x8013924	// 8013924 <rt_timer_stop>
    rt_hw_interrupt_enable(temp);
 80137fc:	6c17      	mov      	r0, r5
 80137fe:	e3ffe6f6 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
    rt_schedule_insert_thread(thread);
 8013802:	6c13      	mov      	r0, r4
 8013804:	e3fffdf4 	bsr      	0x80133ec	// 80133ec <rt_schedule_insert_thread>
    return RT_EOK;
 8013808:	3000      	movi      	r0, 0
}
 801380a:	1492      	pop      	r4-r5, r15
        return -RT_ERROR;
 801380c:	3000      	movi      	r0, 0
 801380e:	2800      	subi      	r0, 1
}
 8013810:	1492      	pop      	r4-r5, r15
	...

08013814 <rt_thread_startup>:
{
 8013814:	14d0      	push      	r15
    thread->current_priority = thread->init_priority;
 8013816:	d8200036 	ld.b      	r1, (r0, 0x36)
    thread->number_mask = 1L << thread->current_priority;
 801381a:	3201      	movi      	r2, 1
 801381c:	7084      	lsl      	r2, r1
 801381e:	b04e      	st.w      	r2, (r0, 0x38)
    thread->stat = RT_THREAD_SUSPEND;
 8013820:	3202      	movi      	r2, 2
    thread->current_priority = thread->init_priority;
 8013822:	dc200035 	st.b      	r1, (r0, 0x35)
    thread->stat = RT_THREAD_SUSPEND;
 8013826:	dc400034 	st.b      	r2, (r0, 0x34)
    rt_thread_resume(thread);
 801382a:	e3ffffd1 	bsr      	0x80137cc	// 80137cc <rt_thread_resume>
    return rt_current_thread;
 801382e:	1065      	lrw      	r3, 0x20035a80	// 8013840 <rt_thread_startup+0x2c>
    if (rt_thread_self() != RT_NULL)
 8013830:	9360      	ld.w      	r3, (r3, 0x0)
 8013832:	e9030004 	bez      	r3, 0x801383a	// 801383a <rt_thread_startup+0x26>
        rt_schedule();
 8013836:	e3fffd9f 	bsr      	0x8013374	// 8013374 <rt_schedule>
}
 801383a:	3000      	movi      	r0, 0
 801383c:	1490      	pop      	r15
 801383e:	0000      	.short	0x0000
 8013840:	20035a80 	.long	0x20035a80

08013844 <rt_timer_init>:
                   const char *name,
                   void (*timeout)(void *parameter),
                   void       *parameter,
                   rt_tick_t   time,
                   rt_uint8_t  flag)
{
 8013844:	14d5      	push      	r4-r8, r15
 8013846:	6d03      	mov      	r4, r0
 8013848:	6dcb      	mov      	r7, r2
 801384a:	6d8f      	mov      	r6, r3
    /* timer check */
    RT_ASSERT(timer != RT_NULL);

    /* timer object initialization */
    rt_object_init((rt_object_t)timer, RT_Object_Class_Timer, name);
 801384c:	6c87      	mov      	r2, r1
{
 801384e:	9866      	ld.w      	r3, (r14, 0x18)
    rt_object_init((rt_object_t)timer, RT_Object_Class_Timer, name);
 8013850:	310a      	movi      	r1, 10
{
 8013852:	6e0f      	mov      	r8, r3
 8013854:	d8ae001c 	ld.b      	r5, (r14, 0x1c)
    rt_object_init((rt_object_t)timer, RT_Object_Class_Timer, name);
 8013858:	e3fffcbc 	bsr      	0x80131d0	// 80131d0 <rt_object_init>
    timer->timeout_tick = 0;
 801385c:	3300      	movi      	r3, 0
    timer->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
 801385e:	3d80      	bclri      	r5, 0
    timer->timeout_tick = 0;
 8013860:	b46a      	st.w      	r3, (r4, 0x28)
        rt_list_init(&(timer->row[i]));
 8013862:	e4640013 	addi      	r3, r4, 20
    timer->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
 8013866:	a4a9      	st.b      	r5, (r4, 0x9)
    timer->timeout_func = timeout;
 8013868:	b4e7      	st.w      	r7, (r4, 0x1c)
    timer->parameter    = parameter;
 801386a:	b4c8      	st.w      	r6, (r4, 0x20)
    timer->init_tick    = time;
 801386c:	dd042009 	st.w      	r8, (r4, 0x24)
    l->next = l->prev = l;
 8013870:	b466      	st.w      	r3, (r4, 0x18)
 8013872:	b465      	st.w      	r3, (r4, 0x14)

    _rt_timer_init(timer, timeout, parameter, time, flag);
}
 8013874:	1495      	pop      	r4-r8, r15
	...

08013878 <rt_timer_detach>:
 * @param timer the static timer object
 *
 * @return the operation status, RT_EOK on OK; RT_ERROR on error
 */
rt_err_t rt_timer_detach(rt_timer_t timer)
{
 8013878:	14d1      	push      	r4, r15
 801387a:	6d03      	mov      	r4, r0
    RT_ASSERT(timer != RT_NULL);
    RT_ASSERT(rt_object_get_type(&timer->parent) == RT_Object_Class_Timer);
    RT_ASSERT(rt_object_is_systemobject(&timer->parent));

    /* disable interrupt */
    level = rt_hw_interrupt_disable();
 801387c:	e3ffe6b2 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    n->next->prev = n->prev;
 8013880:	9445      	ld.w      	r2, (r4, 0x14)
 8013882:	9426      	ld.w      	r1, (r4, 0x18)
 8013884:	b221      	st.w      	r1, (r2, 0x4)
    n->prev->next = n->next;
 8013886:	9426      	ld.w      	r1, (r4, 0x18)
        rt_list_remove(&timer->row[i]);
 8013888:	e4640013 	addi      	r3, r4, 20
 801388c:	b140      	st.w      	r2, (r1, 0x0)
    n->next = n->prev = n;
 801388e:	b466      	st.w      	r3, (r4, 0x18)
 8013890:	b465      	st.w      	r3, (r4, 0x14)

    _rt_timer_remove(timer);
    /* stop timer */
    timer->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
 8013892:	8469      	ld.b      	r3, (r4, 0x9)
 8013894:	3b80      	bclri      	r3, 0
 8013896:	a469      	st.b      	r3, (r4, 0x9)

    /* enable interrupt */
    rt_hw_interrupt_enable(level);
 8013898:	e3ffe6a9 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

    rt_object_detach((rt_object_t)timer);
 801389c:	6c13      	mov      	r0, r4
 801389e:	e3fffcd1 	bsr      	0x8013240	// 8013240 <rt_object_detach>

    return RT_EOK;
}
 80138a2:	3000      	movi      	r0, 0
 80138a4:	1491      	pop      	r4, r15
	...

080138a8 <rt_timer_start>:
 * @param timer the timer to be started
 *
 * @return the operation status, RT_EOK on OK, -RT_ERROR on error
 */
rt_err_t rt_timer_start(rt_timer_t timer)
{
 80138a8:	14d3      	push      	r4-r6, r15
 80138aa:	6d03      	mov      	r4, r0
    /* timer check */
    RT_ASSERT(timer != RT_NULL);
    RT_ASSERT(rt_object_get_type(&timer->parent) == RT_Object_Class_Timer);

    /* stop timer firstly */
    level = rt_hw_interrupt_disable();
 80138ac:	e3ffe69a 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    n->next->prev = n->prev;
 80138b0:	9465      	ld.w      	r3, (r4, 0x14)
 80138b2:	9446      	ld.w      	r2, (r4, 0x18)
 80138b4:	b341      	st.w      	r2, (r3, 0x4)
    n->prev->next = n->next;
 80138b6:	9446      	ld.w      	r2, (r4, 0x18)
        rt_list_remove(&timer->row[i]);
 80138b8:	e4a40013 	addi      	r5, r4, 20
 80138bc:	b260      	st.w      	r3, (r2, 0x0)
    /* remove timer from list */
    _rt_timer_remove(timer);
    /* change status of timer */
    timer->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
 80138be:	8469      	ld.b      	r3, (r4, 0x9)
 80138c0:	3b80      	bclri      	r3, 0
 80138c2:	a469      	st.b      	r3, (r4, 0x9)
    n->next = n->prev = n;
 80138c4:	b4a6      	st.w      	r5, (r4, 0x18)
 80138c6:	b4a5      	st.w      	r5, (r4, 0x14)
    level = rt_hw_interrupt_disable();
 80138c8:	6d83      	mov      	r6, r0
    /*
     * get timeout tick,
     * the max timeout tick shall not great than RT_TICK_MAX/2
     */
    RT_ASSERT(timer->init_tick < RT_TICK_MAX / 2);
    timer->timeout_tick = rt_tick_get() + timer->init_tick;
 80138ca:	e3fff5b5 	bsr      	0x8012434	// 8012434 <rt_tick_get>
 80138ce:	9469      	ld.w      	r3, (r4, 0x24)
 80138d0:	600c      	addu      	r0, r3
 80138d2:	1053      	lrw      	r2, 0x20035a8c	// 801391c <rt_timer_start+0x74>
             */
            if ((t->timeout_tick - timer->timeout_tick) == 0)
            {
                continue;
            }
            else if ((t->timeout_tick - timer->timeout_tick) < RT_TICK_MAX / 2)
 80138d4:	c7c0502d 	bmaski      	r13, 31
    timer->timeout_tick = rt_tick_get() + timer->init_tick;
 80138d8:	b40a      	st.w      	r0, (r4, 0x28)
 80138da:	d9822001 	ld.w      	r12, (r2, 0x4)
            else if ((t->timeout_tick - timer->timeout_tick) < RT_TICK_MAX / 2)
 80138de:	e5ad1000 	subi      	r13, r13, 1
 80138e2:	0408      	br      	0x80138f2	// 80138f2 <rt_timer_start+0x4a>
            if ((t->timeout_tick - timer->timeout_tick) == 0)
 80138e4:	9165      	ld.w      	r3, (r1, 0x14)
 80138e6:	64c2      	cmpne      	r0, r3
 80138e8:	0c04      	bf      	0x80138f0	// 80138f0 <rt_timer_start+0x48>
            else if ((t->timeout_tick - timer->timeout_tick) < RT_TICK_MAX / 2)
 80138ea:	60c2      	subu      	r3, r0
 80138ec:	64f4      	cmphs      	r13, r3
 80138ee:	0805      	bt      	0x80138f8	// 80138f8 <rt_timer_start+0x50>
{
 80138f0:	6c87      	mov      	r2, r1
        for (; row_head[row_lvl] != timer_list[row_lvl].prev;
 80138f2:	670a      	cmpne      	r2, r12
            rt_list_t *p = row_head[row_lvl]->next;
 80138f4:	9220      	ld.w      	r1, (r2, 0x0)
        for (; row_head[row_lvl] != timer_list[row_lvl].prev;
 80138f6:	0bf7      	bt      	0x80138e4	// 80138e4 <rt_timer_start+0x3c>

    /* Interestingly, this super simple timer insert counter works very very
     * well on distributing the list height uniformly. By means of "very very
     * well", I mean it beats the randomness of timer->timeout_tick very easily
     * (actually, the timeout_tick is not random and easy to be attacked). */
    random_nr++;
 80138f8:	100a      	lrw      	r0, 0x20035a88	// 8013920 <rt_timer_start+0x78>
    l->next->prev = n;
 80138fa:	b1a1      	st.w      	r5, (r1, 0x4)
 80138fc:	9060      	ld.w      	r3, (r0, 0x0)
    n->next = l->next;
 80138fe:	b425      	st.w      	r1, (r4, 0x14)
 8013900:	2300      	addi      	r3, 1
    l->next = n;
 8013902:	b2a0      	st.w      	r5, (r2, 0x0)
 8013904:	b060      	st.w      	r3, (r0, 0x0)
        /* Shift over the bits we have tested. Works well with 1 bit and 2
         * bits. */
        tst_nr >>= (RT_TIMER_SKIP_LIST_MASK + 1) >> 1;
    }

    timer->parent.flag |= RT_TIMER_FLAG_ACTIVATED;
 8013906:	8469      	ld.b      	r3, (r4, 0x9)
 8013908:	ec630001 	ori      	r3, r3, 1

    /* enable interrupt */
    rt_hw_interrupt_enable(level);
 801390c:	6c1b      	mov      	r0, r6
    n->prev = l;
 801390e:	b446      	st.w      	r2, (r4, 0x18)
    timer->parent.flag |= RT_TIMER_FLAG_ACTIVATED;
 8013910:	a469      	st.b      	r3, (r4, 0x9)
    rt_hw_interrupt_enable(level);
 8013912:	e3ffe66c 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
        }
    }
#endif

    return RT_EOK;
}
 8013916:	3000      	movi      	r0, 0
 8013918:	1493      	pop      	r4-r6, r15
 801391a:	0000      	.short	0x0000
 801391c:	20035a8c 	.long	0x20035a8c
 8013920:	20035a88 	.long	0x20035a88

08013924 <rt_timer_stop>:
 * @param timer the timer to be stopped
 *
 * @return the operation status, RT_EOK on OK, -RT_ERROR on error
 */
rt_err_t rt_timer_stop(rt_timer_t timer)
{
 8013924:	14d1      	push      	r4, r15

    /* timer check */
    RT_ASSERT(timer != RT_NULL);
    RT_ASSERT(rt_object_get_type(&timer->parent) == RT_Object_Class_Timer);

    if (!(timer->parent.flag & RT_TIMER_FLAG_ACTIVATED))
 8013926:	8069      	ld.b      	r3, (r0, 0x9)
 8013928:	e4632001 	andi      	r3, r3, 1
{
 801392c:	6d03      	mov      	r4, r0
    if (!(timer->parent.flag & RT_TIMER_FLAG_ACTIVATED))
 801392e:	e9030014 	bez      	r3, 0x8013956	// 8013956 <rt_timer_stop+0x32>
        return -RT_ERROR;

    RT_OBJECT_HOOK_CALL(rt_object_put_hook, (&(timer->parent)));

    /* disable interrupt */
    level = rt_hw_interrupt_disable();
 8013932:	e3ffe657 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    n->next->prev = n->prev;
 8013936:	9445      	ld.w      	r2, (r4, 0x14)
 8013938:	9426      	ld.w      	r1, (r4, 0x18)
 801393a:	b221      	st.w      	r1, (r2, 0x4)
    n->prev->next = n->next;
 801393c:	9426      	ld.w      	r1, (r4, 0x18)
        rt_list_remove(&timer->row[i]);
 801393e:	e4640013 	addi      	r3, r4, 20
 8013942:	b140      	st.w      	r2, (r1, 0x0)
    n->next = n->prev = n;
 8013944:	b466      	st.w      	r3, (r4, 0x18)
 8013946:	b465      	st.w      	r3, (r4, 0x14)

    _rt_timer_remove(timer);
    /* change status */
    timer->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
 8013948:	8469      	ld.b      	r3, (r4, 0x9)
 801394a:	3b80      	bclri      	r3, 0
 801394c:	a469      	st.b      	r3, (r4, 0x9)

    /* enable interrupt */
    rt_hw_interrupt_enable(level);
 801394e:	e3ffe64e 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

    return RT_EOK;
 8013952:	3000      	movi      	r0, 0
}
 8013954:	1491      	pop      	r4, r15
        return -RT_ERROR;
 8013956:	3000      	movi      	r0, 0
 8013958:	2800      	subi      	r0, 1
}
 801395a:	1491      	pop      	r4, r15

0801395c <rt_timer_control>:
 * @param arg the argument
 *
 * @return RT_EOK
 */
rt_err_t rt_timer_control(rt_timer_t timer, int cmd, void *arg)
{
 801395c:	14d3      	push      	r4-r6, r15
 801395e:	6d07      	mov      	r4, r1
 8013960:	6d43      	mov      	r5, r0
 8013962:	6d8b      	mov      	r6, r2

    /* timer check */
    RT_ASSERT(timer != RT_NULL);
    RT_ASSERT(rt_object_get_type(&timer->parent) == RT_Object_Class_Timer);

    level = rt_hw_interrupt_disable();
 8013964:	e3ffe63e 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
    switch (cmd)
 8013968:	3c04      	cmphsi      	r4, 5
 801396a:	080f      	bt      	0x8013988	// 8013988 <rt_timer_control+0x2c>
 801396c:	1062      	lrw      	r3, 0x8015a80	// 8013974 <rt_timer_control+0x18>
 801396e:	d0830883 	ldr.w      	r3, (r3, r4 << 2)
 8013972:	780c      	jmp      	r3
 8013974:	08015a80 	.long	0x08015a80
    case RT_TIMER_CTRL_SET_PERIODIC:
        timer->parent.flag |= RT_TIMER_FLAG_PERIODIC;
        break;

    case RT_TIMER_CTRL_GET_STATE:
        if(timer->parent.flag & RT_TIMER_FLAG_ACTIVATED)
 8013978:	8569      	ld.b      	r3, (r5, 0x9)
 801397a:	e4632001 	andi      	r3, r3, 1
        {
            /*timer is start and run*/
            *(rt_tick_t *)arg = RT_TIMER_FLAG_ACTIVATED;
 801397e:	3b40      	cmpnei      	r3, 0
 8013980:	3201      	movi      	r2, 1
 8013982:	c4620c40 	inct      	r3, r2, 0
 8013986:	b660      	st.w      	r3, (r6, 0x0)
        break;

    default:
        break;
    }
    rt_hw_interrupt_enable(level);
 8013988:	e3ffe631 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

    return RT_EOK;
}
 801398c:	3000      	movi      	r0, 0
 801398e:	1493      	pop      	r4-r6, r15
        timer->parent.flag |= RT_TIMER_FLAG_PERIODIC;
 8013990:	8569      	ld.b      	r3, (r5, 0x9)
 8013992:	ec630002 	ori      	r3, r3, 2
 8013996:	a569      	st.b      	r3, (r5, 0x9)
    rt_hw_interrupt_enable(level);
 8013998:	e3ffe629 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 801399c:	3000      	movi      	r0, 0
 801399e:	1493      	pop      	r4-r6, r15
        timer->init_tick = *(rt_tick_t *)arg;
 80139a0:	9660      	ld.w      	r3, (r6, 0x0)
 80139a2:	b569      	st.w      	r3, (r5, 0x24)
    rt_hw_interrupt_enable(level);
 80139a4:	e3ffe623 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 80139a8:	3000      	movi      	r0, 0
 80139aa:	1493      	pop      	r4-r6, r15
        *(rt_tick_t *)arg = timer->init_tick;
 80139ac:	9569      	ld.w      	r3, (r5, 0x24)
 80139ae:	b660      	st.w      	r3, (r6, 0x0)
    rt_hw_interrupt_enable(level);
 80139b0:	e3ffe61d 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 80139b4:	3000      	movi      	r0, 0
 80139b6:	1493      	pop      	r4-r6, r15
        timer->parent.flag &= ~RT_TIMER_FLAG_PERIODIC;
 80139b8:	8569      	ld.b      	r3, (r5, 0x9)
 80139ba:	3b81      	bclri      	r3, 1
 80139bc:	a569      	st.b      	r3, (r5, 0x9)
    rt_hw_interrupt_enable(level);
 80139be:	e3ffe616 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>
}
 80139c2:	3000      	movi      	r0, 0
 80139c4:	1493      	pop      	r4-r6, r15
	...

080139c8 <rt_timer_check>:
 * corresponding timeout function will be invoked.
 *
 * @note this function shall be invoked in operating system timer interrupt.
 */
void rt_timer_check(void)
{
 80139c8:	14d7      	push      	r4-r10, r15
 80139ca:	1422      	subi      	r14, r14, 8
    l->next = l->prev = l;
 80139cc:	6dbb      	mov      	r6, r14

        /*
         * It supposes that the new tick shall less than the half duration of
         * tick max.
         */
        if ((current_tick - t->timeout_tick) < RT_TICK_MAX / 2)
 80139ce:	c7c05028 	bmaski      	r8, 31
 80139d2:	ddc62001 	st.w      	r14, (r6, 0x4)
 80139d6:	ddc62000 	st.w      	r14, (r6, 0x0)
    current_tick = rt_tick_get();
 80139da:	e3fff52d 	bsr      	0x8012434	// 8012434 <rt_tick_get>
 80139de:	6dc3      	mov      	r7, r0
    level = rt_hw_interrupt_disable();
 80139e0:	e3ffe600 	bsr      	0x80105e0	// 80105e0 <rt_hw_interrupt_disable>
 80139e4:	6e43      	mov      	r9, r0
 80139e6:	ea8a0023 	lrw      	r10, 0x20035a8c	// 8013a70 <rt_timer_check+0xa8>
        if ((current_tick - t->timeout_tick) < RT_TICK_MAX / 2)
 80139ea:	e5081000 	subi      	r8, r8, 1
    return l->next == l;
 80139ee:	d88a2000 	ld.w      	r4, (r10, 0x0)
    while (!rt_list_isempty(&rt_timer_list[RT_TIMER_SKIP_LIST_LEVEL - 1]))
 80139f2:	6692      	cmpne      	r4, r10
 80139f4:	0c38      	bf      	0x8013a64	// 8013a64 <rt_timer_check+0x9c>
        t = rt_list_entry(rt_timer_list[RT_TIMER_SKIP_LIST_LEVEL - 1].next,
 80139f6:	e4a41013 	subi      	r5, r4, 20
        if ((current_tick - t->timeout_tick) < RT_TICK_MAX / 2)
 80139fa:	956a      	ld.w      	r3, (r5, 0x28)
 80139fc:	61ce      	subu      	r7, r3
 80139fe:	65e0      	cmphs      	r8, r7
 8013a00:	0c32      	bf      	0x8013a64	// 8013a64 <rt_timer_check+0x9c>
    n->next->prev = n->prev;
 8013a02:	9565      	ld.w      	r3, (r5, 0x14)
 8013a04:	9546      	ld.w      	r2, (r5, 0x18)
 8013a06:	b341      	st.w      	r2, (r3, 0x4)
    n->prev->next = n->next;
 8013a08:	9546      	ld.w      	r2, (r5, 0x18)
 8013a0a:	b260      	st.w      	r3, (r2, 0x0)
        {
            RT_OBJECT_HOOK_CALL(rt_timer_enter_hook, (t));

            /* remove timer from timer list firstly */
            _rt_timer_remove(t);
            if (!(t->parent.flag & RT_TIMER_FLAG_PERIODIC))
 8013a0c:	8569      	ld.b      	r3, (r5, 0x9)
 8013a0e:	e4432002 	andi      	r2, r3, 2
    n->next = n->prev = n;
 8013a12:	b586      	st.w      	r4, (r5, 0x18)
 8013a14:	b585      	st.w      	r4, (r5, 0x14)
 8013a16:	e9220004 	bnez      	r2, 0x8013a1e	// 8013a1e <rt_timer_check+0x56>
            {
                t->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
 8013a1a:	3b80      	bclri      	r3, 0
 8013a1c:	a569      	st.b      	r3, (r5, 0x9)
    l->next->prev = n;
 8013a1e:	9660      	ld.w      	r3, (r6, 0x0)
            }
            /* add timer to temporary list  */
            rt_list_insert_after(&list, &(t->row[RT_TIMER_SKIP_LIST_LEVEL - 1]));
            /* call timeout function */
            t->timeout_func(t->parameter);
 8013a20:	9508      	ld.w      	r0, (r5, 0x20)
 8013a22:	b381      	st.w      	r4, (r3, 0x4)
    n->next = l->next;
 8013a24:	b460      	st.w      	r3, (r4, 0x0)
    n->prev = l;
 8013a26:	b4c1      	st.w      	r6, (r4, 0x4)
 8013a28:	9567      	ld.w      	r3, (r5, 0x1c)
    l->next = n;
 8013a2a:	b680      	st.w      	r4, (r6, 0x0)
 8013a2c:	7bcd      	jsr      	r3

            /* re-get tick */
            current_tick = rt_tick_get();
 8013a2e:	e3fff503 	bsr      	0x8012434	// 8012434 <rt_tick_get>

            RT_OBJECT_HOOK_CALL(rt_timer_exit_hook, (t));
            RT_DEBUG_LOG(RT_DEBUG_TIMER, ("current tick: %d\n", current_tick));

            /* Check whether the timer object is detached or started again */
            if (rt_list_isempty(&list))
 8013a32:	9660      	ld.w      	r3, (r6, 0x0)
 8013a34:	658e      	cmpne      	r3, r6
            current_tick = rt_tick_get();
 8013a36:	6dc3      	mov      	r7, r0
            if (rt_list_isempty(&list))
 8013a38:	0fdb      	bf      	0x80139ee	// 80139ee <rt_timer_check+0x26>
    n->next->prev = n->prev;
 8013a3a:	9460      	ld.w      	r3, (r4, 0x0)
 8013a3c:	9441      	ld.w      	r2, (r4, 0x4)
 8013a3e:	b341      	st.w      	r2, (r3, 0x4)
    n->prev->next = n->next;
 8013a40:	9441      	ld.w      	r2, (r4, 0x4)
 8013a42:	b260      	st.w      	r3, (r2, 0x0)
    n->next = n->prev = n;
 8013a44:	b481      	st.w      	r4, (r4, 0x4)
 8013a46:	b480      	st.w      	r4, (r4, 0x0)
            {
                continue;
            }
            rt_list_remove(&(t->row[RT_TIMER_SKIP_LIST_LEVEL - 1]));
            if ((t->parent.flag & RT_TIMER_FLAG_PERIODIC) &&
 8013a48:	8569      	ld.b      	r3, (r5, 0x9)
 8013a4a:	e4432003 	andi      	r2, r3, 3
 8013a4e:	3a43      	cmpnei      	r2, 3
 8013a50:	0bcf      	bt      	0x80139ee	// 80139ee <rt_timer_check+0x26>
                (t->parent.flag & RT_TIMER_FLAG_ACTIVATED))
            {
                /* start it */
                t->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
 8013a52:	3b80      	bclri      	r3, 0
 8013a54:	a569      	st.b      	r3, (r5, 0x9)
                rt_timer_start(t);
 8013a56:	6c17      	mov      	r0, r5
 8013a58:	e3ffff28 	bsr      	0x80138a8	// 80138a8 <rt_timer_start>
    return l->next == l;
 8013a5c:	d88a2000 	ld.w      	r4, (r10, 0x0)
    while (!rt_list_isempty(&rt_timer_list[RT_TIMER_SKIP_LIST_LEVEL - 1]))
 8013a60:	6692      	cmpne      	r4, r10
 8013a62:	0bca      	bt      	0x80139f6	// 80139f6 <rt_timer_check+0x2e>
        }
        else break;
    }

    /* enable interrupt */
    rt_hw_interrupt_enable(level);
 8013a64:	6c27      	mov      	r0, r9
 8013a66:	e3ffe5c2 	bsr      	0x80105ea	// 80105ea <rt_hw_interrupt_enable>

    RT_DEBUG_LOG(RT_DEBUG_TIMER, ("timer check leave\n"));
}
 8013a6a:	1402      	addi      	r14, r14, 8
 8013a6c:	1497      	pop      	r4-r10, r15
 8013a6e:	0000      	.short	0x0000
 8013a70:	20035a8c 	.long	0x20035a8c

08013a74 <rt_system_timer_init>:
    l->next = l->prev = l;
 8013a74:	1062      	lrw      	r3, 0x20035a8c	// 8013a7c <rt_system_timer_init+0x8>
 8013a76:	b360      	st.w      	r3, (r3, 0x0)
 8013a78:	b361      	st.w      	r3, (r3, 0x4)

    for (i = 0; i < sizeof(rt_timer_list) / sizeof(rt_timer_list[0]); i++)
    {
        rt_list_init(rt_timer_list + i);
    }
}
 8013a7a:	783c      	jmp      	r15
 8013a7c:	20035a8c 	.long	0x20035a8c

08013a80 <rt_system_timer_thread_init>:
                   10);

    /* startup */
    rt_thread_startup(&timer_thread);
#endif
}
 8013a80:	783c      	jmp      	r15
	...

08013a84 <SystemInit>:
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 8013a84:	106a      	lrw      	r3, 0x20000000	// 8013aac <SystemInit+0x28>
 8013a86:	c0036421 	mtcr      	r3, cr<1, 0>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8013a8a:	c01f6023 	mfcr      	r3, cr<31, 0>
    /* 801 not supported */
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 8013a8e:	ec630010 	ori      	r3, r3, 16
  \details Assigns the given value to the CHR.
  \param [in]    chr  CHR value to set
 */
__ALWAYS_STATIC_INLINE void __set_CHR(uint32_t chr)
{
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8013a92:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 8013a96:	1047      	lrw      	r2, 0xe000e100	// 8013ab0 <SystemInit+0x2c>
 8013a98:	3300      	movi      	r3, 0
 8013a9a:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 8013a9e:	2b00      	subi      	r3, 1
 8013aa0:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
 8013aa4:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8013aa8:	783c      	jmp      	r15
 8013aaa:	0000      	.short	0x0000
 8013aac:	20000000 	.long	0x20000000
 8013ab0:	e000e100 	.long	0xe000e100

08013ab4 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8013ab4:	14d4      	push      	r4-r7, r15
 8013ab6:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8013ab8:	c0006021 	mfcr      	r1, cr<0, 0>
 8013abc:	4930      	lsri      	r1, r1, 16
 8013abe:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8013ac0:	1018      	lrw      	r0, 0x8015a94	// 8013b20 <trap_c+0x6c>
 8013ac2:	e0000c33 	bsr      	0x8015328	// 8015328 <wm_printf>
    printf("\n");
 8013ac6:	300a      	movi      	r0, 10
 8013ac8:	e3ffef50 	bsr      	0x8011968	// 8011968 <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8013acc:	9540      	ld.w      	r2, (r5, 0x0)
 8013ace:	3100      	movi      	r1, 0
 8013ad0:	1015      	lrw      	r0, 0x8015aa8	// 8013b24 <trap_c+0x70>
 8013ad2:	e0000c2b 	bsr      	0x8015328	// 8015328 <wm_printf>
    for (i = 0; i < 16; i++) {
 8013ad6:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 8013ad8:	10f3      	lrw      	r7, 0x8015aa8	// 8013b24 <trap_c+0x70>

        if ((i % 5) == 4) {
 8013ada:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8013adc:	2400      	addi      	r4, 1
 8013ade:	3c50      	cmpnei      	r4, 16
 8013ae0:	0c13      	bf      	0x8013b06	// 8013b06 <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8013ae2:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8013ae6:	6c53      	mov      	r1, r4
 8013ae8:	6c1f      	mov      	r0, r7
 8013aea:	e0000c1f 	bsr      	0x8015328	// 8015328 <wm_printf>
        if ((i % 5) == 4) {
 8013aee:	c4c48043 	divs      	r3, r4, r6
 8013af2:	7cd8      	mult      	r3, r6
 8013af4:	5c6d      	subu      	r3, r4, r3
 8013af6:	3b44      	cmpnei      	r3, 4
 8013af8:	0bf2      	bt      	0x8013adc	// 8013adc <trap_c+0x28>
            printf("\n");
 8013afa:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 8013afc:	2400      	addi      	r4, 1
            printf("\n");
 8013afe:	e3ffef35 	bsr      	0x8011968	// 8011968 <__GI_putchar>
    for (i = 0; i < 16; i++) {
 8013b02:	3c50      	cmpnei      	r4, 16
 8013b04:	0bef      	bt      	0x8013ae2	// 8013ae2 <trap_c+0x2e>
        }
    }

    printf("\n");
 8013b06:	300a      	movi      	r0, 10
 8013b08:	e3ffef30 	bsr      	0x8011968	// 8011968 <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8013b0c:	9530      	ld.w      	r1, (r5, 0x40)
 8013b0e:	1007      	lrw      	r0, 0x8015ab4	// 8013b28 <trap_c+0x74>
 8013b10:	e0000c0c 	bsr      	0x8015328	// 8015328 <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8013b14:	9531      	ld.w      	r1, (r5, 0x44)
 8013b16:	1006      	lrw      	r0, 0x8015ac0	// 8013b2c <trap_c+0x78>
 8013b18:	e0000c08 	bsr      	0x8015328	// 8015328 <wm_printf>
 8013b1c:	0400      	br      	0x8013b1c	// 8013b1c <trap_c+0x68>
 8013b1e:	0000      	.short	0x0000
 8013b20:	08015a94 	.long	0x08015a94
 8013b24:	08015aa8 	.long	0x08015aa8
 8013b28:	08015ab4 	.long	0x08015ab4
 8013b2c:	08015ac0 	.long	0x08015ac0

08013b30 <board_init>:
    //uart1_io_init();
    /* use uart1 as log output io */
	//uart1Init(115200);
#endif

}
 8013b30:	783c      	jmp      	r15
	...

08013b34 <_out_buffer>:
typedef void (*out_fct_type)(char character, void* buffer, size_t idx, size_t maxlen);

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
  if (idx < maxlen) {
 8013b34:	64c8      	cmphs      	r2, r3
 8013b36:	0803      	bt      	0x8013b3c	// 8013b3c <_out_buffer+0x8>
    ((char*)buffer)[idx] = character;
 8013b38:	d4410020 	str.b      	r0, (r1, r2 << 0)
  }
}
 8013b3c:	783c      	jmp      	r15
	...

08013b40 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 8013b40:	783c      	jmp      	r15
	...

08013b44 <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 8013b44:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013b48:	6e4f      	mov      	r9, r3
 8013b4a:	da0e200e 	ld.w      	r16, (r14, 0x38)
 8013b4e:	986b      	ld.w      	r3, (r14, 0x2c)
 8013b50:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8013b54:	e4702003 	andi      	r3, r16, 3
{
 8013b58:	6dc3      	mov      	r7, r0
 8013b5a:	6e07      	mov      	r8, r1
 8013b5c:	6e8b      	mov      	r10, r2
 8013b5e:	98ac      	ld.w      	r5, (r14, 0x30)
 8013b60:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8013b64:	e9230010 	bnez      	r3, 0x8013b84	// 8013b84 <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 8013b68:	66d4      	cmphs      	r5, r11
 8013b6a:	080d      	bt      	0x8013b84	// 8013b84 <_out_rev+0x40>
 8013b6c:	c4ab0086 	subu      	r6, r11, r5
 8013b70:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 8013b72:	5a82      	addi      	r4, r2, 1
 8013b74:	6ce7      	mov      	r3, r9
 8013b76:	6c63      	mov      	r1, r8
 8013b78:	3020      	movi      	r0, 32
 8013b7a:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 8013b7c:	6592      	cmpne      	r4, r6
 8013b7e:	6c93      	mov      	r2, r4
 8013b80:	0bf9      	bt      	0x8013b72	// 8013b72 <_out_rev+0x2e>
 8013b82:	0402      	br      	0x8013b86	// 8013b86 <_out_rev+0x42>
 8013b84:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 8013b86:	e905002a 	bez      	r5, 0x8013bda	// 8013bda <_out_rev+0x96>
 8013b8a:	5dc3      	subi      	r6, r5, 1
 8013b8c:	c4114823 	lsli      	r3, r17, 0
 8013b90:	60d8      	addu      	r3, r6
 8013b92:	6d8f      	mov      	r6, r3
 8013b94:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 8013b96:	e6240000 	addi      	r17, r4, 1
 8013b9a:	6c93      	mov      	r2, r4
 8013b9c:	8600      	ld.b      	r0, (r6, 0x0)
 8013b9e:	6ce7      	mov      	r3, r9
 8013ba0:	6c63      	mov      	r1, r8
 8013ba2:	c4114824 	lsli      	r4, r17, 0
 8013ba6:	7bdd      	jsr      	r7
  while (len) {
 8013ba8:	6552      	cmpne      	r4, r5
 8013baa:	2e00      	subi      	r6, 1
 8013bac:	0bf5      	bt      	0x8013b96	// 8013b96 <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 8013bae:	e6102002 	andi      	r16, r16, 2
 8013bb2:	e9100011 	bez      	r16, 0x8013bd4	// 8013bd4 <_out_rev+0x90>
    while (idx - start_idx < width) {
 8013bb6:	c5450083 	subu      	r3, r5, r10
 8013bba:	66cc      	cmphs      	r3, r11
 8013bbc:	080c      	bt      	0x8013bd4	// 8013bd4 <_out_rev+0x90>
 8013bbe:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 8013bc0:	2500      	addi      	r5, 1
 8013bc2:	6ce7      	mov      	r3, r9
 8013bc4:	6c63      	mov      	r1, r8
 8013bc6:	3020      	movi      	r0, 32
 8013bc8:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 8013bca:	c5450083 	subu      	r3, r5, r10
 8013bce:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8013bd0:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 8013bd2:	0ff7      	bf      	0x8013bc0	// 8013bc0 <_out_rev+0x7c>
    }
  }

  return idx;
}
 8013bd4:	6c17      	mov      	r0, r5
 8013bd6:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 8013bda:	6d53      	mov      	r5, r4
 8013bdc:	07e9      	br      	0x8013bae	// 8013bae <_out_rev+0x6a>
	...

08013be0 <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013be0:	14d1      	push      	r4, r15
 8013be2:	1424      	subi      	r14, r14, 16
 8013be4:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 8013be8:	da8e200c 	ld.w      	r20, (r14, 0x30)
 8013bec:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8013bf0:	e5b42002 	andi      	r13, r20, 2
{
 8013bf4:	dace2006 	ld.w      	r22, (r14, 0x18)
 8013bf8:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013bfc:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8013c00:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 8013c04:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 8013c08:	e92d0039 	bnez      	r13, 0x8013c7a	// 8013c7a <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8013c0c:	e9320071 	bnez      	r18, 0x8013cee	// 8013cee <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c10:	c66c0420 	cmphs      	r12, r19
 8013c14:	0833      	bt      	0x8013c7a	// 8013c7a <_ntoa_format+0x9a>
 8013c16:	eb0c001f 	cmphsi      	r12, 32
 8013c1a:	e7142001 	andi      	r24, r20, 1
 8013c1e:	082e      	bt      	0x8013c7a	// 8013c7a <_ntoa_format+0x9a>
 8013c20:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8013c24:	ea150030 	movi      	r21, 48
 8013c28:	0406      	br      	0x8013c34	// 8013c34 <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c2a:	eb4c0020 	cmpnei      	r12, 32
 8013c2e:	e5ad0000 	addi      	r13, r13, 1
 8013c32:	0c08      	bf      	0x8013c42	// 8013c42 <_ntoa_format+0x62>
      buf[len++] = '0';
 8013c34:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c38:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 8013c3c:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c40:	0ff5      	bf      	0x8013c2a	// 8013c2a <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c42:	e918001c 	bez      	r24, 0x8013c7a	// 8013c7a <_ntoa_format+0x9a>
 8013c46:	c64c0420 	cmphs      	r12, r18
 8013c4a:	0818      	bt      	0x8013c7a	// 8013c7a <_ntoa_format+0x9a>
 8013c4c:	ea0d001f 	movi      	r13, 31
 8013c50:	6734      	cmphs      	r13, r12
 8013c52:	0c62      	bf      	0x8013d16	// 8013d16 <_ntoa_format+0x136>
 8013c54:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8013c58:	ea150030 	movi      	r21, 48
 8013c5c:	0406      	br      	0x8013c68	// 8013c68 <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c5e:	eb4c0020 	cmpnei      	r12, 32
 8013c62:	e5ad0000 	addi      	r13, r13, 1
 8013c66:	0c58      	bf      	0x8013d16	// 8013d16 <_ntoa_format+0x136>
      buf[len++] = '0';
 8013c68:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c6c:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 8013c70:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c74:	0bf5      	bt      	0x8013c5e	// 8013c5e <_ntoa_format+0x7e>
      buf[len++] = '0';
 8013c76:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 8013c7a:	e5b42010 	andi      	r13, r20, 16
 8013c7e:	e90d0019 	bez      	r13, 0x8013cb0	// 8013cb0 <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8013c82:	e5b42400 	andi      	r13, r20, 1024
 8013c86:	e92d0004 	bnez      	r13, 0x8013c8e	// 8013c8e <_ntoa_format+0xae>
 8013c8a:	e92c004e 	bnez      	r12, 0x8013d26	// 8013d26 <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c8e:	c4194824 	lsli      	r4, r25, 0
 8013c92:	3c50      	cmpnei      	r4, 16
 8013c94:	0c74      	bf      	0x8013d7c	// 8013d7c <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c96:	c4194824 	lsli      	r4, r25, 0
 8013c9a:	3c42      	cmpnei      	r4, 2
 8013c9c:	0c7e      	bf      	0x8013d98	// 8013d98 <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8013c9e:	eb0c001f 	cmphsi      	r12, 32
 8013ca2:	081a      	bt      	0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
      buf[len++] = '0';
 8013ca4:	ea0d0030 	movi      	r13, 48
 8013ca8:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013cac:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8013cb0:	eb0c001f 	cmphsi      	r12, 32
 8013cb4:	0811      	bt      	0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
    if (negative) {
 8013cb6:	e9370048 	bnez      	r23, 0x8013d46	// 8013d46 <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 8013cba:	e5b42004 	andi      	r13, r20, 4
 8013cbe:	e92d0056 	bnez      	r13, 0x8013d6a	// 8013d6a <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 8013cc2:	e5b42008 	andi      	r13, r20, 8
 8013cc6:	e90d0008 	bez      	r13, 0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
      buf[len++] = ' ';
 8013cca:	ea0d0020 	movi      	r13, 32
 8013cce:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013cd2:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013cd6:	de8e2003 	st.w      	r20, (r14, 0xc)
 8013cda:	de4e2002 	st.w      	r18, (r14, 0x8)
 8013cde:	dd8e2001 	st.w      	r12, (r14, 0x4)
 8013ce2:	dece2000 	st.w      	r22, (r14, 0x0)
 8013ce6:	e3ffff2f 	bsr      	0x8013b44	// 8013b44 <_out_rev>
}
 8013cea:	1404      	addi      	r14, r14, 16
 8013cec:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8013cee:	e7142001 	andi      	r24, r20, 1
 8013cf2:	e9180031 	bez      	r24, 0x8013d54	// 8013d54 <_ntoa_format+0x174>
 8013cf6:	e9370037 	bnez      	r23, 0x8013d64	// 8013d64 <_ntoa_format+0x184>
 8013cfa:	e5b4200c 	andi      	r13, r20, 12
 8013cfe:	e92d0033 	bnez      	r13, 0x8013d64	// 8013d64 <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013d02:	c66c0420 	cmphs      	r12, r19
 8013d06:	0ba0      	bt      	0x8013c46	// 8013c46 <_ntoa_format+0x66>
 8013d08:	ea0d001f 	movi      	r13, 31
 8013d0c:	6734      	cmphs      	r13, r12
 8013d0e:	0b89      	bt      	0x8013c20	// 8013c20 <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013d10:	c64c0420 	cmphs      	r12, r18
 8013d14:	0bb3      	bt      	0x8013c7a	// 8013c7a <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 8013d16:	e5b42010 	andi      	r13, r20, 16
 8013d1a:	e90dffde 	bez      	r13, 0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8013d1e:	e5b42400 	andi      	r13, r20, 1024
 8013d22:	e92dffb6 	bnez      	r13, 0x8013c8e	// 8013c8e <_ntoa_format+0xae>
 8013d26:	c5930480 	cmpne      	r19, r12
 8013d2a:	0c04      	bf      	0x8013d32	// 8013d32 <_ntoa_format+0x152>
 8013d2c:	c64c0480 	cmpne      	r12, r18
 8013d30:	0baf      	bt      	0x8013c8e	// 8013c8e <_ntoa_format+0xae>
      len--;
 8013d32:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 8013d36:	e90d0046 	bez      	r13, 0x8013dc2	// 8013dc2 <_ntoa_format+0x1e2>
 8013d3a:	c4194824 	lsli      	r4, r25, 0
 8013d3e:	3c50      	cmpnei      	r4, 16
 8013d40:	0c1c      	bf      	0x8013d78	// 8013d78 <_ntoa_format+0x198>
 8013d42:	6f37      	mov      	r12, r13
 8013d44:	07a9      	br      	0x8013c96	// 8013c96 <_ntoa_format+0xb6>
      buf[len++] = '-';
 8013d46:	ea0d002d 	movi      	r13, 45
 8013d4a:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013d4e:	e58c0000 	addi      	r12, r12, 1
 8013d52:	07c2      	br      	0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013d54:	c66c0420 	cmphs      	r12, r19
 8013d58:	0b91      	bt      	0x8013c7a	// 8013c7a <_ntoa_format+0x9a>
 8013d5a:	ea0d001f 	movi      	r13, 31
 8013d5e:	6734      	cmphs      	r13, r12
 8013d60:	0b60      	bt      	0x8013c20	// 8013c20 <_ntoa_format+0x40>
 8013d62:	078c      	br      	0x8013c7a	// 8013c7a <_ntoa_format+0x9a>
      width--;
 8013d64:	e6521000 	subi      	r18, r18, 1
 8013d68:	07cd      	br      	0x8013d02	// 8013d02 <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8013d6a:	ea0d002b 	movi      	r13, 43
 8013d6e:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013d72:	e58c0000 	addi      	r12, r12, 1
 8013d76:	07b0      	br      	0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
        len--;
 8013d78:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013d7c:	e5b42020 	andi      	r13, r20, 32
 8013d80:	e92d0016 	bnez      	r13, 0x8013dac	// 8013dac <_ntoa_format+0x1cc>
 8013d84:	eb0c001f 	cmphsi      	r12, 32
 8013d88:	0ba7      	bt      	0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
      buf[len++] = 'x';
 8013d8a:	ea0d0078 	movi      	r13, 120
 8013d8e:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013d92:	e58c0000 	addi      	r12, r12, 1
 8013d96:	0784      	br      	0x8013c9e	// 8013c9e <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013d98:	eb0c001f 	cmphsi      	r12, 32
 8013d9c:	0b9d      	bt      	0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
      buf[len++] = 'b';
 8013d9e:	ea0d0062 	movi      	r13, 98
 8013da2:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013da6:	e58c0000 	addi      	r12, r12, 1
 8013daa:	077a      	br      	0x8013c9e	// 8013c9e <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013dac:	ea0d001f 	movi      	r13, 31
 8013db0:	6734      	cmphs      	r13, r12
 8013db2:	0f92      	bf      	0x8013cd6	// 8013cd6 <_ntoa_format+0xf6>
      buf[len++] = 'X';
 8013db4:	ea0d0058 	movi      	r13, 88
 8013db8:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013dbc:	e58c0000 	addi      	r12, r12, 1
 8013dc0:	076f      	br      	0x8013c9e	// 8013c9e <_ntoa_format+0xbe>
 8013dc2:	6f37      	mov      	r12, r13
 8013dc4:	0765      	br      	0x8013c8e	// 8013c8e <_ntoa_format+0xae>
	...

08013dc8 <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013dc8:	14d3      	push      	r4-r6, r15
 8013dca:	142f      	subi      	r14, r14, 60
 8013dcc:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 8013dd0:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 8013dd4:	6d77      	mov      	r5, r13
 8013dd6:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 8013dda:	da8e2015 	ld.w      	r20, (r14, 0x54)
 8013dde:	6db7      	mov      	r6, r13
 8013de0:	db0e2018 	ld.w      	r24, (r14, 0x60)
 8013de4:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8013de8:	e92c000a 	bnez      	r12, 0x8013dfc	// 8013dfc <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 8013dec:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8013df0:	e7182400 	andi      	r24, r24, 1024
 8013df4:	e9380043 	bnez      	r24, 0x8013e7a	// 8013e7a <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 8013df8:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013dfc:	e5b82020 	andi      	r13, r24, 32
 8013e00:	eb4d0000 	cmpnei      	r13, 0
 8013e04:	ea170041 	movi      	r23, 65
 8013e08:	ea0d0061 	movi      	r13, 97
 8013e0c:	c6ed0c20 	incf      	r23, r13, 0
 8013e10:	e72e001b 	addi      	r25, r14, 28
 8013e14:	c4194832 	lsli      	r18, r25, 0
 8013e18:	ea150000 	movi      	r21, 0
 8013e1c:	e6f71009 	subi      	r23, r23, 10
 8013e20:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 8013e24:	c68c802d 	divu      	r13, r12, r20
 8013e28:	c68d8436 	mult      	r22, r13, r20
 8013e2c:	c6cc008c 	subu      	r12, r12, r22
 8013e30:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013e32:	eb0c0009 	cmphsi      	r12, 10
 8013e36:	e6b50000 	addi      	r21, r21, 1
 8013e3a:	081c      	bt      	0x8013e72	// 8013e72 <_ntoa_long+0xaa>
 8013e3c:	e58c002f 	addi      	r12, r12, 48
 8013e40:	7730      	zextb      	r12, r12
 8013e42:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 8013e46:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013e48:	e90d0006 	bez      	r13, 0x8013e54	// 8013e54 <_ntoa_long+0x8c>
 8013e4c:	e6520000 	addi      	r18, r18, 1
 8013e50:	e833ffea 	bnezad      	r19, 0x8013e24	// 8013e24 <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8013e54:	df0e2006 	st.w      	r24, (r14, 0x18)
 8013e58:	b8c5      	st.w      	r6, (r14, 0x14)
 8013e5a:	b8a4      	st.w      	r5, (r14, 0x10)
 8013e5c:	de8e2003 	st.w      	r20, (r14, 0xc)
 8013e60:	b882      	st.w      	r4, (r14, 0x8)
 8013e62:	deae2001 	st.w      	r21, (r14, 0x4)
 8013e66:	df2e2000 	st.w      	r25, (r14, 0x0)
 8013e6a:	e3fffebb 	bsr      	0x8013be0	// 8013be0 <_ntoa_format>
}
 8013e6e:	140f      	addi      	r14, r14, 60
 8013e70:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013e72:	c6ec002c 	addu      	r12, r12, r23
 8013e76:	7730      	zextb      	r12, r12
 8013e78:	07e5      	br      	0x8013e42	// 8013e42 <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 8013e7a:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 8013e7e:	c40c4835 	lsli      	r21, r12, 0
 8013e82:	e72e001b 	addi      	r25, r14, 28
 8013e86:	07e7      	br      	0x8013e54	// 8013e54 <_ntoa_long+0x8c>

08013e88 <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013e88:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013e8c:	1435      	subi      	r14, r14, 84
 8013e8e:	c4034831 	lsli      	r17, r3, 0
 8013e92:	d96e2020 	ld.w      	r11, (r14, 0x80)
 8013e96:	9965      	ld.w      	r3, (r14, 0x94)
 8013e98:	da0e2021 	ld.w      	r16, (r14, 0x84)
 8013e9c:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8013e9e:	c60b2424 	or      	r4, r11, r16
{
 8013ea2:	9966      	ld.w      	r3, (r14, 0x98)
 8013ea4:	b86c      	st.w      	r3, (r14, 0x30)
 8013ea6:	d86e0088 	ld.b      	r3, (r14, 0x88)
 8013eaa:	b807      	st.w      	r0, (r14, 0x1c)
 8013eac:	b828      	st.w      	r1, (r14, 0x20)
 8013eae:	b849      	st.w      	r2, (r14, 0x24)
 8013eb0:	99c3      	ld.w      	r6, (r14, 0x8c)
 8013eb2:	99e4      	ld.w      	r7, (r14, 0x90)
 8013eb4:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 8013eb8:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 8013eba:	e9240009 	bnez      	r4, 0x8013ecc	// 8013ecc <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8013ebe:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 8013ec2:	c48a2823 	bclri      	r3, r10, 4
 8013ec6:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 8013ec8:	e9220033 	bnez      	r2, 0x8013f2e	// 8013f2e <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013ecc:	e46a2020 	andi      	r3, r10, 32
 8013ed0:	3b40      	cmpnei      	r3, 0
 8013ed2:	ea080041 	movi      	r8, 65
 8013ed6:	3361      	movi      	r3, 97
 8013ed8:	c5030c20 	incf      	r8, r3, 0
 8013edc:	e52e0033 	addi      	r9, r14, 52
 8013ee0:	6d67      	mov      	r5, r9
 8013ee2:	3400      	movi      	r4, 0
 8013ee4:	e5081009 	subi      	r8, r8, 10
 8013ee8:	0415      	br      	0x8013f12	// 8013f12 <_ntoa_long_long+0x8a>
 8013eea:	202f      	addi      	r0, 48
 8013eec:	7400      	zextb      	r0, r0
 8013eee:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 8013ef0:	c4104821 	lsli      	r1, r16, 0
 8013ef4:	6c2f      	mov      	r0, r11
 8013ef6:	6c9b      	mov      	r2, r6
 8013ef8:	6cdf      	mov      	r3, r7
 8013efa:	e3ffe415 	bsr      	0x8010724	// 8010724 <__udivdi3>
 8013efe:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013f02:	6c40      	or      	r1, r0
      value /= base;
 8013f04:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013f06:	e9010016 	bez      	r1, 0x8013f32	// 8013f32 <_ntoa_long_long+0xaa>
 8013f0a:	eb440020 	cmpnei      	r4, 32
 8013f0e:	2500      	addi      	r5, 1
 8013f10:	0c11      	bf      	0x8013f32	// 8013f32 <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 8013f12:	6c9b      	mov      	r2, r6
 8013f14:	6cdf      	mov      	r3, r7
 8013f16:	6c2f      	mov      	r0, r11
 8013f18:	c4104821 	lsli      	r1, r16, 0
 8013f1c:	e3ffe59e 	bsr      	0x8010a58	// 8010a58 <__umoddi3>
 8013f20:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013f22:	3809      	cmphsi      	r0, 10
 8013f24:	2400      	addi      	r4, 1
 8013f26:	0fe2      	bf      	0x8013eea	// 8013eea <_ntoa_long_long+0x62>
 8013f28:	6020      	addu      	r0, r8
 8013f2a:	7400      	zextb      	r0, r0
 8013f2c:	07e1      	br      	0x8013eee	// 8013eee <_ntoa_long_long+0x66>
 8013f2e:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8013f32:	986c      	ld.w      	r3, (r14, 0x30)
 8013f34:	b865      	st.w      	r3, (r14, 0x14)
 8013f36:	986b      	ld.w      	r3, (r14, 0x2c)
 8013f38:	b864      	st.w      	r3, (r14, 0x10)
 8013f3a:	986a      	ld.w      	r3, (r14, 0x28)
 8013f3c:	b862      	st.w      	r3, (r14, 0x8)
 8013f3e:	dd4e2006 	st.w      	r10, (r14, 0x18)
 8013f42:	b8c3      	st.w      	r6, (r14, 0xc)
 8013f44:	b881      	st.w      	r4, (r14, 0x4)
 8013f46:	dd2e2000 	st.w      	r9, (r14, 0x0)
 8013f4a:	c4114823 	lsli      	r3, r17, 0
 8013f4e:	9849      	ld.w      	r2, (r14, 0x24)
 8013f50:	9828      	ld.w      	r1, (r14, 0x20)
 8013f52:	9807      	ld.w      	r0, (r14, 0x1c)
 8013f54:	e3fffe46 	bsr      	0x8013be0	// 8013be0 <_ntoa_format>
}
 8013f58:	1415      	addi      	r14, r14, 84
 8013f5a:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

08013f60 <_out_uart>:
{
 8013f60:	14d0      	push      	r15
    return uart_write(UART_ID_0, ch);
 8013f62:	6c43      	mov      	r1, r0
 8013f64:	3000      	movi      	r0, 0
 8013f66:	e3fff0ad 	bsr      	0x80120c0	// 80120c0 <uart_write>
}
 8013f6a:	1490      	pop      	r15

08013f6c <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013f6c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013f70:	1435      	subi      	r14, r14, 84
 8013f72:	6ecf      	mov      	r11, r3
 8013f74:	9962      	ld.w      	r3, (r14, 0x88)
 8013f76:	6e4f      	mov      	r9, r3
 8013f78:	9963      	ld.w      	r3, (r14, 0x8c)
 8013f7a:	9980      	ld.w      	r4, (r14, 0x80)
 8013f7c:	99a1      	ld.w      	r5, (r14, 0x84)
 8013f7e:	b865      	st.w      	r3, (r14, 0x14)
 8013f80:	9964      	ld.w      	r3, (r14, 0x90)
 8013f82:	6d83      	mov      	r6, r0
 8013f84:	6dc7      	mov      	r7, r1
 8013f86:	6e8b      	mov      	r10, r2
 8013f88:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 8013f8a:	6c93      	mov      	r2, r4
 8013f8c:	6cd7      	mov      	r3, r5
 8013f8e:	6c13      	mov      	r0, r4
 8013f90:	6c57      	mov      	r1, r5
 8013f92:	e3ffea19 	bsr      	0x80113c4	// 80113c4 <__nedf2>
 8013f96:	e920010c 	bnez      	r0, 0x80141ae	// 80141ae <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 8013f9a:	3200      	movi      	r2, 0
 8013f9c:	ea23fff0 	movih      	r3, 65520
 8013fa0:	2a00      	subi      	r2, 1
 8013fa2:	2b00      	subi      	r3, 1
 8013fa4:	6c13      	mov      	r0, r4
 8013fa6:	9921      	ld.w      	r1, (r14, 0x84)
 8013fa8:	e3ffea6a 	bsr      	0x801147c	// 801147c <__ltdf2>
 8013fac:	e980011b 	blz      	r0, 0x80141e2	// 80141e2 <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 8013fb0:	3200      	movi      	r2, 0
 8013fb2:	ea237ff0 	movih      	r3, 32752
 8013fb6:	2a00      	subi      	r2, 1
 8013fb8:	2b00      	subi      	r3, 1
 8013fba:	6c13      	mov      	r0, r4
 8013fbc:	9921      	ld.w      	r1, (r14, 0x84)
 8013fbe:	e3ffea1f 	bsr      	0x80113fc	// 80113fc <__gtdf2>
 8013fc2:	e960001d 	blsz      	r0, 0x8013ffc	// 8013ffc <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8013fc6:	9806      	ld.w      	r0, (r14, 0x18)
 8013fc8:	e4402004 	andi      	r2, r0, 4
 8013fcc:	3a40      	cmpnei      	r2, 0
 8013fce:	0137      	lrw      	r1, 0x8015cb4	// 80142ec <_ftoa+0x380>
 8013fd0:	0177      	lrw      	r3, 0x8015cac	// 80142f0 <_ftoa+0x384>
 8013fd2:	c4610c20 	incf      	r3, r1, 0
 8013fd6:	3a40      	cmpnei      	r2, 0
 8013fd8:	3103      	movi      	r1, 3
 8013fda:	3204      	movi      	r2, 4
 8013fdc:	c4410c20 	incf      	r2, r1, 0
 8013fe0:	9825      	ld.w      	r1, (r14, 0x14)
 8013fe2:	b803      	st.w      	r0, (r14, 0xc)
 8013fe4:	b822      	st.w      	r1, (r14, 0x8)
 8013fe6:	b841      	st.w      	r2, (r14, 0x4)
 8013fe8:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013fea:	6cef      	mov      	r3, r11
 8013fec:	6cab      	mov      	r2, r10
 8013fee:	6c5f      	mov      	r1, r7
 8013ff0:	6c1b      	mov      	r0, r6
 8013ff2:	e3fffda9 	bsr      	0x8013b44	// 8013b44 <_out_rev>
}
 8013ff6:	1415      	addi      	r14, r14, 84
 8013ff8:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8013ffc:	3200      	movi      	r2, 0
 8013ffe:	0261      	lrw      	r3, 0x41cdcd65	// 80142f4 <_ftoa+0x388>
 8014000:	6c13      	mov      	r0, r4
 8014002:	9921      	ld.w      	r1, (r14, 0x84)
 8014004:	e3ffe9fc 	bsr      	0x80113fc	// 80113fc <__gtdf2>
 8014008:	e94000dc 	bhz      	r0, 0x80141c0	// 80141c0 <_ftoa+0x254>
 801400c:	3200      	movi      	r2, 0
 801400e:	0264      	lrw      	r3, 0xc1cdcd65	// 80142f8 <_ftoa+0x38c>
 8014010:	6c13      	mov      	r0, r4
 8014012:	9921      	ld.w      	r1, (r14, 0x84)
 8014014:	e3ffea34 	bsr      	0x801147c	// 801147c <__ltdf2>
 8014018:	e98000d4 	blz      	r0, 0x80141c0	// 80141c0 <_ftoa+0x254>
  if (value < 0) {
 801401c:	3200      	movi      	r2, 0
 801401e:	6ccb      	mov      	r3, r2
 8014020:	6c13      	mov      	r0, r4
 8014022:	9921      	ld.w      	r1, (r14, 0x84)
 8014024:	e3ffea2c 	bsr      	0x801147c	// 801147c <__ltdf2>
 8014028:	e98001b0 	blz      	r0, 0x8014388	// 8014388 <_ftoa+0x41c>
  bool negative = false;
 801402c:	3300      	movi      	r3, 0
 801402e:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 8014030:	9866      	ld.w      	r3, (r14, 0x18)
 8014032:	e5a32400 	andi      	r13, r3, 1024
 8014036:	e92d0136 	bnez      	r13, 0x80142a2	// 80142a2 <_ftoa+0x336>
 801403a:	026e      	lrw      	r3, 0x412e8480	// 80142fc <_ftoa+0x390>
 801403c:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8014040:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014042:	ea080006 	movi      	r8, 6
 8014046:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 801404a:	6c57      	mov      	r1, r5
 801404c:	6c13      	mov      	r0, r4
 801404e:	de8e200b 	st.w      	r20, (r14, 0x2c)
 8014052:	ddae200a 	st.w      	r13, (r14, 0x28)
 8014056:	e3ffea63 	bsr      	0x801151c	// 801151c <__fixdfsi>
 801405a:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 801405c:	e3ffea2c 	bsr      	0x80114b4	// 80114b4 <__floatsidf>
 8014060:	6c83      	mov      	r2, r0
 8014062:	6cc7      	mov      	r3, r1
 8014064:	6c13      	mov      	r0, r4
 8014066:	6c57      	mov      	r1, r5
 8014068:	e3ffe804 	bsr      	0x8011070	// 8011070 <__subdf3>
 801406c:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8014070:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8014074:	6cb3      	mov      	r2, r12
 8014076:	9868      	ld.w      	r3, (r14, 0x20)
 8014078:	e3ffe81a 	bsr      	0x80110ac	// 80110ac <__muldf3>
 801407c:	c4014831 	lsli      	r17, r1, 0
 8014080:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 8014084:	e3ffe334 	bsr      	0x80106ec	// 80106ec <__fixunsdfsi>
 8014088:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 801408a:	e3ffea81 	bsr      	0x801158c	// 801158c <__floatunsidf>
 801408e:	6c83      	mov      	r2, r0
 8014090:	6cc7      	mov      	r3, r1
 8014092:	c4104820 	lsli      	r0, r16, 0
 8014096:	c4114821 	lsli      	r1, r17, 0
 801409a:	e3ffe7eb 	bsr      	0x8011070	// 8011070 <__subdf3>
  if (diff > 0.5) {
 801409e:	3200      	movi      	r2, 0
 80140a0:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 80140a4:	c4004830 	lsli      	r16, r0, 0
 80140a8:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 80140ac:	e3ffe9a8 	bsr      	0x80113fc	// 80113fc <__gtdf2>
 80140b0:	da4e2009 	ld.w      	r18, (r14, 0x24)
 80140b4:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 80140b8:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 80140bc:	e96000d3 	blsz      	r0, 0x8014262	// 8014262 <_ftoa+0x2f6>
    ++frac;
 80140c0:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 80140c4:	c4124820 	lsli      	r0, r18, 0
 80140c8:	de8e2009 	st.w      	r20, (r14, 0x24)
 80140cc:	c40d4831 	lsli      	r17, r13, 0
 80140d0:	c4124830 	lsli      	r16, r18, 0
 80140d4:	e3ffea5c 	bsr      	0x801158c	// 801158c <__floatunsidf>
 80140d8:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 80140dc:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 80140e0:	6cf7      	mov      	r3, r13
 80140e2:	6cb3      	mov      	r2, r12
 80140e4:	e3ffe9ac 	bsr      	0x801143c	// 801143c <__gedf2>
 80140e8:	c4104832 	lsli      	r18, r16, 0
 80140ec:	c411482d 	lsli      	r13, r17, 0
 80140f0:	da8e2009 	ld.w      	r20, (r14, 0x24)
 80140f4:	e9a0011f 	bhsz      	r0, 0x8014332	// 8014332 <_ftoa+0x3c6>
  if (prec == 0U) {
 80140f8:	e928007e 	bnez      	r8, 0x80141f4	// 80141f4 <_ftoa+0x288>
    diff = value - (double)whole;
 80140fc:	6c27      	mov      	r0, r9
 80140fe:	c4144831 	lsli      	r17, r20, 0
 8014102:	c40d4830 	lsli      	r16, r13, 0
 8014106:	e3ffe9d7 	bsr      	0x80114b4	// 80114b4 <__floatsidf>
 801410a:	6c83      	mov      	r2, r0
 801410c:	6cc7      	mov      	r3, r1
 801410e:	6c13      	mov      	r0, r4
 8014110:	6c57      	mov      	r1, r5
 8014112:	e3ffe7af 	bsr      	0x8011070	// 8011070 <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8014116:	6ca3      	mov      	r2, r8
 8014118:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 801411c:	6d03      	mov      	r4, r0
 801411e:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8014120:	e3ffe9ae 	bsr      	0x801147c	// 801147c <__ltdf2>
 8014124:	c410482d 	lsli      	r13, r16, 0
 8014128:	c4114834 	lsli      	r20, r17, 0
 801412c:	e98000f5 	blz      	r0, 0x8014316	// 8014316 <_ftoa+0x3aa>
 8014130:	e4692001 	andi      	r3, r9, 1
      ++whole;
 8014134:	3b40      	cmpnei      	r3, 0
 8014136:	c4690c20 	incf      	r3, r9, 0
 801413a:	c4690c41 	inct      	r3, r9, 1
 801413e:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8014140:	eb4d0020 	cmpnei      	r13, 32
 8014144:	0c81      	bf      	0x8014246	// 8014246 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 8014146:	300a      	movi      	r0, 10
 8014148:	c4098043 	divs      	r3, r9, r0
 801414c:	6d27      	mov      	r4, r9
 801414e:	c4038421 	mult      	r1, r3, r0
 8014152:	5c25      	subu      	r1, r4, r1
 8014154:	212f      	addi      	r1, 48
 8014156:	e44d0000 	addi      	r2, r13, 1
 801415a:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 801415e:	e9030013 	bez      	r3, 0x8014184	// 8014184 <_ftoa+0x218>
 8014162:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8014166:	eb420020 	cmpnei      	r2, 32
 801416a:	0c6e      	bf      	0x8014246	// 8014246 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 801416c:	c4038041 	divs      	r1, r3, r0
 8014170:	c401842d 	mult      	r13, r1, r0
 8014174:	60f6      	subu      	r3, r13
 8014176:	232f      	addi      	r3, 48
 8014178:	d40c8003 	stbi.b      	r3, (r12)
 801417c:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 801417e:	6cc7      	mov      	r3, r1
 8014180:	e921fff3 	bnez      	r1, 0x8014166	// 8014166 <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8014184:	9866      	ld.w      	r3, (r14, 0x18)
 8014186:	e4632003 	andi      	r3, r3, 3
 801418a:	3b41      	cmpnei      	r3, 1
 801418c:	0cda      	bf      	0x8014340	// 8014340 <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 801418e:	eb420020 	cmpnei      	r2, 32
 8014192:	0d27      	bf      	0x80143e0	// 80143e0 <_ftoa+0x474>
    if (negative) {
 8014194:	986c      	ld.w      	r3, (r14, 0x30)
 8014196:	e92300bb 	bnez      	r3, 0x801430c	// 801430c <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 801419a:	9866      	ld.w      	r3, (r14, 0x18)
 801419c:	e4632004 	andi      	r3, r3, 4
 80141a0:	e9030116 	bez      	r3, 0x80143cc	// 80143cc <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 80141a4:	312b      	movi      	r1, 43
 80141a6:	5a62      	addi      	r3, r2, 1
 80141a8:	d4540021 	str.b      	r1, (r20, r2 << 0)
 80141ac:	0453      	br      	0x8014252	// 8014252 <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 80141ae:	9866      	ld.w      	r3, (r14, 0x18)
 80141b0:	b863      	st.w      	r3, (r14, 0xc)
 80141b2:	9865      	ld.w      	r3, (r14, 0x14)
 80141b4:	b862      	st.w      	r3, (r14, 0x8)
 80141b6:	3303      	movi      	r3, 3
 80141b8:	b861      	st.w      	r3, (r14, 0x4)
 80141ba:	1272      	lrw      	r3, 0x8015cb8	// 8014300 <_ftoa+0x394>
 80141bc:	b860      	st.w      	r3, (r14, 0x0)
 80141be:	0716      	br      	0x8013fea	// 8013fea <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 80141c0:	9866      	ld.w      	r3, (r14, 0x18)
 80141c2:	b864      	st.w      	r3, (r14, 0x10)
 80141c4:	9865      	ld.w      	r3, (r14, 0x14)
 80141c6:	b863      	st.w      	r3, (r14, 0xc)
 80141c8:	dd2e2002 	st.w      	r9, (r14, 0x8)
 80141cc:	b880      	st.w      	r4, (r14, 0x0)
 80141ce:	b8a1      	st.w      	r5, (r14, 0x4)
 80141d0:	6cef      	mov      	r3, r11
 80141d2:	6cab      	mov      	r2, r10
 80141d4:	6c5f      	mov      	r1, r7
 80141d6:	6c1b      	mov      	r0, r6
 80141d8:	e0000116 	bsr      	0x8014404	// 8014404 <_etoa>
}
 80141dc:	1415      	addi      	r14, r14, 84
 80141de:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 80141e2:	9866      	ld.w      	r3, (r14, 0x18)
 80141e4:	b863      	st.w      	r3, (r14, 0xc)
 80141e6:	9865      	ld.w      	r3, (r14, 0x14)
 80141e8:	b862      	st.w      	r3, (r14, 0x8)
 80141ea:	3304      	movi      	r3, 4
 80141ec:	b861      	st.w      	r3, (r14, 0x4)
 80141ee:	1266      	lrw      	r3, 0x8015cbc	// 8014304 <_ftoa+0x398>
 80141f0:	b860      	st.w      	r3, (r14, 0x0)
 80141f2:	06fc      	br      	0x8013fea	// 8013fea <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80141f4:	eb4d0020 	cmpnei      	r13, 32
 80141f8:	0c27      	bf      	0x8014246	// 8014246 <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 80141fa:	300a      	movi      	r0, 10
 80141fc:	c4128023 	divu      	r3, r18, r0
 8014200:	c4038421 	mult      	r1, r3, r0
 8014204:	c4320092 	subu      	r18, r18, r1
 8014208:	e652002f 	addi      	r18, r18, 48
      --count;
 801420c:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8014210:	e44d0000 	addi      	r2, r13, 1
 8014214:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 8014218:	e90300c3 	bez      	r3, 0x801439e	// 801439e <_ftoa+0x432>
 801421c:	c454002d 	addu      	r13, r20, r2
 8014220:	0410      	br      	0x8014240	// 8014240 <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 8014222:	c4038021 	divu      	r1, r3, r0
 8014226:	c4018432 	mult      	r18, r1, r0
 801422a:	c6430083 	subu      	r3, r3, r18
 801422e:	232f      	addi      	r3, 48
 8014230:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 8014234:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8014238:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 801423a:	6cc7      	mov      	r3, r1
 801423c:	e90100b1 	bez      	r1, 0x801439e	// 801439e <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8014240:	eb420020 	cmpnei      	r2, 32
 8014244:	0bef      	bt      	0x8014222	// 8014222 <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8014246:	9866      	ld.w      	r3, (r14, 0x18)
 8014248:	e4632003 	andi      	r3, r3, 3
 801424c:	3b41      	cmpnei      	r3, 1
 801424e:	0c78      	bf      	0x801433e	// 801433e <_ftoa+0x3d2>
 8014250:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8014252:	9846      	ld.w      	r2, (r14, 0x18)
 8014254:	b843      	st.w      	r2, (r14, 0xc)
 8014256:	9845      	ld.w      	r2, (r14, 0x14)
 8014258:	b842      	st.w      	r2, (r14, 0x8)
 801425a:	b861      	st.w      	r3, (r14, 0x4)
 801425c:	de8e2000 	st.w      	r20, (r14, 0x0)
 8014260:	06c5      	br      	0x8013fea	// 8013fea <_ftoa+0x7e>
  else if (diff < 0.5) {
 8014262:	3200      	movi      	r2, 0
 8014264:	ea233fe0 	movih      	r3, 16352
 8014268:	c4104820 	lsli      	r0, r16, 0
 801426c:	c4114821 	lsli      	r1, r17, 0
 8014270:	de8e200a 	st.w      	r20, (r14, 0x28)
 8014274:	de4e2009 	st.w      	r18, (r14, 0x24)
 8014278:	ddae2007 	st.w      	r13, (r14, 0x1c)
 801427c:	e3ffe900 	bsr      	0x801147c	// 801147c <__ltdf2>
 8014280:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 8014284:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8014288:	da8e200a 	ld.w      	r20, (r14, 0x28)
 801428c:	e980ff36 	blz      	r0, 0x80140f8	// 80140f8 <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 8014290:	e9120006 	bez      	r18, 0x801429c	// 801429c <_ftoa+0x330>
 8014294:	e4722001 	andi      	r3, r18, 1
 8014298:	e903ff30 	bez      	r3, 0x80140f8	// 80140f8 <_ftoa+0x18c>
    ++frac;
 801429c:	e6520000 	addi      	r18, r18, 1
 80142a0:	072c      	br      	0x80140f8	// 80140f8 <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80142a2:	6ce7      	mov      	r3, r9
 80142a4:	3b09      	cmphsi      	r3, 10
 80142a6:	0c9f      	bf      	0x80143e4	// 80143e4 <_ftoa+0x478>
    buf[len++] = '0';
 80142a8:	e68e0033 	addi      	r20, r14, 52
 80142ac:	3030      	movi      	r0, 48
 80142ae:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 80142b2:	e5091000 	subi      	r8, r9, 1
 80142b6:	e44e0034 	addi      	r2, r14, 53
 80142ba:	e4291008 	subi      	r1, r9, 9
 80142be:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 80142c2:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80142c4:	6476      	cmpne      	r13, r1
 80142c6:	0c09      	bf      	0x80142d8	// 80142d8 <_ftoa+0x36c>
    buf[len++] = '0';
 80142c8:	e5ad0000 	addi      	r13, r13, 1
 80142cc:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 80142d0:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80142d4:	e823fff8 	bnezad      	r3, 0x80142c4	// 80142c4 <_ftoa+0x358>
 80142d8:	104c      	lrw      	r2, 0x8015cc4	// 8014308 <_ftoa+0x39c>
 80142da:	c4684823 	lsli      	r3, r8, 3
 80142de:	60c8      	addu      	r3, r2
 80142e0:	9340      	ld.w      	r2, (r3, 0x0)
 80142e2:	9361      	ld.w      	r3, (r3, 0x4)
 80142e4:	b847      	st.w      	r2, (r14, 0x1c)
 80142e6:	b868      	st.w      	r3, (r14, 0x20)
 80142e8:	06b1      	br      	0x801404a	// 801404a <_ftoa+0xde>
 80142ea:	0000      	.short	0x0000
 80142ec:	08015cb4 	.long	0x08015cb4
 80142f0:	08015cac 	.long	0x08015cac
 80142f4:	41cdcd65 	.long	0x41cdcd65
 80142f8:	c1cdcd65 	.long	0xc1cdcd65
 80142fc:	412e8480 	.long	0x412e8480
 8014300:	08015cb8 	.long	0x08015cb8
 8014304:	08015cbc 	.long	0x08015cbc
 8014308:	08015cc4 	.long	0x08015cc4
      buf[len++] = '-';
 801430c:	312d      	movi      	r1, 45
 801430e:	5a62      	addi      	r3, r2, 1
 8014310:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8014314:	079f      	br      	0x8014252	// 8014252 <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8014316:	6ca3      	mov      	r2, r8
 8014318:	ea233fe0 	movih      	r3, 16352
 801431c:	6c13      	mov      	r0, r4
 801431e:	6c57      	mov      	r1, r5
 8014320:	e3ffe86e 	bsr      	0x80113fc	// 80113fc <__gtdf2>
 8014324:	c410482d 	lsli      	r13, r16, 0
 8014328:	c4114834 	lsli      	r20, r17, 0
 801432c:	e960ff0a 	blsz      	r0, 0x8014140	// 8014140 <_ftoa+0x1d4>
 8014330:	0700      	br      	0x8014130	// 8014130 <_ftoa+0x1c4>
      ++whole;
 8014332:	6ce7      	mov      	r3, r9
 8014334:	2300      	addi      	r3, 1
 8014336:	6e4f      	mov      	r9, r3
      frac = 0;
 8014338:	ea120000 	movi      	r18, 0
 801433c:	06de      	br      	0x80140f8	// 80140f8 <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 801433e:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8014340:	9865      	ld.w      	r3, (r14, 0x14)
 8014342:	e903ff26 	bez      	r3, 0x801418e	// 801418e <_ftoa+0x222>
 8014346:	986c      	ld.w      	r3, (r14, 0x30)
 8014348:	e9230007 	bnez      	r3, 0x8014356	// 8014356 <_ftoa+0x3ea>
 801434c:	9866      	ld.w      	r3, (r14, 0x18)
 801434e:	e463200c 	andi      	r3, r3, 12
 8014352:	e9030005 	bez      	r3, 0x801435c	// 801435c <_ftoa+0x3f0>
      width--;
 8014356:	9865      	ld.w      	r3, (r14, 0x14)
 8014358:	2b00      	subi      	r3, 1
 801435a:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801435c:	9865      	ld.w      	r3, (r14, 0x14)
 801435e:	64c8      	cmphs      	r2, r3
 8014360:	0b17      	bt      	0x801418e	// 801418e <_ftoa+0x222>
 8014362:	eb420020 	cmpnei      	r2, 32
 8014366:	0c3d      	bf      	0x80143e0	// 80143e0 <_ftoa+0x474>
 8014368:	c4540021 	addu      	r1, r20, r2
 801436c:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 801436e:	3230      	movi      	r2, 48
 8014370:	0405      	br      	0x801437a	// 801437a <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8014372:	eb430020 	cmpnei      	r3, 32
 8014376:	2100      	addi      	r1, 1
 8014378:	0f6d      	bf      	0x8014252	// 8014252 <_ftoa+0x2e6>
      buf[len++] = '0';
 801437a:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801437c:	9805      	ld.w      	r0, (r14, 0x14)
 801437e:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 8014380:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8014382:	0bf8      	bt      	0x8014372	// 8014372 <_ftoa+0x406>
      buf[len++] = '0';
 8014384:	9845      	ld.w      	r2, (r14, 0x14)
 8014386:	0704      	br      	0x801418e	// 801418e <_ftoa+0x222>
    value = 0 - value;
 8014388:	6c93      	mov      	r2, r4
 801438a:	9961      	ld.w      	r3, (r14, 0x84)
 801438c:	3000      	movi      	r0, 0
 801438e:	3100      	movi      	r1, 0
 8014390:	e3ffe670 	bsr      	0x8011070	// 8011070 <__subdf3>
    negative = true;
 8014394:	3301      	movi      	r3, 1
    value = 0 - value;
 8014396:	6d03      	mov      	r4, r0
 8014398:	6d47      	mov      	r5, r1
    negative = true;
 801439a:	b86c      	st.w      	r3, (r14, 0x30)
 801439c:	064a      	br      	0x8014030	// 8014030 <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801439e:	eb420020 	cmpnei      	r2, 32
 80143a2:	0f52      	bf      	0x8014246	// 8014246 <_ftoa+0x2da>
 80143a4:	e90c000e 	bez      	r12, 0x80143c0	// 80143c0 <_ftoa+0x454>
 80143a8:	c4540023 	addu      	r3, r20, r2
 80143ac:	6308      	addu      	r12, r2
      buf[len++] = '0';
 80143ae:	3130      	movi      	r1, 48
 80143b0:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 80143b2:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 80143b6:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 80143b8:	0f47      	bf      	0x8014246	// 8014246 <_ftoa+0x2da>
 80143ba:	670a      	cmpne      	r2, r12
 80143bc:	2300      	addi      	r3, 1
 80143be:	0bf9      	bt      	0x80143b0	// 80143b0 <_ftoa+0x444>
      buf[len++] = '.';
 80143c0:	332e      	movi      	r3, 46
 80143c2:	e5a20000 	addi      	r13, r2, 1
 80143c6:	d4540023 	str.b      	r3, (r20, r2 << 0)
 80143ca:	06bb      	br      	0x8014140	// 8014140 <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 80143cc:	9866      	ld.w      	r3, (r14, 0x18)
 80143ce:	e4632008 	andi      	r3, r3, 8
 80143d2:	e9030007 	bez      	r3, 0x80143e0	// 80143e0 <_ftoa+0x474>
      buf[len++] = ' ';
 80143d6:	3120      	movi      	r1, 32
 80143d8:	5a62      	addi      	r3, r2, 1
 80143da:	d4540021 	str.b      	r1, (r20, r2 << 0)
 80143de:	073a      	br      	0x8014252	// 8014252 <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 80143e0:	6ccb      	mov      	r3, r2
 80143e2:	0738      	br      	0x8014252	// 8014252 <_ftoa+0x2e6>
 80143e4:	1047      	lrw      	r2, 0x8015cc4	// 8014400 <_ftoa+0x494>
 80143e6:	4363      	lsli      	r3, r3, 3
 80143e8:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80143ea:	6e27      	mov      	r8, r9
 80143ec:	9340      	ld.w      	r2, (r3, 0x0)
 80143ee:	9361      	ld.w      	r3, (r3, 0x4)
 80143f0:	b847      	st.w      	r2, (r14, 0x1c)
 80143f2:	b868      	st.w      	r3, (r14, 0x20)
 80143f4:	ea0d0000 	movi      	r13, 0
 80143f8:	e68e0033 	addi      	r20, r14, 52
 80143fc:	0627      	br      	0x801404a	// 801404a <_ftoa+0xde>
 80143fe:	0000      	.short	0x0000
 8014400:	08015cc4 	.long	0x08015cc4

08014404 <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8014404:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014408:	1434      	subi      	r14, r14, 80
 801440a:	6e0f      	mov      	r8, r3
 801440c:	9961      	ld.w      	r3, (r14, 0x84)
 801440e:	b867      	st.w      	r3, (r14, 0x1c)
 8014410:	9962      	ld.w      	r3, (r14, 0x88)
 8014412:	98bf      	ld.w      	r5, (r14, 0x7c)
 8014414:	9980      	ld.w      	r4, (r14, 0x80)
 8014416:	b868      	st.w      	r3, (r14, 0x20)
 8014418:	9963      	ld.w      	r3, (r14, 0x8c)
 801441a:	b866      	st.w      	r3, (r14, 0x18)
 801441c:	6d83      	mov      	r6, r0
 801441e:	6dc7      	mov      	r7, r1
 8014420:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 8014422:	6cd3      	mov      	r3, r4
 8014424:	6c97      	mov      	r2, r5
 8014426:	6c17      	mov      	r0, r5
 8014428:	6c53      	mov      	r1, r4
 801442a:	e3ffe7cd 	bsr      	0x80113c4	// 80113c4 <__nedf2>
 801442e:	6e43      	mov      	r9, r0
 8014430:	e92001d7 	bnez      	r0, 0x80147de	// 80147de <_etoa+0x3da>
 8014434:	3200      	movi      	r2, 0
 8014436:	ea237ff0 	movih      	r3, 32752
 801443a:	2a00      	subi      	r2, 1
 801443c:	2b00      	subi      	r3, 1
 801443e:	6c17      	mov      	r0, r5
 8014440:	6c53      	mov      	r1, r4
 8014442:	e3ffe7dd 	bsr      	0x80113fc	// 80113fc <__gtdf2>
 8014446:	e94001cc 	bhz      	r0, 0x80147de	// 80147de <_etoa+0x3da>
 801444a:	3200      	movi      	r2, 0
 801444c:	ea23fff0 	movih      	r3, 65520
 8014450:	2a00      	subi      	r2, 1
 8014452:	2b00      	subi      	r3, 1
 8014454:	6c17      	mov      	r0, r5
 8014456:	6c53      	mov      	r1, r4
 8014458:	e3ffe812 	bsr      	0x801147c	// 801147c <__ltdf2>
 801445c:	e98001c1 	blz      	r0, 0x80147de	// 80147de <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 8014460:	6ca7      	mov      	r2, r9
 8014462:	6ce7      	mov      	r3, r9
 8014464:	6c17      	mov      	r0, r5
 8014466:	6c53      	mov      	r1, r4
 8014468:	e3ffe80a 	bsr      	0x801147c	// 801147c <__ltdf2>
    value = -value;
 801446c:	6e97      	mov      	r10, r5
  if (negative) {
 801446e:	e9800208 	blz      	r0, 0x801487e	// 801487e <_etoa+0x47a>
 8014472:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 8014474:	9866      	ld.w      	r3, (r14, 0x18)
 8014476:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801447a:	3b40      	cmpnei      	r3, 0
 801447c:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 801447e:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8014480:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014484:	3306      	movi      	r3, 6
 8014486:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801448a:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801448e:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8014490:	dd4e200a 	st.w      	r10, (r14, 0x28)
 8014494:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014498:	e3ffe80e 	bsr      	0x80114b4	// 80114b4 <__floatsidf>
 801449c:	0145      	lrw      	r2, 0x509f79fb	// 8014804 <_etoa+0x400>
 801449e:	0164      	lrw      	r3, 0x3fd34413	// 8014808 <_etoa+0x404>
 80144a0:	e3ffe606 	bsr      	0x80110ac	// 80110ac <__muldf3>
 80144a4:	0145      	lrw      	r2, 0x8b60c8b3	// 801480c <_etoa+0x408>
 80144a6:	0164      	lrw      	r3, 0x3fc68a28	// 8014810 <_etoa+0x40c>
 80144a8:	e3ffe5cc 	bsr      	0x8011040	// 8011040 <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 80144ac:	d98e200a 	ld.w      	r12, (r14, 0x28)
 80144b0:	da6e2009 	ld.w      	r19, (r14, 0x24)
 80144b4:	c40c4836 	lsli      	r22, r12, 0
 80144b8:	c4135677 	zext      	r23, r19, 19, 0
 80144bc:	ea140000 	movi      	r20, 0
 80144c0:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 80144c4:	c4004831 	lsli      	r17, r0, 0
 80144c8:	c4014830 	lsli      	r16, r1, 0
 80144cc:	3200      	movi      	r2, 0
 80144ce:	c6962420 	or      	r0, r22, r20
 80144d2:	c6b72421 	or      	r1, r23, r21
 80144d6:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 80144da:	dd8e2012 	st.w      	r12, (r14, 0x48)
 80144de:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 80144e2:	de8e200f 	st.w      	r20, (r14, 0x3c)
 80144e6:	deae2010 	st.w      	r21, (r14, 0x40)
 80144ea:	e3ffe5c3 	bsr      	0x8011070	// 8011070 <__subdf3>
 80144ee:	0155      	lrw      	r2, 0x636f4361	// 8014814 <_etoa+0x410>
 80144f0:	0175      	lrw      	r3, 0x3fd287a7	// 8014818 <_etoa+0x414>
 80144f2:	e3ffe5dd 	bsr      	0x80110ac	// 80110ac <__muldf3>
 80144f6:	6c83      	mov      	r2, r0
 80144f8:	6cc7      	mov      	r3, r1
 80144fa:	c4114820 	lsli      	r0, r17, 0
 80144fe:	c4104821 	lsli      	r1, r16, 0
 8014502:	e3ffe59f 	bsr      	0x8011040	// 8011040 <__adddf3>
 8014506:	e3ffe80b 	bsr      	0x801151c	// 801151c <__fixdfsi>
 801450a:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 801450c:	e3ffe7d4 	bsr      	0x80114b4	// 80114b4 <__floatsidf>
 8014510:	015c      	lrw      	r2, 0x979a371	// 801481c <_etoa+0x418>
 8014512:	017b      	lrw      	r3, 0x400a934f	// 8014820 <_etoa+0x41c>
 8014514:	c4004831 	lsli      	r17, r0, 0
 8014518:	c4014830 	lsli      	r16, r1, 0
 801451c:	e3ffe5c8 	bsr      	0x80110ac	// 80110ac <__muldf3>
 8014520:	3200      	movi      	r2, 0
 8014522:	ea233fe0 	movih      	r3, 16352
 8014526:	e3ffe58d 	bsr      	0x8011040	// 8011040 <__adddf3>
 801452a:	e3ffe7f9 	bsr      	0x801151c	// 801151c <__fixdfsi>
 801452e:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 8014530:	0242      	lrw      	r2, 0xbbb55516	// 8014824 <_etoa+0x420>
 8014532:	0261      	lrw      	r3, 0x40026bb1	// 8014828 <_etoa+0x424>
 8014534:	c4114820 	lsli      	r0, r17, 0
 8014538:	c4104821 	lsli      	r1, r16, 0
 801453c:	e3ffe5b8 	bsr      	0x80110ac	// 80110ac <__muldf3>
 8014540:	c4004831 	lsli      	r17, r0, 0
 8014544:	980a      	ld.w      	r0, (r14, 0x28)
 8014546:	c4014830 	lsli      	r16, r1, 0
 801454a:	e3ffe7b5 	bsr      	0x80114b4	// 80114b4 <__floatsidf>
 801454e:	0247      	lrw      	r2, 0xfefa39ef	// 801482c <_etoa+0x428>
 8014550:	0267      	lrw      	r3, 0x3fe62e42	// 8014830 <_etoa+0x42c>
 8014552:	e3ffe5ad 	bsr      	0x80110ac	// 80110ac <__muldf3>
 8014556:	6c83      	mov      	r2, r0
 8014558:	6cc7      	mov      	r3, r1
 801455a:	c4114820 	lsli      	r0, r17, 0
 801455e:	c4104821 	lsli      	r1, r16, 0
 8014562:	e3ffe587 	bsr      	0x8011070	// 8011070 <__subdf3>
  const double z2 = z * z;
 8014566:	6c83      	mov      	r2, r0
 8014568:	6cc7      	mov      	r3, r1
 801456a:	b80c      	st.w      	r0, (r14, 0x30)
 801456c:	b82b      	st.w      	r1, (r14, 0x2c)
 801456e:	e3ffe59f 	bsr      	0x80110ac	// 80110ac <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8014572:	da4e200c 	ld.w      	r18, (r14, 0x30)
 8014576:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 801457a:	c4124822 	lsli      	r2, r18, 0
 801457e:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 8014580:	c4004831 	lsli      	r17, r0, 0
 8014584:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8014588:	c4124820 	lsli      	r0, r18, 0
 801458c:	6c77      	mov      	r1, r13
 801458e:	de4e200e 	st.w      	r18, (r14, 0x38)
 8014592:	ddae200d 	st.w      	r13, (r14, 0x34)
 8014596:	e3ffe555 	bsr      	0x8011040	// 8011040 <__adddf3>
 801459a:	b80c      	st.w      	r0, (r14, 0x30)
 801459c:	b82b      	st.w      	r1, (r14, 0x2c)
 801459e:	3200      	movi      	r2, 0
 80145a0:	ea23402c 	movih      	r3, 16428
 80145a4:	c4114820 	lsli      	r0, r17, 0
 80145a8:	c4104821 	lsli      	r1, r16, 0
 80145ac:	e3ffe680 	bsr      	0x80112ac	// 80112ac <__divdf3>
 80145b0:	3200      	movi      	r2, 0
 80145b2:	ea234024 	movih      	r3, 16420
 80145b6:	e3ffe545 	bsr      	0x8011040	// 8011040 <__adddf3>
 80145ba:	6c83      	mov      	r2, r0
 80145bc:	6cc7      	mov      	r3, r1
 80145be:	c4114820 	lsli      	r0, r17, 0
 80145c2:	c4104821 	lsli      	r1, r16, 0
 80145c6:	e3ffe673 	bsr      	0x80112ac	// 80112ac <__divdf3>
 80145ca:	3200      	movi      	r2, 0
 80145cc:	ea234018 	movih      	r3, 16408
 80145d0:	e3ffe538 	bsr      	0x8011040	// 8011040 <__adddf3>
 80145d4:	6c83      	mov      	r2, r0
 80145d6:	6cc7      	mov      	r3, r1
 80145d8:	c4114820 	lsli      	r0, r17, 0
 80145dc:	c4104821 	lsli      	r1, r16, 0
 80145e0:	e3ffe666 	bsr      	0x80112ac	// 80112ac <__divdf3>
 80145e4:	da4e200e 	ld.w      	r18, (r14, 0x38)
 80145e8:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 80145ec:	c4124822 	lsli      	r2, r18, 0
 80145f0:	6cf7      	mov      	r3, r13
 80145f2:	c4004831 	lsli      	r17, r0, 0
 80145f6:	c4014830 	lsli      	r16, r1, 0
 80145fa:	3000      	movi      	r0, 0
 80145fc:	ea214000 	movih      	r1, 16384
 8014600:	e3ffe538 	bsr      	0x8011070	// 8011070 <__subdf3>
 8014604:	6c83      	mov      	r2, r0
 8014606:	6cc7      	mov      	r3, r1
 8014608:	c4114820 	lsli      	r0, r17, 0
 801460c:	c4104821 	lsli      	r1, r16, 0
 8014610:	e3ffe518 	bsr      	0x8011040	// 8011040 <__adddf3>
 8014614:	daee200c 	ld.w      	r23, (r14, 0x30)
 8014618:	dace200b 	ld.w      	r22, (r14, 0x2c)
 801461c:	6c83      	mov      	r2, r0
 801461e:	6cc7      	mov      	r3, r1
 8014620:	c4174820 	lsli      	r0, r23, 0
 8014624:	c4164821 	lsli      	r1, r22, 0
 8014628:	e3ffe642 	bsr      	0x80112ac	// 80112ac <__divdf3>
 801462c:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 8014630:	daae2010 	ld.w      	r21, (r14, 0x40)
 8014634:	c4144822 	lsli      	r2, r20, 0
 8014638:	c4154823 	lsli      	r3, r21, 0
 801463c:	e3ffe502 	bsr      	0x8011040	// 8011040 <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 8014640:	984a      	ld.w      	r2, (r14, 0x28)
 8014642:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8014646:	4374      	lsli      	r3, r3, 20
 8014648:	3200      	movi      	r2, 0
 801464a:	e3ffe531 	bsr      	0x80110ac	// 80110ac <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 801464e:	d98e2012 	ld.w      	r12, (r14, 0x48)
 8014652:	da6e2011 	ld.w      	r19, (r14, 0x44)
 8014656:	6c83      	mov      	r2, r0
 8014658:	c4004830 	lsli      	r16, r0, 0
 801465c:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 801465e:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 8014662:	6c33      	mov      	r0, r12
 8014664:	c4134821 	lsli      	r1, r19, 0
 8014668:	e3ffe70a 	bsr      	0x801147c	// 801147c <__ltdf2>
 801466c:	c4104832 	lsli      	r18, r16, 0
 8014670:	e9a00012 	bhsz      	r0, 0x8014694	// 8014694 <_etoa+0x290>
    expval--;
 8014674:	9869      	ld.w      	r3, (r14, 0x24)
 8014676:	2b00      	subi      	r3, 1
 8014678:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 801467a:	c4114821 	lsli      	r1, r17, 0
 801467e:	3200      	movi      	r2, 0
 8014680:	ea234024 	movih      	r3, 16420
 8014684:	c4104820 	lsli      	r0, r16, 0
 8014688:	e3ffe612 	bsr      	0x80112ac	// 80112ac <__divdf3>
 801468c:	c4004832 	lsli      	r18, r0, 0
 8014690:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8014694:	9849      	ld.w      	r2, (r14, 0x24)
 8014696:	e4620062 	addi      	r3, r2, 99
 801469a:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 801469e:	9866      	ld.w      	r3, (r14, 0x18)
 80146a0:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 80146a4:	c4000510 	mvc      	r16
 80146a8:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 80146ac:	e9030027 	bez      	r3, 0x80146fa	// 80146fa <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 80146b0:	1341      	lrw      	r2, 0xeb1c432d	// 8014834 <_etoa+0x430>
 80146b2:	1362      	lrw      	r3, 0x3f1a36e2	// 8014838 <_etoa+0x434>
 80146b4:	6c2b      	mov      	r0, r10
 80146b6:	6c67      	mov      	r1, r9
 80146b8:	de4e200a 	st.w      	r18, (r14, 0x28)
 80146bc:	e3ffe6c0 	bsr      	0x801143c	// 801143c <__gedf2>
 80146c0:	da4e200a 	ld.w      	r18, (r14, 0x28)
 80146c4:	e98000cd 	blz      	r0, 0x801485e	// 801485e <_etoa+0x45a>
 80146c8:	3200      	movi      	r2, 0
 80146ca:	127d      	lrw      	r3, 0x412e8480	// 801483c <_etoa+0x438>
 80146cc:	6c2b      	mov      	r0, r10
 80146ce:	6c67      	mov      	r1, r9
 80146d0:	e3ffe6d6 	bsr      	0x801147c	// 801147c <__ltdf2>
 80146d4:	da4e200a 	ld.w      	r18, (r14, 0x28)
 80146d8:	e9a000c3 	bhsz      	r0, 0x801485e	// 801485e <_etoa+0x45a>
      if ((int)prec > expval) {
 80146dc:	9849      	ld.w      	r2, (r14, 0x24)
 80146de:	9867      	ld.w      	r3, (r14, 0x1c)
 80146e0:	64c9      	cmplt      	r2, r3
 80146e2:	0cd4      	bf      	0x801488a	// 801488a <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 80146e4:	60ca      	subu      	r3, r2
 80146e6:	2b00      	subi      	r3, 1
 80146e8:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 80146ea:	9866      	ld.w      	r3, (r14, 0x18)
 80146ec:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 80146f0:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 80146f4:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 80146f6:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 80146fa:	9848      	ld.w      	r2, (r14, 0x20)
 80146fc:	c602008c 	subu      	r12, r2, r16
 8014700:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 8014704:	9846      	ld.w      	r2, (r14, 0x18)
 8014706:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 801470a:	3300      	movi      	r3, 0
 801470c:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 8014710:	b84a      	st.w      	r2, (r14, 0x28)
 8014712:	e9020006 	bez      	r2, 0x801471e	// 801471e <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 8014716:	eb500000 	cmpnei      	r16, 0
 801471a:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 801471e:	9869      	ld.w      	r3, (r14, 0x24)
 8014720:	e9230090 	bnez      	r3, 0x8014840	// 8014840 <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8014724:	3200      	movi      	r2, 0
 8014726:	6ccb      	mov      	r3, r2
 8014728:	6c17      	mov      	r0, r5
 801472a:	6c53      	mov      	r1, r4
 801472c:	c40c4831 	lsli      	r17, r12, 0
 8014730:	e3ffe6a6 	bsr      	0x801147c	// 801147c <__ltdf2>
 8014734:	c411482c 	lsli      	r12, r17, 0
 8014738:	e980009e 	blz      	r0, 0x8014874	// 8014874 <_etoa+0x470>
 801473c:	da2e2006 	ld.w      	r17, (r14, 0x18)
 8014740:	98a7      	ld.w      	r5, (r14, 0x1c)
 8014742:	c5712823 	bclri      	r3, r17, 11
 8014746:	b864      	st.w      	r3, (r14, 0x10)
 8014748:	dd2e2001 	st.w      	r9, (r14, 0x4)
 801474c:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8014750:	b8a2      	st.w      	r5, (r14, 0x8)
 8014752:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8014756:	6ce3      	mov      	r3, r8
 8014758:	6caf      	mov      	r2, r11
 801475a:	6c5f      	mov      	r1, r7
 801475c:	6c1b      	mov      	r0, r6
 801475e:	e3fffc07 	bsr      	0x8013f6c	// 8013f6c <_ftoa>
 8014762:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 8014764:	6e57      	mov      	r9, r5
 8014766:	e925004b 	bnez      	r5, 0x80147fc	// 80147fc <_etoa+0x3f8>
 801476a:	e9100049 	bez      	r16, 0x80147fc	// 80147fc <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 801476e:	e4712020 	andi      	r3, r17, 32
 8014772:	3b40      	cmpnei      	r3, 0
 8014774:	6c83      	mov      	r2, r0
 8014776:	ea0c0065 	movi      	r12, 101
 801477a:	58a2      	addi      	r5, r0, 1
 801477c:	3045      	movi      	r0, 69
 801477e:	c40c0c20 	incf      	r0, r12, 0
 8014782:	6ce3      	mov      	r3, r8
 8014784:	6c5f      	mov      	r1, r7
 8014786:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8014788:	3305      	movi      	r3, 5
 801478a:	9849      	ld.w      	r2, (r14, 0x24)
 801478c:	b865      	st.w      	r3, (r14, 0x14)
 801478e:	330a      	movi      	r3, 10
 8014790:	b862      	st.w      	r3, (r14, 0x8)
 8014792:	4a7f      	lsri      	r3, r2, 31
 8014794:	b861      	st.w      	r3, (r14, 0x4)
 8014796:	e6101000 	subi      	r16, r16, 1
 801479a:	c4020203 	abs      	r3, r2
 801479e:	b860      	st.w      	r3, (r14, 0x0)
 80147a0:	de0e2004 	st.w      	r16, (r14, 0x10)
 80147a4:	6ce3      	mov      	r3, r8
 80147a6:	dd2e2003 	st.w      	r9, (r14, 0xc)
 80147aa:	6c97      	mov      	r2, r5
 80147ac:	6c5f      	mov      	r1, r7
 80147ae:	6c1b      	mov      	r0, r6
 80147b0:	e3fffb0c 	bsr      	0x8013dc8	// 8013dc8 <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 80147b4:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 80147b6:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 80147b8:	e9030022 	bez      	r3, 0x80147fc	// 80147fc <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 80147bc:	c5600083 	subu      	r3, r0, r11
 80147c0:	98a8      	ld.w      	r5, (r14, 0x20)
 80147c2:	654c      	cmphs      	r3, r5
 80147c4:	081c      	bt      	0x80147fc	// 80147fc <_etoa+0x3f8>
 80147c6:	6c83      	mov      	r2, r0
 80147c8:	2400      	addi      	r4, 1
 80147ca:	6ce3      	mov      	r3, r8
 80147cc:	6c5f      	mov      	r1, r7
 80147ce:	3020      	movi      	r0, 32
 80147d0:	7bd9      	jsr      	r6
 80147d2:	c5640083 	subu      	r3, r4, r11
 80147d6:	654c      	cmphs      	r3, r5
 80147d8:	6c93      	mov      	r2, r4
 80147da:	0ff7      	bf      	0x80147c8	// 80147c8 <_etoa+0x3c4>
 80147dc:	0410      	br      	0x80147fc	// 80147fc <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 80147de:	9866      	ld.w      	r3, (r14, 0x18)
 80147e0:	b864      	st.w      	r3, (r14, 0x10)
 80147e2:	9868      	ld.w      	r3, (r14, 0x20)
 80147e4:	b863      	st.w      	r3, (r14, 0xc)
 80147e6:	9867      	ld.w      	r3, (r14, 0x1c)
 80147e8:	b862      	st.w      	r3, (r14, 0x8)
 80147ea:	b881      	st.w      	r4, (r14, 0x4)
 80147ec:	b8a0      	st.w      	r5, (r14, 0x0)
 80147ee:	6ce3      	mov      	r3, r8
 80147f0:	6caf      	mov      	r2, r11
 80147f2:	6c5f      	mov      	r1, r7
 80147f4:	6c1b      	mov      	r0, r6
 80147f6:	e3fffbbb 	bsr      	0x8013f6c	// 8013f6c <_ftoa>
 80147fa:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 80147fc:	6c13      	mov      	r0, r4
 80147fe:	1414      	addi      	r14, r14, 80
 8014800:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8014804:	509f79fb 	.long	0x509f79fb
 8014808:	3fd34413 	.long	0x3fd34413
 801480c:	8b60c8b3 	.long	0x8b60c8b3
 8014810:	3fc68a28 	.long	0x3fc68a28
 8014814:	636f4361 	.long	0x636f4361
 8014818:	3fd287a7 	.long	0x3fd287a7
 801481c:	0979a371 	.long	0x0979a371
 8014820:	400a934f 	.long	0x400a934f
 8014824:	bbb55516 	.long	0xbbb55516
 8014828:	40026bb1 	.long	0x40026bb1
 801482c:	fefa39ef 	.long	0xfefa39ef
 8014830:	3fe62e42 	.long	0x3fe62e42
 8014834:	eb1c432d 	.long	0xeb1c432d
 8014838:	3f1a36e2 	.long	0x3f1a36e2
 801483c:	412e8480 	.long	0x412e8480
    value /= conv.F;
 8014840:	6c2b      	mov      	r0, r10
 8014842:	6c67      	mov      	r1, r9
 8014844:	c4124822 	lsli      	r2, r18, 0
 8014848:	c4114823 	lsli      	r3, r17, 0
 801484c:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 8014850:	e3ffe52e 	bsr      	0x80112ac	// 80112ac <__divdf3>
 8014854:	6e83      	mov      	r10, r0
 8014856:	6e47      	mov      	r9, r1
 8014858:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 801485c:	0764      	br      	0x8014724	// 8014724 <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 801485e:	9847      	ld.w      	r2, (r14, 0x1c)
 8014860:	e902ff4d 	bez      	r2, 0x80146fa	// 80146fa <_etoa+0x2f6>
        --prec;
 8014864:	9873      	ld.w      	r3, (r14, 0x4c)
 8014866:	3b40      	cmpnei      	r3, 0
 8014868:	c4620c20 	incf      	r3, r2, 0
 801486c:	c4620d01 	dect      	r3, r2, 1
 8014870:	b867      	st.w      	r3, (r14, 0x1c)
 8014872:	0744      	br      	0x80146fa	// 80146fa <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8014874:	ea238000 	movih      	r3, 32768
 8014878:	60e4      	addu      	r3, r9
 801487a:	6e4f      	mov      	r9, r3
 801487c:	0760      	br      	0x801473c	// 801473c <_etoa+0x338>
    value = -value;
 801487e:	ea238000 	movih      	r3, 32768
 8014882:	c4640029 	addu      	r9, r4, r3
 8014886:	e800fdf7 	br      	0x8014474	// 8014474 <_etoa+0x70>
      if ((int)prec > expval) {
 801488a:	3300      	movi      	r3, 0
 801488c:	072e      	br      	0x80146e8	// 80146e8 <_etoa+0x2e4>
	...

08014890 <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 8014890:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014894:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 8014896:	3940      	cmpnei      	r1, 0
 8014898:	10cf      	lrw      	r6, 0x8013b40	// 80148d4 <_vsnprintf+0x44>
{
 801489a:	6e07      	mov      	r8, r1
 801489c:	6dcb      	mov      	r7, r2
 801489e:	6d4f      	mov      	r5, r3
 80148a0:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 80148a2:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 80148a6:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 80148aa:	ea89000c 	lrw      	r9, 0x8015acc	// 80148d8 <_vsnprintf+0x48>
  while (*format)
 80148ae:	8500      	ld.b      	r0, (r5, 0x0)
 80148b0:	e900006f 	bez      	r0, 0x801498e	// 801498e <_vsnprintf+0xfe>
    if (*format != '%') {
 80148b4:	eb400025 	cmpnei      	r0, 37
 80148b8:	0860      	bt      	0x8014978	// 8014978 <_vsnprintf+0xe8>
      format++;
 80148ba:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 80148bc:	3100      	movi      	r1, 0
      switch (*format) {
 80148be:	8200      	ld.b      	r0, (r2, 0x0)
 80148c0:	e460101f 	subi      	r3, r0, 32
 80148c4:	74cc      	zextb      	r3, r3
 80148c6:	3b10      	cmphsi      	r3, 17
 80148c8:	6d4b      	mov      	r5, r2
 80148ca:	081d      	bt      	0x8014904	// 8014904 <_vsnprintf+0x74>
 80148cc:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 80148d0:	780c      	jmp      	r3
 80148d2:	0000      	.short	0x0000
 80148d4:	08013b40 	.long	0x08013b40
 80148d8:	08015acc 	.long	0x08015acc
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 80148dc:	ec210001 	ori      	r1, r1, 1
 80148e0:	2200      	addi      	r2, 1
 80148e2:	07ee      	br      	0x80148be	// 80148be <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 80148e4:	ec210008 	ori      	r1, r1, 8
 80148e8:	2200      	addi      	r2, 1
 80148ea:	07ea      	br      	0x80148be	// 80148be <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 80148ec:	ec210010 	ori      	r1, r1, 16
 80148f0:	2200      	addi      	r2, 1
 80148f2:	07e6      	br      	0x80148be	// 80148be <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 80148f4:	ec210004 	ori      	r1, r1, 4
 80148f8:	2200      	addi      	r2, 1
 80148fa:	07e2      	br      	0x80148be	// 80148be <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 80148fc:	ec210002 	ori      	r1, r1, 2
 8014900:	2200      	addi      	r2, 1
 8014902:	07de      	br      	0x80148be	// 80148be <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 8014904:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 8014908:	74cc      	zextb      	r3, r3
 801490a:	3b09      	cmphsi      	r3, 10
 801490c:	0c5b      	bf      	0x80149c2	// 80149c2 <_vsnprintf+0x132>
    else if (*format == '*') {
 801490e:	eb40002a 	cmpnei      	r0, 42
 8014912:	e84003c3 	bf      	0x8015098	// 8015098 <_vsnprintf+0x808>
    width = 0U;
 8014916:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 801491a:	eb40002e 	cmpnei      	r0, 46
 801491e:	0c65      	bf      	0x80149e8	// 80149e8 <_vsnprintf+0x158>
    precision = 0U;
 8014920:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 8014924:	e4601067 	subi      	r3, r0, 104
 8014928:	74cc      	zextb      	r3, r3
 801492a:	3b12      	cmphsi      	r3, 19
 801492c:	080c      	bt      	0x8014944	// 8014944 <_vsnprintf+0xb4>
 801492e:	1043      	lrw      	r2, 0x8015b10	// 8014938 <_vsnprintf+0xa8>
 8014930:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8014934:	780c      	jmp      	r3
 8014936:	0000      	.short	0x0000
 8014938:	08015b10 	.long	0x08015b10
 801493c:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 801493e:	ec210100 	ori      	r1, r1, 256
        format++;
 8014942:	2500      	addi      	r5, 1
    switch (*format) {
 8014944:	e4601024 	subi      	r3, r0, 37
 8014948:	74cc      	zextb      	r3, r3
 801494a:	eb030053 	cmphsi      	r3, 84
 801494e:	0815      	bt      	0x8014978	// 8014978 <_vsnprintf+0xe8>
 8014950:	1042      	lrw      	r2, 0x8015b5c	// 8014958 <_vsnprintf+0xc8>
 8014952:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8014956:	780c      	jmp      	r3
 8014958:	08015b5c 	.long	0x08015b5c
        if (*format == 'l') {
 801495c:	8501      	ld.b      	r0, (r5, 0x1)
 801495e:	eb40006c 	cmpnei      	r0, 108
 8014962:	e84003ac 	bf      	0x80150ba	// 80150ba <_vsnprintf+0x82a>
    switch (*format) {
 8014966:	e4601024 	subi      	r3, r0, 37
 801496a:	74cc      	zextb      	r3, r3
 801496c:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 8014970:	ec210100 	ori      	r1, r1, 256
        format++;
 8014974:	2500      	addi      	r5, 1
    switch (*format) {
 8014976:	0fed      	bf      	0x8014950	// 8014950 <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 8014978:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 801497a:	6caf      	mov      	r2, r11
 801497c:	6cdf      	mov      	r3, r7
 801497e:	6c63      	mov      	r1, r8
 8014980:	7bd9      	jsr      	r6
  while (*format)
 8014982:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 8014984:	e54b0000 	addi      	r10, r11, 1
 8014988:	6eeb      	mov      	r11, r10
  while (*format)
 801498a:	e920ff95 	bnez      	r0, 0x80148b4	// 80148b4 <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 801498e:	65ec      	cmphs      	r11, r7
 8014990:	e8400381 	bf      	0x8015092	// 8015092 <_vsnprintf+0x802>
 8014994:	5f43      	subi      	r2, r7, 1
 8014996:	6cdf      	mov      	r3, r7
 8014998:	6c63      	mov      	r1, r8
 801499a:	3000      	movi      	r0, 0
 801499c:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 801499e:	6c2f      	mov      	r0, r11
 80149a0:	1416      	addi      	r14, r14, 88
 80149a2:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 80149a6:	8501      	ld.b      	r0, (r5, 0x1)
 80149a8:	eb400068 	cmpnei      	r0, 104
 80149ac:	e8400381 	bf      	0x80150ae	// 80150ae <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 80149b0:	ec210080 	ori      	r1, r1, 128
        format++;
 80149b4:	2500      	addi      	r5, 1
 80149b6:	07c7      	br      	0x8014944	// 8014944 <_vsnprintf+0xb4>
 80149b8:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 80149ba:	ec210200 	ori      	r1, r1, 512
        format++;
 80149be:	2500      	addi      	r5, 1
        break;
 80149c0:	07c2      	br      	0x8014944	// 8014944 <_vsnprintf+0xb4>
 80149c2:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80149c6:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 80149ca:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80149cc:	2500      	addi      	r5, 1
 80149ce:	f9b18440 	mula.32.l      	r0, r17, r13
 80149d2:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 80149d6:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 80149d8:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 80149dc:	74cc      	zextb      	r3, r3
 80149de:	64c8      	cmphs      	r2, r3
 80149e0:	0bf6      	bt      	0x80149cc	// 80149cc <_vsnprintf+0x13c>
    if (*format == '.') {
 80149e2:	eb40002e 	cmpnei      	r0, 46
 80149e6:	0b9d      	bt      	0x8014920	// 8014920 <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 80149e8:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 80149ea:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 80149ee:	74cc      	zextb      	r3, r3
 80149f0:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 80149f2:	ec210400 	ori      	r1, r1, 1024
      format++;
 80149f6:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 80149f8:	0813      	bt      	0x8014a1e	// 8014a1e <_vsnprintf+0x18e>
 80149fa:	6d4b      	mov      	r5, r2
 80149fc:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8014a00:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 8014a04:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8014a06:	2500      	addi      	r5, 1
 8014a08:	fa4a8440 	mula.32.l      	r0, r10, r18
 8014a0c:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 8014a10:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8014a12:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8014a16:	74cc      	zextb      	r3, r3
 8014a18:	64c8      	cmphs      	r2, r3
 8014a1a:	0bf6      	bt      	0x8014a06	// 8014a06 <_vsnprintf+0x176>
 8014a1c:	0784      	br      	0x8014924	// 8014924 <_vsnprintf+0x94>
      else if (*format == '*') {
 8014a1e:	eb40002a 	cmpnei      	r0, 42
 8014a22:	e84003e2 	bf      	0x80151e6	// 80151e6 <_vsnprintf+0x956>
      format++;
 8014a26:	6d4b      	mov      	r5, r2
 8014a28:	077c      	br      	0x8014920	// 8014920 <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 8014a2a:	5c6e      	addi      	r3, r4, 4
 8014a2c:	3000      	movi      	r0, 0
 8014a2e:	dac42000 	ld.w      	r22, (r4, 0x0)
 8014a32:	b869      	st.w      	r3, (r14, 0x24)
 8014a34:	6d03      	mov      	r4, r0
            h = bit / 100;
 8014a36:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 8014a3a:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 8014a3e:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 8014a42:	ea15002e 	movi      	r21, 46
 8014a46:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 8014a4a:	c4164043 	lsr      	r3, r22, r0
 8014a4e:	74cc      	zextb      	r3, r3
            h = bit / 100;
 8014a50:	c6838022 	divu      	r2, r3, r20
 8014a54:	7748      	zextb      	r13, r2
            if (h)
 8014a56:	e90d0306 	bez      	r13, 0x8015062	// 8015062 <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 8014a5a:	c6828422 	mult      	r2, r2, r20
 8014a5e:	60ca      	subu      	r3, r2
 8014a60:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 8014a62:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 8014a66:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 8014a6a:	e5840000 	addi      	r12, r4, 1
 8014a6e:	e5ad002f 	addi      	r13, r13, 48
 8014a72:	7730      	zextb      	r12, r12
 8014a74:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 8014a78:	e92202fe 	bnez      	r2, 0x8015074	// 8015074 <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 8014a7c:	1a0c      	addi      	r2, r14, 48
 8014a7e:	2401      	addi      	r4, 2
 8014a80:	7510      	zextb      	r4, r4
 8014a82:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 8014a86:	c6638022 	divu      	r2, r3, r19
 8014a8a:	c6628422 	mult      	r2, r2, r19
 8014a8e:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 8014a90:	1a0c      	addi      	r2, r14, 48
 8014a92:	e5840000 	addi      	r12, r4, 1
 8014a96:	232f      	addi      	r3, 48
 8014a98:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8014a9c:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 8014a9e:	2401      	addi      	r4, 2
 8014aa0:	7510      	zextb      	r4, r4
 8014aa2:	d5820035 	str.b      	r21, (r2, r12 << 0)
 8014aa6:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 8014aa8:	e832ffd1 	bnezad      	r18, 0x8014a4a	// 8014a4a <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8014aac:	e46e002e 	addi      	r3, r14, 47
 8014ab0:	3200      	movi      	r2, 0
 8014ab2:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8014ab6:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8014ab8:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8014abc:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8014abe:	3a40      	cmpnei      	r2, 0
 8014ac0:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8014ac4:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8014ac6:	6c83      	mov      	r2, r0
 8014ac8:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014acc:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8014ad0:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014ad2:	b86b      	st.w      	r3, (r14, 0x2c)
 8014ad4:	e9230333 	bnez      	r3, 0x801513a	// 801513a <_vsnprintf+0x8aa>
          while (l++ < width) {
 8014ad8:	c6220420 	cmphs      	r2, r17
 8014adc:	6ccb      	mov      	r3, r2
 8014ade:	2300      	addi      	r3, 1
 8014ae0:	e86003ff 	bt      	0x80152de	// 80152de <_vsnprintf+0xa4e>
 8014ae4:	c5710023 	addu      	r3, r17, r11
 8014ae8:	5b89      	subu      	r4, r3, r2
 8014aea:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014aec:	e56b0000 	addi      	r11, r11, 1
 8014af0:	6cdf      	mov      	r3, r7
 8014af2:	6c63      	mov      	r1, r8
 8014af4:	3020      	movi      	r0, 32
 8014af6:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014af8:	66d2      	cmpne      	r4, r11
 8014afa:	6caf      	mov      	r2, r11
 8014afc:	0bf8      	bt      	0x8014aec	// 8014aec <_vsnprintf+0x25c>
 8014afe:	e4710000 	addi      	r3, r17, 1
 8014b02:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014b04:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014b08:	e9000030 	bez      	r0, 0x8014b68	// 8014b68 <_vsnprintf+0x2d8>
 8014b0c:	6caf      	mov      	r2, r11
 8014b0e:	e60e002f 	addi      	r16, r14, 48
 8014b12:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014b16:	0402      	br      	0x8014b1a	// 8014b1a <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 8014b18:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014b1a:	e90b0007 	bez      	r11, 0x8014b28	// 8014b28 <_vsnprintf+0x298>
 8014b1e:	e46a1000 	subi      	r3, r10, 1
 8014b22:	e90a034a 	bez      	r10, 0x80151b6	// 80151b6 <_vsnprintf+0x926>
 8014b26:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014b28:	e6100000 	addi      	r16, r16, 1
 8014b2c:	6cdf      	mov      	r3, r7
 8014b2e:	6c63      	mov      	r1, r8
 8014b30:	5a82      	addi      	r4, r2, 1
 8014b32:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014b34:	d8100000 	ld.b      	r0, (r16, 0x0)
 8014b38:	e920fff0 	bnez      	r0, 0x8014b18	// 8014b18 <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 8014b3c:	986b      	ld.w      	r3, (r14, 0x2c)
 8014b3e:	e90302a5 	bez      	r3, 0x8015088	// 8015088 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8014b42:	9868      	ld.w      	r3, (r14, 0x20)
 8014b44:	c6230420 	cmphs      	r3, r17
 8014b48:	e86002a0 	bt      	0x8015088	// 8015088 <_vsnprintf+0x7f8>
 8014b4c:	c4910020 	addu      	r0, r17, r4
 8014b50:	c460008a 	subu      	r10, r0, r3
 8014b54:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8014b56:	e5620000 	addi      	r11, r2, 1
 8014b5a:	6cdf      	mov      	r3, r7
 8014b5c:	6c63      	mov      	r1, r8
 8014b5e:	3020      	movi      	r0, 32
 8014b60:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014b62:	66ea      	cmpne      	r10, r11
 8014b64:	6caf      	mov      	r2, r11
 8014b66:	0bf8      	bt      	0x8014b56	// 8014b56 <_vsnprintf+0x2c6>
        format++;
 8014b68:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014b6a:	9889      	ld.w      	r4, (r14, 0x24)
 8014b6c:	06a1      	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8014b6e:	da042000 	ld.w      	r16, (r4, 0x0)
 8014b72:	5c6e      	addi      	r3, r4, 4
 8014b74:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 8014b76:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 8014b7a:	3300      	movi      	r3, 0
 8014b7c:	2b00      	subi      	r3, 1
 8014b7e:	eb4a0000 	cmpnei      	r10, 0
 8014b82:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 8014b86:	c4104824 	lsli      	r4, r16, 0
 8014b8a:	e9200006 	bnez      	r0, 0x8014b96	// 8014b96 <_vsnprintf+0x306>
 8014b8e:	0408      	br      	0x8014b9e	// 8014b9e <_vsnprintf+0x30e>
 8014b90:	2b00      	subi      	r3, 1
 8014b92:	e9030006 	bez      	r3, 0x8014b9e	// 8014b9e <_vsnprintf+0x30e>
 8014b96:	2400      	addi      	r4, 1
 8014b98:	8440      	ld.b      	r2, (r4, 0x0)
 8014b9a:	e922fffb 	bnez      	r2, 0x8014b90	// 8014b90 <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 8014b9e:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 8014ba2:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 8014ba6:	f944cd23 	min.u32      	r3, r4, r10
 8014baa:	3a40      	cmpnei      	r2, 0
 8014bac:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014bb0:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 8014bb4:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 8014bb6:	b86a      	st.w      	r3, (r14, 0x28)
 8014bb8:	e9230287 	bnez      	r3, 0x80150c6	// 80150c6 <_vsnprintf+0x836>
          while (l++ < width) {
 8014bbc:	c6240420 	cmphs      	r4, r17
 8014bc0:	5c62      	addi      	r3, r4, 1
 8014bc2:	e860039c 	bt      	0x80152fa	// 80152fa <_vsnprintf+0xa6a>
 8014bc6:	c5710023 	addu      	r3, r17, r11
 8014bca:	5b91      	subu      	r4, r3, r4
 8014bcc:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014bce:	e5620000 	addi      	r11, r2, 1
 8014bd2:	6cdf      	mov      	r3, r7
 8014bd4:	6c63      	mov      	r1, r8
 8014bd6:	3020      	movi      	r0, 32
 8014bd8:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014bda:	66d2      	cmpne      	r4, r11
 8014bdc:	6caf      	mov      	r2, r11
 8014bde:	0bf8      	bt      	0x8014bce	// 8014bce <_vsnprintf+0x33e>
 8014be0:	c40b4832 	lsli      	r18, r11, 0
 8014be4:	e4910000 	addi      	r4, r17, 1
 8014be8:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014bec:	e9000391 	bez      	r0, 0x801530e	// 801530e <_vsnprintf+0xa7e>
 8014bf0:	b88b      	st.w      	r4, (r14, 0x2c)
 8014bf2:	c4124822 	lsli      	r2, r18, 0
 8014bf6:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8014bfa:	0402      	br      	0x8014bfe	// 8014bfe <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 8014bfc:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014bfe:	e90b0007 	bez      	r11, 0x8014c0c	// 8014c0c <_vsnprintf+0x37c>
 8014c02:	e46a1000 	subi      	r3, r10, 1
 8014c06:	e90a02d2 	bez      	r10, 0x80151aa	// 80151aa <_vsnprintf+0x91a>
 8014c0a:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 8014c0c:	e6100000 	addi      	r16, r16, 1
 8014c10:	6cdf      	mov      	r3, r7
 8014c12:	6c63      	mov      	r1, r8
 8014c14:	5a82      	addi      	r4, r2, 1
 8014c16:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014c18:	d8100000 	ld.b      	r0, (r16, 0x0)
 8014c1c:	e920fff0 	bnez      	r0, 0x8014bfc	// 8014bfc <_vsnprintf+0x36c>
 8014c20:	6ed3      	mov      	r11, r4
 8014c22:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 8014c24:	986a      	ld.w      	r3, (r14, 0x28)
 8014c26:	e9030012 	bez      	r3, 0x8014c4a	// 8014c4a <_vsnprintf+0x3ba>
          while (l++ < width) {
 8014c2a:	c6240420 	cmphs      	r4, r17
 8014c2e:	080e      	bt      	0x8014c4a	// 8014c4a <_vsnprintf+0x3ba>
 8014c30:	c5710020 	addu      	r0, r17, r11
 8014c34:	5891      	subu      	r4, r0, r4
 8014c36:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014c38:	e56b0000 	addi      	r11, r11, 1
 8014c3c:	6cdf      	mov      	r3, r7
 8014c3e:	6c63      	mov      	r1, r8
 8014c40:	3020      	movi      	r0, 32
 8014c42:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014c44:	66d2      	cmpne      	r4, r11
 8014c46:	6caf      	mov      	r2, r11
 8014c48:	0bf8      	bt      	0x8014c38	// 8014c38 <_vsnprintf+0x3a8>
        format++;
 8014c4a:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 8014c4c:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 8014c4e:	0630      	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014c50:	3308      	movi      	r3, 8
 8014c52:	b864      	st.w      	r3, (r14, 0x10)
 8014c54:	3310      	movi      	r3, 16
 8014c56:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 8014c58:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014c5c:	3300      	movi      	r3, 0
 8014c5e:	b825      	st.w      	r1, (r14, 0x14)
 8014c60:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014c64:	b861      	st.w      	r3, (r14, 0x4)
 8014c66:	9460      	ld.w      	r3, (r4, 0x0)
 8014c68:	b860      	st.w      	r3, (r14, 0x0)
 8014c6a:	6caf      	mov      	r2, r11
 8014c6c:	6cdf      	mov      	r3, r7
 8014c6e:	6c63      	mov      	r1, r8
 8014c70:	6c1b      	mov      	r0, r6
 8014c72:	e6040003 	addi      	r16, r4, 4
 8014c76:	e3fff8a9 	bsr      	0x8013dc8	// 8013dc8 <_ntoa_long>
 8014c7a:	6ec3      	mov      	r11, r0
        format++;
 8014c7c:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014c7e:	c4104824 	lsli      	r4, r16, 0
        break;
 8014c82:	0616      	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 8014c84:	e4212002 	andi      	r1, r1, 2
 8014c88:	e9210227 	bnez      	r1, 0x80150d6	// 80150d6 <_vsnprintf+0x846>
          while (l++ < width) {
 8014c8c:	3301      	movi      	r3, 1
 8014c8e:	c6230420 	cmphs      	r3, r17
 8014c92:	e860032f 	bt      	0x80152f0	// 80152f0 <_vsnprintf+0xa60>
 8014c96:	e60b1000 	subi      	r16, r11, 1
 8014c9a:	c6300030 	addu      	r16, r16, r17
 8014c9e:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014ca0:	e5420000 	addi      	r10, r2, 1
 8014ca4:	6cdf      	mov      	r3, r7
 8014ca6:	6c63      	mov      	r1, r8
 8014ca8:	3020      	movi      	r0, 32
 8014caa:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014cac:	c5500480 	cmpne      	r16, r10
 8014cb0:	6cab      	mov      	r2, r10
 8014cb2:	0bf7      	bt      	0x8014ca0	// 8014ca0 <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014cb4:	8400      	ld.b      	r0, (r4, 0x0)
 8014cb6:	e6040003 	addi      	r16, r4, 4
 8014cba:	6cdf      	mov      	r3, r7
 8014cbc:	6cab      	mov      	r2, r10
 8014cbe:	6c63      	mov      	r1, r8
 8014cc0:	e56a0000 	addi      	r11, r10, 1
 8014cc4:	7bd9      	jsr      	r6
 8014cc6:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014cca:	2500      	addi      	r5, 1
        break;
 8014ccc:	e800fdf1 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 8014cd0:	eb400078 	cmpnei      	r0, 120
 8014cd4:	e8400277 	bf      	0x80151c2	// 80151c2 <_vsnprintf+0x932>
 8014cd8:	eb400058 	cmpnei      	r0, 88
 8014cdc:	e8400275 	bf      	0x80151c6	// 80151c6 <_vsnprintf+0x936>
        else if (*format == 'o') {
 8014ce0:	eb40006f 	cmpnei      	r0, 111
 8014ce4:	e8400232 	bf      	0x8015148	// 8015148 <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 8014ce8:	eb400062 	cmpnei      	r0, 98
 8014cec:	e84002d5 	bf      	0x8015296	// 8015296 <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 8014cf0:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8014cf4:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 8014cf8:	e8600232 	bt      	0x801515c	// 801515c <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 8014cfc:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 8014d00:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 8014d02:	e9010236 	bez      	r1, 0x801516e	// 801516e <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 8014d06:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 8014d08:	eb400069 	cmpnei      	r0, 105
 8014d0c:	e8400231 	bf      	0x801516e	// 801516e <_vsnprintf+0x8de>
 8014d10:	eb400064 	cmpnei      	r0, 100
 8014d14:	e840022d 	bf      	0x801516e	// 801516e <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 8014d18:	e4232200 	andi      	r1, r3, 512
 8014d1c:	e9210276 	bnez      	r1, 0x8015208	// 8015208 <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 8014d20:	e4032100 	andi      	r0, r3, 256
 8014d24:	e92002a2 	bnez      	r0, 0x8015268	// 8015268 <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8014d28:	e4232040 	andi      	r1, r3, 64
 8014d2c:	e92102cf 	bnez      	r1, 0x80152ca	// 80152ca <_vsnprintf+0xa3a>
 8014d30:	e4232080 	andi      	r1, r3, 128
 8014d34:	e92102b3 	bnez      	r1, 0x801529a	// 801529a <_vsnprintf+0xa0a>
 8014d38:	9420      	ld.w      	r1, (r4, 0x0)
 8014d3a:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 8014d3c:	b865      	st.w      	r3, (r14, 0x14)
 8014d3e:	3300      	movi      	r3, 0
 8014d40:	de2e2004 	st.w      	r17, (r14, 0x10)
 8014d44:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014d48:	b842      	st.w      	r2, (r14, 0x8)
 8014d4a:	b861      	st.w      	r3, (r14, 0x4)
 8014d4c:	b820      	st.w      	r1, (r14, 0x0)
 8014d4e:	6caf      	mov      	r2, r11
 8014d50:	6cdf      	mov      	r3, r7
 8014d52:	6c63      	mov      	r1, r8
 8014d54:	6c1b      	mov      	r0, r6
 8014d56:	e3fff839 	bsr      	0x8013dc8	// 8013dc8 <_ntoa_long>
 8014d5a:	6ec3      	mov      	r11, r0
        format++;
 8014d5c:	2500      	addi      	r5, 1
 8014d5e:	e800fda8 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8014d62:	eb400046 	cmpnei      	r0, 70
 8014d66:	e840023c 	bf      	0x80151de	// 80151de <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014d6a:	b824      	st.w      	r1, (r14, 0x10)
 8014d6c:	de2e2003 	st.w      	r17, (r14, 0xc)
 8014d70:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8014d74:	e6040007 	addi      	r16, r4, 8
 8014d78:	9460      	ld.w      	r3, (r4, 0x0)
 8014d7a:	9481      	ld.w      	r4, (r4, 0x4)
 8014d7c:	b860      	st.w      	r3, (r14, 0x0)
 8014d7e:	b881      	st.w      	r4, (r14, 0x4)
 8014d80:	6caf      	mov      	r2, r11
 8014d82:	6cdf      	mov      	r3, r7
 8014d84:	6c63      	mov      	r1, r8
 8014d86:	6c1b      	mov      	r0, r6
 8014d88:	e3fff8f2 	bsr      	0x8013f6c	// 8013f6c <_ftoa>
 8014d8c:	6ec3      	mov      	r11, r0
        format++;
 8014d8e:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014d90:	c4104824 	lsli      	r4, r16, 0
        break;
 8014d94:	e800fd8d 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 8014d98:	6caf      	mov      	r2, r11
 8014d9a:	e54b0000 	addi      	r10, r11, 1
 8014d9e:	6cdf      	mov      	r3, r7
 8014da0:	6c63      	mov      	r1, r8
 8014da2:	3025      	movi      	r0, 37
 8014da4:	7bd9      	jsr      	r6
        format++;
 8014da6:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 8014da8:	6eeb      	mov      	r11, r10
        break;
 8014daa:	e800fd82 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 8014dae:	5c6e      	addi      	r3, r4, 4
 8014db0:	dac42000 	ld.w      	r22, (r4, 0x0)
 8014db4:	b869      	st.w      	r3, (r14, 0x24)
 8014db6:	e716000f 	addi      	r24, r22, 16
 8014dba:	3400      	movi      	r4, 0
                if (h > 9)
 8014dbc:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 8014dc0:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 8014dc4:	ea0c0000 	movi      	r12, 0
 8014dc8:	da562000 	ld.w      	r18, (r22, 0x0)
 8014dcc:	6c33      	mov      	r0, r12
 8014dce:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 8014dd2:	c5924043 	lsr      	r3, r18, r12
 8014dd6:	74cc      	zextb      	r3, r3
                h = m >> 4;
 8014dd8:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 8014dda:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 8014dde:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 8014de2:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 8014de6:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 8014dea:	092e      	bt      	0x8015046	// 8015046 <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 8014dec:	e6ae002f 	addi      	r21, r14, 48
 8014df0:	2236      	addi      	r2, 55
 8014df2:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 8014df6:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 8014dfa:	e4930000 	addi      	r4, r19, 1
 8014dfe:	7510      	zextb      	r4, r4
                if (l > 9)
 8014e00:	091e      	bt      	0x801503c	// 801503c <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 8014e02:	1a0c      	addi      	r2, r14, 48
 8014e04:	2336      	addi      	r3, 55
 8014e06:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 8014e0a:	e4602001 	andi      	r3, r0, 1
 8014e0e:	e9030007 	bez      	r3, 0x8014e1c	// 8014e1c <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 8014e12:	1a0c      	addi      	r2, r14, 48
 8014e14:	5c62      	addi      	r3, r4, 1
 8014e16:	d4820037 	str.b      	r23, (r2, r4 << 0)
 8014e1a:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 8014e1c:	2000      	addi      	r0, 1
 8014e1e:	7400      	zextb      	r0, r0
 8014e20:	e58c0007 	addi      	r12, r12, 8
 8014e24:	e82dffd7 	bnezad      	r13, 0x8014dd2	// 8014dd2 <_vsnprintf+0x542>
            inuint++;
 8014e28:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 8014e2c:	c6d80480 	cmpne      	r24, r22
 8014e30:	0bca      	bt      	0x8014dc4	// 8014dc4 <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 8014e32:	e46e002e 	addi      	r3, r14, 47
 8014e36:	3200      	movi      	r2, 0
 8014e38:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8014e3c:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8014e3e:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8014e42:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8014e44:	3a40      	cmpnei      	r2, 0
 8014e46:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8014e4a:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8014e4c:	6c83      	mov      	r2, r0
 8014e4e:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014e52:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8014e56:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014e58:	b86b      	st.w      	r3, (r14, 0x2c)
 8014e5a:	e923015a 	bnez      	r3, 0x801510e	// 801510e <_vsnprintf+0x87e>
          while (l++ < width) {
 8014e5e:	c6220420 	cmphs      	r2, r17
 8014e62:	6ccb      	mov      	r3, r2
 8014e64:	2300      	addi      	r3, 1
 8014e66:	e8600239 	bt      	0x80152d8	// 80152d8 <_vsnprintf+0xa48>
 8014e6a:	c5710023 	addu      	r3, r17, r11
 8014e6e:	5b89      	subu      	r4, r3, r2
 8014e70:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014e72:	e56b0000 	addi      	r11, r11, 1
 8014e76:	6cdf      	mov      	r3, r7
 8014e78:	6c63      	mov      	r1, r8
 8014e7a:	3020      	movi      	r0, 32
 8014e7c:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014e7e:	66d2      	cmpne      	r4, r11
 8014e80:	6caf      	mov      	r2, r11
 8014e82:	0bf8      	bt      	0x8014e72	// 8014e72 <_vsnprintf+0x5e2>
 8014e84:	e4710000 	addi      	r3, r17, 1
 8014e88:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014e8a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014e8e:	e900fe6d 	bez      	r0, 0x8014b68	// 8014b68 <_vsnprintf+0x2d8>
 8014e92:	6caf      	mov      	r2, r11
 8014e94:	e60e002f 	addi      	r16, r14, 48
 8014e98:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014e9c:	0402      	br      	0x8014ea0	// 8014ea0 <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 8014e9e:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014ea0:	e90b0007 	bez      	r11, 0x8014eae	// 8014eae <_vsnprintf+0x61e>
 8014ea4:	e46a1000 	subi      	r3, r10, 1
 8014ea8:	e90a0185 	bez      	r10, 0x80151b2	// 80151b2 <_vsnprintf+0x922>
 8014eac:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014eae:	e6100000 	addi      	r16, r16, 1
 8014eb2:	6cdf      	mov      	r3, r7
 8014eb4:	6c63      	mov      	r1, r8
 8014eb6:	5a82      	addi      	r4, r2, 1
 8014eb8:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014eba:	d8100000 	ld.b      	r0, (r16, 0x0)
 8014ebe:	e920fff0 	bnez      	r0, 0x8014e9e	// 8014e9e <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 8014ec2:	986b      	ld.w      	r3, (r14, 0x2c)
 8014ec4:	e90300e2 	bez      	r3, 0x8015088	// 8015088 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8014ec8:	9868      	ld.w      	r3, (r14, 0x20)
 8014eca:	c6230420 	cmphs      	r3, r17
 8014ece:	08dd      	bt      	0x8015088	// 8015088 <_vsnprintf+0x7f8>
 8014ed0:	c4910020 	addu      	r0, r17, r4
 8014ed4:	c460008a 	subu      	r10, r0, r3
 8014ed8:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8014eda:	e5620000 	addi      	r11, r2, 1
 8014ede:	6cdf      	mov      	r3, r7
 8014ee0:	6c63      	mov      	r1, r8
 8014ee2:	3020      	movi      	r0, 32
 8014ee4:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014ee6:	66ea      	cmpne      	r10, r11
 8014ee8:	6caf      	mov      	r2, r11
 8014eea:	0bf8      	bt      	0x8014eda	// 8014eda <_vsnprintf+0x64a>
        format++;
 8014eec:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014eee:	9889      	ld.w      	r4, (r14, 0x24)
 8014ef0:	e800fcdf 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8014ef4:	5c6e      	addi      	r3, r4, 4
 8014ef6:	b869      	st.w      	r3, (r14, 0x24)
 8014ef8:	da642000 	ld.w      	r19, (r4, 0x0)
 8014efc:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 8014efe:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 8014f02:	ea15002d 	movi      	r21, 45
 8014f06:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8014f0a:	d8730000 	ld.b      	r3, (r19, 0x0)
 8014f0e:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 8014f10:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 8014f14:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8014f18:	089d      	bt      	0x8015052	// 8015052 <_vsnprintf+0x7c2>
        if (lbit > 9)
 8014f1a:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 8014f1e:	2036      	addi      	r0, 55
 8014f20:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8014f22:	089d      	bt      	0x801505c	// 801505c <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 8014f24:	2336      	addi      	r3, 55
 8014f26:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 8014f28:	dea20002 	st.b      	r21, (r2, 0x2)
 8014f2c:	e6730000 	addi      	r19, r19, 1
 8014f30:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 8014f32:	e832ffec 	bnezad      	r18, 0x8014f0a	// 8014f0a <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 8014f36:	3300      	movi      	r3, 0
 8014f38:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 8014f3c:	e4612400 	andi      	r3, r1, 1024
 8014f40:	b86a      	st.w      	r3, (r14, 0x28)
 8014f42:	e90300f3 	bez      	r3, 0x8015128	// 8015128 <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 8014f46:	ea100011 	movi      	r16, 17
 8014f4a:	fa0acd23 	min.u32      	r3, r10, r16
 8014f4e:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014f50:	e4612002 	andi      	r3, r1, 2
 8014f54:	b86b      	st.w      	r3, (r14, 0x2c)
 8014f56:	e92300e2 	bnez      	r3, 0x801511a	// 801511a <_vsnprintf+0x88a>
          while (l++ < width) {
 8014f5a:	9848      	ld.w      	r2, (r14, 0x20)
 8014f5c:	c6220420 	cmphs      	r2, r17
 8014f60:	6ccb      	mov      	r3, r2
 8014f62:	2300      	addi      	r3, 1
 8014f64:	09c9      	bt      	0x80152f6	// 80152f6 <_vsnprintf+0xa66>
 8014f66:	c5710023 	addu      	r3, r17, r11
 8014f6a:	c4430090 	subu      	r16, r3, r2
 8014f6e:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014f70:	e56b0000 	addi      	r11, r11, 1
 8014f74:	6cdf      	mov      	r3, r7
 8014f76:	6c63      	mov      	r1, r8
 8014f78:	3020      	movi      	r0, 32
 8014f7a:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014f7c:	c60b0480 	cmpne      	r11, r16
 8014f80:	6caf      	mov      	r2, r11
 8014f82:	0bf7      	bt      	0x8014f70	// 8014f70 <_vsnprintf+0x6e0>
 8014f84:	e4710000 	addi      	r3, r17, 1
 8014f88:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014f8a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014f8e:	e900fded 	bez      	r0, 0x8014b68	// 8014b68 <_vsnprintf+0x2d8>
 8014f92:	6caf      	mov      	r2, r11
 8014f94:	1c0c      	addi      	r4, r14, 48
 8014f96:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014f9a:	0403      	br      	0x8014fa0	// 8014fa0 <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 8014f9c:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014fa0:	e90b0007 	bez      	r11, 0x8014fae	// 8014fae <_vsnprintf+0x71e>
 8014fa4:	e46a1000 	subi      	r3, r10, 1
 8014fa8:	e90a010a 	bez      	r10, 0x80151bc	// 80151bc <_vsnprintf+0x92c>
 8014fac:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014fae:	2400      	addi      	r4, 1
 8014fb0:	6cdf      	mov      	r3, r7
 8014fb2:	6c63      	mov      	r1, r8
 8014fb4:	e6020000 	addi      	r16, r2, 1
 8014fb8:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014fba:	8400      	ld.b      	r0, (r4, 0x0)
 8014fbc:	e920fff0 	bnez      	r0, 0x8014f9c	// 8014f9c <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 8014fc0:	986b      	ld.w      	r3, (r14, 0x2c)
 8014fc2:	e90300b6 	bez      	r3, 0x801512e	// 801512e <_vsnprintf+0x89e>
          while (l++ < width) {
 8014fc6:	9868      	ld.w      	r3, (r14, 0x20)
 8014fc8:	c6230420 	cmphs      	r3, r17
 8014fcc:	08b1      	bt      	0x801512e	// 801512e <_vsnprintf+0x89e>
 8014fce:	c6110020 	addu      	r0, r17, r16
 8014fd2:	588d      	subu      	r4, r0, r3
 8014fd4:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 8014fd8:	e5620000 	addi      	r11, r2, 1
 8014fdc:	6cdf      	mov      	r3, r7
 8014fde:	6c63      	mov      	r1, r8
 8014fe0:	3020      	movi      	r0, 32
 8014fe2:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014fe4:	652e      	cmpne      	r11, r4
 8014fe6:	6caf      	mov      	r2, r11
 8014fe8:	0bf8      	bt      	0x8014fd8	// 8014fd8 <_vsnprintf+0x748>
        format++;
 8014fea:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014fec:	9889      	ld.w      	r4, (r14, 0x24)
 8014fee:	e800fc60 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 8014ff2:	e46020df 	andi      	r3, r0, 223
 8014ff6:	eb430047 	cmpnei      	r3, 71
 8014ffa:	0805      	bt      	0x8015004	// 8015004 <_vsnprintf+0x774>
 8014ffc:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 8015000:	e40020fd 	andi      	r0, r0, 253
 8015004:	eb400045 	cmpnei      	r0, 69
 8015008:	0803      	bt      	0x801500e	// 801500e <_vsnprintf+0x77e>
 801500a:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 801500e:	b824      	st.w      	r1, (r14, 0x10)
 8015010:	de2e2003 	st.w      	r17, (r14, 0xc)
 8015014:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8015018:	e6040007 	addi      	r16, r4, 8
 801501c:	9460      	ld.w      	r3, (r4, 0x0)
 801501e:	9481      	ld.w      	r4, (r4, 0x4)
 8015020:	b860      	st.w      	r3, (r14, 0x0)
 8015022:	b881      	st.w      	r4, (r14, 0x4)
 8015024:	6caf      	mov      	r2, r11
 8015026:	6cdf      	mov      	r3, r7
 8015028:	6c63      	mov      	r1, r8
 801502a:	6c1b      	mov      	r0, r6
 801502c:	e3fff9ec 	bsr      	0x8014404	// 8014404 <_etoa>
 8015030:	6ec3      	mov      	r11, r0
        format++;
 8015032:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8015034:	c4104824 	lsli      	r4, r16, 0
        break;
 8015038:	e800fc3b 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 801503c:	1a0c      	addi      	r2, r14, 48
 801503e:	232f      	addi      	r3, 48
 8015040:	d6620023 	str.b      	r3, (r2, r19 << 0)
 8015044:	06e3      	br      	0x8014e0a	// 8014e0a <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 8015046:	e6ae002f 	addi      	r21, r14, 48
 801504a:	222f      	addi      	r2, 48
 801504c:	d4950022 	str.b      	r2, (r21, r4 << 0)
 8015050:	06d3      	br      	0x8014df6	// 8014df6 <_vsnprintf+0x566>
        if (lbit > 9)
 8015052:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 8015056:	202f      	addi      	r0, 48
 8015058:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 801505a:	0f65      	bf      	0x8014f24	// 8014f24 <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 801505c:	232f      	addi      	r3, 48
 801505e:	a261      	st.b      	r3, (r2, 0x1)
 8015060:	0764      	br      	0x8014f28	// 8014f28 <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 8015062:	c6828422 	mult      	r2, r2, r20
 8015066:	60ca      	subu      	r3, r2
 8015068:	74cc      	zextb      	r3, r3
 801506a:	c6638022 	divu      	r2, r3, r19
            if (m)
 801506e:	e902fd0c 	bez      	r2, 0x8014a86	// 8014a86 <_vsnprintf+0x1f6>
 8015072:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 8015074:	e5ae002f 	addi      	r13, r14, 48
 8015078:	e48c0000 	addi      	r4, r12, 1
 801507c:	222f      	addi      	r2, 48
 801507e:	7510      	zextb      	r4, r4
 8015080:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 8015084:	e800fd01 	br      	0x8014a86	// 8014a86 <_vsnprintf+0x1f6>
          while (l++ < width) {
 8015088:	6ed3      	mov      	r11, r4
        format++;
 801508a:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 801508c:	9889      	ld.w      	r4, (r14, 0x24)
 801508e:	e800fc10 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
 8015092:	6caf      	mov      	r2, r11
 8015094:	e800fc81 	br      	0x8014996	// 8014996 <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 8015098:	9400      	ld.w      	r0, (r4, 0x0)
 801509a:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 801509c:	e98000af 	blz      	r0, 0x80151fa	// 80151fa <_vsnprintf+0x96a>
        width = (unsigned int)w;
 80150a0:	c4004831 	lsli      	r17, r0, 0
 80150a4:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 80150a6:	6d0f      	mov      	r4, r3
      format++;
 80150a8:	5aa2      	addi      	r5, r2, 1
 80150aa:	e800fc38 	br      	0x801491a	// 801491a <_vsnprintf+0x8a>
 80150ae:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 80150b0:	ec2100c0 	ori      	r1, r1, 192
          format++;
 80150b4:	2501      	addi      	r5, 2
 80150b6:	e800fc47 	br      	0x8014944	// 8014944 <_vsnprintf+0xb4>
 80150ba:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 80150bc:	ec210300 	ori      	r1, r1, 768
          format++;
 80150c0:	2501      	addi      	r5, 2
 80150c2:	e800fc41 	br      	0x8014944	// 8014944 <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80150c6:	e900fdb2 	bez      	r0, 0x8014c2a	// 8014c2a <_vsnprintf+0x39a>
 80150ca:	6caf      	mov      	r2, r11
 80150cc:	b88b      	st.w      	r4, (r14, 0x2c)
 80150ce:	d96e2009 	ld.w      	r11, (r14, 0x24)
 80150d2:	e800fd96 	br      	0x8014bfe	// 8014bfe <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80150d6:	6cdf      	mov      	r3, r7
 80150d8:	6caf      	mov      	r2, r11
 80150da:	6c63      	mov      	r1, r8
 80150dc:	8400      	ld.b      	r0, (r4, 0x0)
 80150de:	7bd9      	jsr      	r6
          while (l++ < width) {
 80150e0:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80150e4:	e6040003 	addi      	r16, r4, 4
 80150e8:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 80150ec:	0cfc      	bf      	0x80152e4	// 80152e4 <_vsnprintf+0xa54>
 80150ee:	c571002b 	addu      	r11, r17, r11
 80150f2:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 80150f4:	5a82      	addi      	r4, r2, 1
 80150f6:	6cdf      	mov      	r3, r7
 80150f8:	6c63      	mov      	r1, r8
 80150fa:	3020      	movi      	r0, 32
 80150fc:	7bd9      	jsr      	r6
          while (l++ < width) {
 80150fe:	652e      	cmpne      	r11, r4
 8015100:	6c93      	mov      	r2, r4
 8015102:	0bf9      	bt      	0x80150f4	// 80150f4 <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8015104:	c4104824 	lsli      	r4, r16, 0
        format++;
 8015108:	2500      	addi      	r5, 1
 801510a:	e800fbd2 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801510e:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8015112:	e920fec0 	bnez      	r0, 0x8014e92	// 8014e92 <_vsnprintf+0x602>
 8015116:	6d2f      	mov      	r4, r11
 8015118:	06d8      	br      	0x8014ec8	// 8014ec8 <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801511a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801511e:	e920ff3a 	bnez      	r0, 0x8014f92	// 8014f92 <_vsnprintf+0x702>
 8015122:	c40b4830 	lsli      	r16, r11, 0
 8015126:	0750      	br      	0x8014fc6	// 8014fc6 <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 8015128:	3311      	movi      	r3, 17
 801512a:	b868      	st.w      	r3, (r14, 0x20)
 801512c:	0712      	br      	0x8014f50	// 8014f50 <_vsnprintf+0x6c0>
          while (l++ < width) {
 801512e:	c410482b 	lsli      	r11, r16, 0
        format++;
 8015132:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8015134:	9889      	ld.w      	r4, (r14, 0x24)
 8015136:	e800fbbc 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801513a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801513e:	e920fce7 	bnez      	r0, 0x8014b0c	// 8014b0c <_vsnprintf+0x27c>
 8015142:	6d2f      	mov      	r4, r11
 8015144:	e800fcff 	br      	0x8014b42	// 8014b42 <_vsnprintf+0x2b2>
          base =  8U;
 8015148:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 801514a:	c4412823 	bclri      	r3, r1, 2
 801514e:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8015150:	e4212400 	andi      	r1, r1, 1024
 8015154:	e901fdda 	bez      	r1, 0x8014d08	// 8014d08 <_vsnprintf+0x478>
 8015158:	e800fdd7 	br      	0x8014d06	// 8014d06 <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 801515c:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8015160:	6c4f      	mov      	r1, r3
          base = 10U;
 8015162:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 8015164:	0bf3      	bt      	0x801514a	// 801514a <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 8015166:	e4232400 	andi      	r1, r3, 1024
 801516a:	e921fdce 	bnez      	r1, 0x8014d06	// 8014d06 <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 801516e:	e4232200 	andi      	r1, r3, 512
 8015172:	e9210066 	bnez      	r1, 0x801523e	// 801523e <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 8015176:	e4032100 	andi      	r0, r3, 256
 801517a:	e9200099 	bnez      	r0, 0x80152ac	// 80152ac <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801517e:	e4232040 	andi      	r1, r3, 64
 8015182:	e92100a8 	bnez      	r1, 0x80152d2	// 80152d2 <_vsnprintf+0xa42>
 8015186:	e4232080 	andi      	r1, r3, 128
 801518a:	e921008c 	bnez      	r1, 0x80152a2	// 80152a2 <_vsnprintf+0xa12>
 801518e:	9420      	ld.w      	r1, (r4, 0x0)
 8015190:	491f      	lsri      	r0, r1, 31
 8015192:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8015194:	b865      	st.w      	r3, (r14, 0x14)
 8015196:	de2e2004 	st.w      	r17, (r14, 0x10)
 801519a:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801519e:	b842      	st.w      	r2, (r14, 0x8)
 80151a0:	b801      	st.w      	r0, (r14, 0x4)
 80151a2:	c4010201 	abs      	r1, r1
 80151a6:	e800fdd3 	br      	0x8014d4c	// 8014d4c <_vsnprintf+0x4bc>
 80151aa:	988b      	ld.w      	r4, (r14, 0x2c)
 80151ac:	6ecb      	mov      	r11, r2
 80151ae:	e800fd3b 	br      	0x8014c24	// 8014c24 <_vsnprintf+0x394>
 80151b2:	6d0b      	mov      	r4, r2
 80151b4:	0687      	br      	0x8014ec2	// 8014ec2 <_vsnprintf+0x632>
 80151b6:	6d0b      	mov      	r4, r2
 80151b8:	e800fcc2 	br      	0x8014b3c	// 8014b3c <_vsnprintf+0x2ac>
 80151bc:	c4024830 	lsli      	r16, r2, 0
 80151c0:	0700      	br      	0x8014fc0	// 8014fc0 <_vsnprintf+0x730>
          base = 16U;
 80151c2:	3210      	movi      	r2, 16
 80151c4:	07c3      	br      	0x801514a	// 801514a <_vsnprintf+0x8ba>
 80151c6:	c4412823 	bclri      	r3, r1, 2
 80151ca:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80151cc:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 80151d0:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 80151d4:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 80151d6:	e921fd98 	bnez      	r1, 0x8014d06	// 8014d06 <_vsnprintf+0x476>
 80151da:	e800fd9f 	br      	0x8014d18	// 8014d18 <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 80151de:	ec210020 	ori      	r1, r1, 32
 80151e2:	e800fdc4 	br      	0x8014d6a	// 8014d6a <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 80151e6:	d9a42000 	ld.w      	r13, (r4, 0x0)
 80151ea:	3300      	movi      	r3, 0
 80151ec:	8502      	ld.b      	r0, (r5, 0x2)
 80151ee:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 80151f2:	2403      	addi      	r4, 4
        format++;
 80151f4:	2501      	addi      	r5, 2
 80151f6:	e800fb97 	br      	0x8014924	// 8014924 <_vsnprintf+0x94>
        width = (unsigned int)-w;
 80151fa:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 80151fe:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 8015202:	c40c0091 	subu      	r17, r12, r0
 8015206:	074f      	br      	0x80150a4	// 80150a4 <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8015208:	b867      	st.w      	r3, (r14, 0x1c)
 801520a:	3300      	movi      	r3, 0
 801520c:	de2e2006 	st.w      	r17, (r14, 0x18)
 8015210:	dd4e2005 	st.w      	r10, (r14, 0x14)
 8015214:	b843      	st.w      	r2, (r14, 0xc)
 8015216:	b864      	st.w      	r3, (r14, 0x10)
 8015218:	b862      	st.w      	r3, (r14, 0x8)
 801521a:	e6040007 	addi      	r16, r4, 8
 801521e:	9460      	ld.w      	r3, (r4, 0x0)
 8015220:	9481      	ld.w      	r4, (r4, 0x4)
 8015222:	b860      	st.w      	r3, (r14, 0x0)
 8015224:	b881      	st.w      	r4, (r14, 0x4)
 8015226:	6caf      	mov      	r2, r11
 8015228:	6cdf      	mov      	r3, r7
 801522a:	6c63      	mov      	r1, r8
 801522c:	6c1b      	mov      	r0, r6
 801522e:	e3fff62d 	bsr      	0x8013e88	// 8013e88 <_ntoa_long_long>
 8015232:	6ec3      	mov      	r11, r0
 8015234:	c4104824 	lsli      	r4, r16, 0
        format++;
 8015238:	2500      	addi      	r5, 1
 801523a:	e800fb3a 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 801523e:	9421      	ld.w      	r1, (r4, 0x4)
 8015240:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8015242:	b867      	st.w      	r3, (r14, 0x1c)
 8015244:	3300      	movi      	r3, 0
 8015246:	b864      	st.w      	r3, (r14, 0x10)
 8015248:	497f      	lsri      	r3, r1, 31
 801524a:	b843      	st.w      	r2, (r14, 0xc)
 801524c:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 801524e:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8015252:	de2e2006 	st.w      	r17, (r14, 0x18)
 8015256:	dd4e2005 	st.w      	r10, (r14, 0x14)
 801525a:	6c83      	mov      	r2, r0
 801525c:	6cc7      	mov      	r3, r1
 801525e:	e9810053 	blz      	r1, 0x8015304	// 8015304 <_vsnprintf+0xa74>
 8015262:	b840      	st.w      	r2, (r14, 0x0)
 8015264:	b861      	st.w      	r3, (r14, 0x4)
 8015266:	07e0      	br      	0x8015226	// 8015226 <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 8015268:	b865      	st.w      	r3, (r14, 0x14)
 801526a:	de2e2004 	st.w      	r17, (r14, 0x10)
 801526e:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8015272:	b842      	st.w      	r2, (r14, 0x8)
 8015274:	b821      	st.w      	r1, (r14, 0x4)
 8015276:	9460      	ld.w      	r3, (r4, 0x0)
 8015278:	e6040003 	addi      	r16, r4, 4
 801527c:	b860      	st.w      	r3, (r14, 0x0)
 801527e:	6caf      	mov      	r2, r11
 8015280:	6cdf      	mov      	r3, r7
 8015282:	6c63      	mov      	r1, r8
 8015284:	6c1b      	mov      	r0, r6
 8015286:	e3fff5a1 	bsr      	0x8013dc8	// 8013dc8 <_ntoa_long>
 801528a:	6ec3      	mov      	r11, r0
 801528c:	c4104824 	lsli      	r4, r16, 0
        format++;
 8015290:	2500      	addi      	r5, 1
 8015292:	e800fb0e 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
          base =  2U;
 8015296:	3202      	movi      	r2, 2
 8015298:	0759      	br      	0x801514a	// 801514a <_vsnprintf+0x8ba>
 801529a:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 801529c:	2403      	addi      	r4, 4
 801529e:	e800fd4f 	br      	0x8014d3c	// 8014d3c <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 80152a2:	d8245000 	ld.hs      	r1, (r4, 0x0)
 80152a6:	491f      	lsri      	r0, r1, 31
 80152a8:	2403      	addi      	r4, 4
 80152aa:	0775      	br      	0x8015194	// 8015194 <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 80152ac:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80152ae:	b865      	st.w      	r3, (r14, 0x14)
 80152b0:	497f      	lsri      	r3, r1, 31
 80152b2:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 80152b6:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80152ba:	de2e2004 	st.w      	r17, (r14, 0x10)
 80152be:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80152c2:	b842      	st.w      	r2, (r14, 0x8)
 80152c4:	b861      	st.w      	r3, (r14, 0x4)
 80152c6:	b820      	st.w      	r1, (r14, 0x0)
 80152c8:	07db      	br      	0x801527e	// 801527e <_vsnprintf+0x9ee>
 80152ca:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 80152cc:	2403      	addi      	r4, 4
 80152ce:	e800fd37 	br      	0x8014d3c	// 8014d3c <_vsnprintf+0x4ac>
 80152d2:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 80152d4:	2403      	addi      	r4, 4
 80152d6:	075f      	br      	0x8015194	// 8015194 <_vsnprintf+0x904>
          while (l++ < width) {
 80152d8:	b868      	st.w      	r3, (r14, 0x20)
 80152da:	e800fdd8 	br      	0x8014e8a	// 8014e8a <_vsnprintf+0x5fa>
          while (l++ < width) {
 80152de:	b868      	st.w      	r3, (r14, 0x20)
 80152e0:	e800fc12 	br      	0x8014b04	// 8014b04 <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80152e4:	c4104824 	lsli      	r4, r16, 0
 80152e8:	6eeb      	mov      	r11, r10
        format++;
 80152ea:	2500      	addi      	r5, 1
 80152ec:	e800fae1 	br      	0x80148ae	// 80148ae <_vsnprintf+0x1e>
          while (l++ < width) {
 80152f0:	6eaf      	mov      	r10, r11
 80152f2:	e800fce1 	br      	0x8014cb4	// 8014cb4 <_vsnprintf+0x424>
          while (l++ < width) {
 80152f6:	b868      	st.w      	r3, (r14, 0x20)
 80152f8:	0649      	br      	0x8014f8a	// 8014f8a <_vsnprintf+0x6fa>
          while (l++ < width) {
 80152fa:	6d0f      	mov      	r4, r3
 80152fc:	c40b4832 	lsli      	r18, r11, 0
 8015300:	e800fc76 	br      	0x8014bec	// 8014bec <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8015304:	3000      	movi      	r0, 0
 8015306:	3100      	movi      	r1, 0
 8015308:	f840c462 	sub.64      	r2, r0, r2
 801530c:	07ab      	br      	0x8015262	// 8015262 <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801530e:	c412482b 	lsli      	r11, r18, 0
 8015312:	e800fc9c 	br      	0x8014c4a	// 8014c4a <_vsnprintf+0x3ba>
	...

08015318 <fputc>:
{
 8015318:	14d0      	push      	r15
    return uart_write(UART_ID_0, ch);
 801531a:	7440      	zextb      	r1, r0
 801531c:	3000      	movi      	r0, 0
 801531e:	e3ffe6d1 	bsr      	0x80120c0	// 80120c0 <uart_write>
}
 8015322:	3000      	movi      	r0, 0
 8015324:	1490      	pop      	r15
	...

08015328 <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 8015328:	1424      	subi      	r14, r14, 16
 801532a:	b863      	st.w      	r3, (r14, 0xc)
 801532c:	b842      	st.w      	r2, (r14, 0x8)
 801532e:	b821      	st.w      	r1, (r14, 0x4)
 8015330:	b800      	st.w      	r0, (r14, 0x0)
 8015332:	14d0      	push      	r15
 8015334:	1421      	subi      	r14, r14, 4
 8015336:	9862      	ld.w      	r3, (r14, 0x8)
 8015338:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 801533a:	1b03      	addi      	r3, r14, 12
 801533c:	b860      	st.w      	r3, (r14, 0x0)
 801533e:	6ccb      	mov      	r3, r2
 8015340:	3200      	movi      	r2, 0
 8015342:	2a00      	subi      	r2, 1
 8015344:	6c4f      	mov      	r1, r3
 8015346:	1005      	lrw      	r0, 0x8013f60	// 8015358 <wm_printf+0x30>
 8015348:	e3fffaa4 	bsr      	0x8014890	// 8014890 <_vsnprintf>
	va_end(args);

	return length;
}
 801534c:	1401      	addi      	r14, r14, 4
 801534e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8015352:	1405      	addi      	r14, r14, 20
 8015354:	783c      	jmp      	r15
 8015356:	0000      	.short	0x0000
 8015358:	08013f60 	.long	0x08013f60

0801535c <__cskyvprintfsprintf>:
	
	return i;
}

__attribute__((weak)) int __cskyvprintfsprintf(char *str, const char *format, ...)
{
 801535c:	1423      	subi      	r14, r14, 12
 801535e:	b862      	st.w      	r3, (r14, 0x8)
 8015360:	b841      	st.w      	r2, (r14, 0x4)
 8015362:	b820      	st.w      	r1, (r14, 0x0)
 8015364:	14d0      	push      	r15
 8015366:	1421      	subi      	r14, r14, 4
 8015368:	9862      	ld.w      	r3, (r14, 0x8)
 801536a:	6c8f      	mov      	r2, r3
  return _vsnprintf(_out_buffer, buffer, count, format, va);
 801536c:	1b03      	addi      	r3, r14, 12
 801536e:	b860      	st.w      	r3, (r14, 0x0)
 8015370:	6ccb      	mov      	r3, r2
 8015372:	3200      	movi      	r2, 0
 8015374:	6c43      	mov      	r1, r0
 8015376:	2a00      	subi      	r2, 1
 8015378:	1004      	lrw      	r0, 0x8013b34	// 8015388 <__cskyvprintfsprintf+0x2c>
 801537a:	e3fffa8b 	bsr      	0x8014890	// 8014890 <_vsnprintf>
	va_start(ap, format);
	i = wm_vsnprintf(str, (size_t) - 1, format, ap);
	va_end(ap);

	return i;
}
 801537e:	1401      	addi      	r14, r14, 4
 8015380:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8015384:	1404      	addi      	r14, r14, 16
 8015386:	783c      	jmp      	r15
 8015388:	08013b34 	.long	0x08013b34

0801538c <rt_hw_stack_init>:

rt_uint8_t *rt_hw_stack_init(void       *tentry,
                             void       *parameter,
                             rt_uint8_t *stack_addr,
                             void       *texit)
{
 801538c:	c4004832 	lsli      	r18, r0, 0
    stack_frame *sf;
    rt_uint8_t         *stk;
    unsigned long       i;

    stk  = stack_addr + sizeof(rt_uint32_t);
    stk  = (rt_uint8_t *)RT_ALIGN_DOWN((rt_uint32_t)stk, 8);
 8015390:	3000      	movi      	r0, 0
 8015392:	2807      	subi      	r0, 8
    stk  = stack_addr + sizeof(rt_uint32_t);
 8015394:	2203      	addi      	r2, 4
    stk  = (rt_uint8_t *)RT_ALIGN_DOWN((rt_uint32_t)stk, 8);
 8015396:	6880      	and      	r2, r0
    stk -= sizeof(stack_frame);
 8015398:	e40210c3 	subi      	r0, r2, 196
 801539c:	6f03      	mov      	r12, r0
    sf = (stack_frame *)stk;

    /* init all register */
    for (i = 0; i < sizeof(stack_frame) / sizeof(rt_uint32_t); i ++)
    {
        ((rt_uint32_t *)sf)[i] = 0xdeadbeef;
 801539e:	ea8d0011 	lrw      	r13, 0xdeadbeef	// 80153e0 <rt_hw_stack_init+0x54>
 80153a2:	3231      	movi      	r2, 49
 80153a4:	d40c880d 	stbi.w      	r13, (r12)
    for (i = 0; i < sizeof(stack_frame) / sizeof(rt_uint32_t); i ++)
 80153a8:	e822fffe 	bnezad      	r2, 0x80153a4	// 80153a4 <rt_hw_stack_init+0x18>
    }

    sf->r0  = (unsigned long)parameter; /* r0 : argument */
    sf->r1  = 0x01010101L;                        /* r1 */
 80153ac:	104e      	lrw      	r2, 0x1010101	// 80153e4 <rt_hw_stack_init+0x58>
 80153ae:	dc40202c 	st.w      	r2, (r0, 0xb0)
    sf->r2  = 0x02020202L;                        /* r2 */
 80153b2:	104e      	lrw      	r2, 0x2020202	// 80153e8 <rt_hw_stack_init+0x5c>
 80153b4:	dc40202d 	st.w      	r2, (r0, 0xb4)
    sf->r3  = 0x03030303L;                        /* r3 */
 80153b8:	104d      	lrw      	r2, 0x3030303	// 80153ec <rt_hw_stack_init+0x60>
 80153ba:	dc40202e 	st.w      	r2, (r0, 0xb8)
    sf->r12 = 0x12121212L;                        /* r12 */
 80153be:	104d      	lrw      	r2, 0x12121212	// 80153f0 <rt_hw_stack_init+0x64>
 80153c0:	dc40202f 	st.w      	r2, (r0, 0xbc)
	sf->r13 = 0x13131313L;                        /* r12 */
    sf->lr  = (rt_uint32_t)texit;     /* lr */
 80153c4:	b06a      	st.w      	r3, (r0, 0x28)
	sf->r13 = 0x13131313L;                        /* r12 */
 80153c6:	104c      	lrw      	r2, 0x13131313	// 80153f4 <rt_hw_stack_init+0x68>
    sf->epc = (rt_uint32_t)tentry;    /* entry point, pc */
    sf->epsr = 0x80000140L;              /* PSR */
 80153c8:	ea238000 	movih      	r3, 32768
 80153cc:	e463013f 	addi      	r3, r3, 320
    sf->r0  = (unsigned long)parameter; /* r0 : argument */
 80153d0:	dc20202b 	st.w      	r1, (r0, 0xac)
	sf->r13 = 0x13131313L;                        /* r12 */
 80153d4:	dc402030 	st.w      	r2, (r0, 0xc0)
    sf->epc = (rt_uint32_t)tentry;    /* entry point, pc */
 80153d8:	de402000 	st.w      	r18, (r0, 0x0)
    sf->epsr = 0x80000140L;              /* PSR */
 80153dc:	b061      	st.w      	r3, (r0, 0x4)

    /* return task's current stack address */
    return stk;
}
 80153de:	783c      	jmp      	r15
 80153e0:	deadbeef 	.long	0xdeadbeef
 80153e4:	01010101 	.long	0x01010101
 80153e8:	02020202 	.long	0x02020202
 80153ec:	03030303 	.long	0x03030303
 80153f0:	12121212 	.long	0x12121212
 80153f4:	13131313 	.long	0x13131313
	...
