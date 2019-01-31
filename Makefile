.PHONEY: all force clean

CFLAGS=-Wall
ASFLAGS=

TARGETS=c2c c2rust rust2c rust2rust

all: $(TARGETS)

force: clean all

c2c: main.o libhello_c.a
	$(CC) $(CFLAGS) $^ -o $@

c2rust: main.o libhello_rust.a
	$(CC) $(CFLAGS) $^ -o $@

rust2c: main.rs libhello_c.a
	cp libhello_c.a libhello.a
	rustc -L. $< -o $@

rust2rust: main.rs libhello_c.a
	mkdir _$@
	cd _$@ && ar -x ../libhello_rust.a
	rm _$@/libhello_rust.4kjqp1i30etsact8.rcgu.o
	libtool  -static _$@/*.o -o libhello.a
	rm -rf _$@
	rustc -L. $< -o $@

lib%_c.a: %.o
	ar rcs $@ $<

lib%_rust.a: %.rs
	rustc --crate-type=staticlib $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf *.o *.a $(TARGETS)

