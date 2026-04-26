.syntax unified
    .thumb
    .cpu cortex-m4

    .section .isr_vector
    .word   0x20020000          /* Top of Stack */
    .word   Reset_Handler       /* Reset Handler */

    .section .text
    .thumb
    .thumb_func
    .type   Reset_Handler, %function
Reset_Handler:
    /* copy .data section from flash to ram */
    ldr r0, =_sdata
    ldr r1, =_edata
    ldr r2, =_sidata
    movs r3, #0
    b copy_loop
copy_data:
    ldr r4, [r2, r3]
    str r4, [r0, r3]
    adds r3, r3, #4
copy_loop:
    adds r4, r0, r3
    cmp r4, r1
    bcc copy_data

    bl  __main
    b   .

    .size   Reset_Handler, . - Reset_Handler
