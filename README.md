# lang_interop

A repository for demonstrating language interoperation via the C ABI.

Getting the exact same Rust code to link with Rust and other
languages is not easy to do in the general case, so this example has
some issues.

## References

- [ARM (AArch32) Assembler in Raspberry Pi Tutorial][aarch32-tutorial]
- [ARM AArch64 Assembler Tutorial][aarch64-tutorial]
- [ARM Cortex-A Series Programmer’s Guide for ARMv8-A PDF][aarch64-cortexa]
- [ARM Cortex-A Series Programmer’s Guide for ARMv8-A: 9.1.1. Parameters in general-purpose registers][aarch64-cortexa-911]
- [ARM Cortex-A Series Programmer’s Guide for ARMv8-A: 9.1.2. Indirect result location][aarch64-cortexa-912]
- [ARM Procedure Call Standard for the ARM 64-bit Architecture (AArch64)][aarch64-procedure-call-standard]

[aarch32-tutorial]: https://thinkingeek.com/?s=ARM+assembler+in+Raspberry+Pi&searchsubmit=Search
[aarch64-cortexa]: http://infocenter.arm.com/help/topic/com.arm.doc.den0024a/DEN0024A_v8_architecture_PG.pdf
[aarch64-cortexa-911]: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.den0024a/ch09s01s01.html
[aarch64-cortexa-912]: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.den0024a/ch09s01s02.html
[aarch64-procedure-call-standard]: http://infocenter.arm.com/help/topic/com.arm.doc.ihi0055b/IHI0055B_aapcs64.pdf
[aarch64-tutorial]: https://thinkingeek.com/?s=Exploring+AArch64+assembler&searchsubmit=Search

