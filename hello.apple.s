        .set ALIGNMENT, 8

.text
        .balign ALIGNMENT
        .global _hello
_hello:
        // pusk FP and LR onto stack and update frame
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp

        // printf(hello.format, p_from_environment)
        str     x0, [SP, #-16]! // push p_from_environment
        adr     x0, hello.format
        bl      _printf
        add     SP, SP, #16 // pop varg param

        // return void
        ldp     x29, x30, [sp], #16
        ret

hello.format:
        .asciz "Hello from %s to Apple Arm64 ASM!\n"
        .balign ALIGNMENT

