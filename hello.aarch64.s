        .set ALIGNMENT, 8

.text
        .balign ALIGNMENT
        .global hello
hello:
        // push FP and LR onto stack and update frame
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp

        // printf(hello.format, p_from_environment)
        mov     x1, x0
        adr     x0, hello.format
        bl      printf

        // return void
        ldp     x29, x30, [sp], #16
        ret

.data
        .balign ALIGNMENT
hello.format:
        .asciz "Hello from %s to ARM64 ASM!\n"
        .balign ALIGNMENT

