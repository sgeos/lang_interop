        .set ALIGNMENT, 8

.text
        .balign ALIGNMENT
        .global _hello
_hello:
        // push FP and LR onto stack and update frame
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp

        // printf(hello.format, p_from_environment)
        str     x0, [SP, #-16]! // push p_from_environment
        adrp    x0, hello.format@PAGE
        add     x0, x0, hello.format@PAGEOFF
        bl      _printf
        add     SP, SP, #16 // pop varg param

        // return void
        ldp     x29, x30, [sp], #16
        ret

.data
        .balign ALIGNMENT
hello.format:
        .asciz "Hello from %s to Apple Arm64 ASM!\n"
        .balign ALIGNMENT

