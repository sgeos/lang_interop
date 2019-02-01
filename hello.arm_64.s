        .syntax unified
        .set ALIGNMENT,8
.text
        .align ALIGNMENT
        .global hello
hello:
        nop             @ for gbd breakpoint
        push    {ip,lr} @ backup registers

        @ printf(hello.format,p_from_environment)
        mov     r1,r0
        adr     r0,hello.format
        bl      printf

        popeq   {ip,pc} @ return void

@ Data needs to be in .text for PIE
@.data
hello.format:
        .asciz "Hello from %s to ARM64 ASM!\n"
        .align ALIGNMENT

