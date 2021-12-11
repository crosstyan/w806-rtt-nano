#include <rtthread.h>

typedef struct stack_frame
{
	rt_uint32_t epc;
	rt_uint32_t epsr;
	rt_uint32_t r4;
	rt_uint32_t r5;
	rt_uint32_t r6;
	rt_uint32_t r7;
	rt_uint32_t r8;
	rt_uint32_t r9;
	rt_uint32_t r10;
	rt_uint32_t r11;
	
	rt_uint32_t lr; //R15
	rt_uint32_t r16;
	rt_uint32_t r17;
	rt_uint32_t r18;
	rt_uint32_t r19;
	rt_uint32_t r20;
	rt_uint32_t r21;
	rt_uint32_t r22;
	rt_uint32_t r23;
	rt_uint32_t r24;
	rt_uint32_t r25;
	rt_uint32_t r26;
	rt_uint32_t r27;
	rt_uint32_t r28;
	rt_uint32_t r29;
	rt_uint32_t r30;
	rt_uint32_t r31;
	 
	rt_uint32_t fr0;
	rt_uint32_t fr1;
	rt_uint32_t fr2;
	rt_uint32_t fr3;
	rt_uint32_t fr4;
	rt_uint32_t fr5;
	rt_uint32_t fr6;
	rt_uint32_t fr7;
	rt_uint32_t fr8;
	rt_uint32_t fr9;
	rt_uint32_t fr10;
	rt_uint32_t fr11;
	rt_uint32_t fr12;
	rt_uint32_t fr13;
	rt_uint32_t fr14;
	rt_uint32_t fr15;
	
	rt_uint32_t r0;
	rt_uint32_t r1;
	rt_uint32_t r2;
	rt_uint32_t r3;
	rt_uint32_t r12;
	rt_uint32_t r13;
}stack_frame;

rt_uint32_t get_stack_frame_size(void)
{
	return sizeof(stack_frame);
}

/* flag in interrupt handling */
rt_uint32_t rt_interrupt_from_thread, rt_interrupt_to_thread;
rt_uint32_t rt_thread_switch_interrupt_flag;
/* exception hook */
static rt_err_t (*rt_exception_hook)(void *context) = RT_NULL;

rt_uint8_t *rt_hw_stack_init(void       *tentry,
                             void       *parameter,
                             rt_uint8_t *stack_addr,
                             void       *texit)
{
    stack_frame *sf;
    rt_uint8_t         *stk;
    unsigned long       i;

    stk  = stack_addr + sizeof(rt_uint32_t);
    stk  = (rt_uint8_t *)RT_ALIGN_DOWN((rt_uint32_t)stk, 8);
    stk -= sizeof(stack_frame);

    sf = (stack_frame *)stk;

    /* init all register */
    for (i = 0; i < sizeof(stack_frame) / sizeof(rt_uint32_t); i ++)
    {
        ((rt_uint32_t *)sf)[i] = 0xdeadbeef;
    }

    sf->r0  = (unsigned long)parameter; /* r0 : argument */
    sf->r1  = 0x01010101L;                        /* r1 */
    sf->r2  = 0x02020202L;                        /* r2 */
    sf->r3  = 0x03030303L;                        /* r3 */
    sf->r12 = 0x12121212L;                        /* r12 */
	sf->r13 = 0x13131313L;                        /* r12 */
    sf->lr  = (rt_uint32_t)texit;                 /* lr */
    sf->epc = (rt_uint32_t)tentry;                /* entry point, pc */
    sf->epsr = 0x80000140L;                       /* PSR */

    /* return task's current stack address */
    return stk;
}
