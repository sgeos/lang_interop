        .set ALIGNMENT,8
.text
        .balign ALIGNMENT
        .global _main
_main:
        // pusk FP and LR onto stack and update frame
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp

        // hello(main.from_environment)
        adr     x0, main.from_environment
        bl      _hello

        // return(0)
        ldp     x29, x30, [sp], #16
        mov     w0, #0
        ret

main.from_environment:
        .asciz "Apple Aarch64 ASM"
        .balign ALIGNMENT

