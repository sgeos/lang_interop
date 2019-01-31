        .intel_syntax
        .set ALIGNMENT, 16
.text
        .global _hello
_hello:
        /* function prologue */
        push    rbp
        mov     rbp, rsp
        /* call printf("Hello from %s to X64 ASM!\n", pFromEnvironment) */
        mov    rsi, rdi              # rdi holds pFromEnvironment parameter
        lea     rdi, [rip + _hello.format]
        call    _printf
        /* return void */
        mov     rsp, rsp
        pop     rbp
        ret
_hello.end:
_hello.format:
       .string "Hello from %s to X64 ASM!\n"

