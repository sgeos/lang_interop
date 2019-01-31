.PHONEY: all force clean

CFLAGS=-Wall
ASFLAGS=

TARGETS=c2c c2rust rust2c

all: $(TARGETS)

force: clean all

c2c: main.o libhello_c.a
	$(CC) $(CFLAGS) $^ -o $@

c2rust: main.o libhello_rust.a
	$(CC) $(CFLAGS) $^ -o $@

rust2c: main.rs libhello_c.a
	cp libhello_c.a libhello.a
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

