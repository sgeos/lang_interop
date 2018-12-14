        .syntax unified
        .set ALIGNMENT,8
.text
        .align ALIGNMENT
        .global main
main:
        nop             @ for gbd breakpoint
        mov     r11,lr  @ backup return address

        @ hello(main.from_environment)
        adr     r0,main.from_environment
        bl      hello

        @ return(0)
        mov     r0,$0
        bx      r11

@ Data needs to be in .text for PIE
@.data
main.from_environment:
        .asciz "ARM64 ASM"
        .align ALIGNMENT

