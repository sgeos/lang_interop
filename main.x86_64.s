        .intel_syntax
	.set ALIGNMENT, 16
.text
	.align ALIGNMENT
        .global _main
_main:
        /* function prologue */
        push    rbp
        mov     rbp, rsp
        /* call hello("X86 ASM") */
        lea     rdi, [rip + _main.from_environment]
        call    _hello
        /* return zero */
        mov     rax, 0
        mov     rsp, rsp
        pop     rbp
        ret
_main.end:
_main.from_environment:
       .string "X64 ASM"

