.PHONEY: all force clean

CFLAGS=-Wall
ASFLAGS=

TARGETS=c2c c2x64asm c2rust x64asm2c x64asm2x64asm x64asm2rust rust2c rust2x64asm rust2rust

all: $(TARGETS)

force: clean all

c2c: main_c.o libhello_c.a
	$(CC) $(CFLAGS) $^ -o $@

c2x64asm: main_c.o libhello_x64asm.a
	$(CC) $(CFLAGS) $^ -o $@

c2rust: main_c.o libhello_rust.a
	$(CC) $(CFLAGS) $^ -o $@

x64asm2c: main_x64asm.o libhello_c.a
	$(CC) $(CFLAGS) $^ -o $@

x64asm2x64asm: main_x64asm.o libhello_x64asm.a
	$(CC) $(CFLAGS) $^ -o $@

x64asm2rust: main_x64asm.o libhello_rust.a
	$(CC) $(CFLAGS) $^ -o $@

rust2c: main.rs libhello_c.a
	cp libhello_c.a libhello.a
	rustc -L. $< -o $@

rust2x64asm: main.rs libhello_x64asm.a
	cp libhello_x64asm.a libhello.a
	rustc -L. $< -o $@

rust2rust: main.rs libhello_c.a
	mkdir _$@
	cd _$@ && ar -x ../libhello_rust.a
	rm _$@/libhello_rust.4kjqp1i30etsact8.rcgu.o
	libtool  -static _$@/*.o -o libhello.a
	rm -rf _$@
	rustc -L. $< -o $@

lib%.a: %.o
	ar rcs $@ $<

lib%_rust.a: %.rs
	rustc --crate-type=staticlib $< -o $@

%_c.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%_x64asm.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf *.o *.a $(TARGETS)

