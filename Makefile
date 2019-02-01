.PHONEY: all force run clean

CFLAGS=-Wall
CXXFLAGS=-Wall
ASFLAGS=
RUSTFLAGS=-L.

TARGETS=c2c c2cxx c2arm64asm c2x64asm c2rust cxx2c cxx2cxx cxx2arm64asm cxx2x64asm cxx2rust arm64asm2c arm64asm2cxx arm64asm2arm64asm arm64asm2rust x64asm2c x64asm2cxx x64asm2x64asm x64asm2rust rust2c rust2cxx rust2arm64asm rust2x64asm rust2rust

all: $(TARGETS)

force: clean all

c2c: main_c.o libhello_c.a
	$(CC) $(CFLAGS) $^ -o $@

c2cxx: main_c.o libhello_cxx.a
	$(CC) $(CFLAGS) $^ -o $@

c2arm64asm: main_c.o libhello_arm64asm.a
	$(CC) $(CFLAGS) $^ -o $@

c2x64asm: main_c.o libhello_x64asm.a
	$(CC) $(CFLAGS) $^ -o $@

c2rust: main_c.o libhello_rust.a
	$(CC) $(CFLAGS) $^ -o $@

cxx2c: main_cxx.o libhello_c.a
	$(CXX) $(CXXFLAGS) $^ -o $@

cxx2cxx: main_cxx.o libhello_cxx.a
	$(CXX) $(CXXFLAGS) $^ -o $@

cxx2arm64asm: main_cxx.o libhello_arm64asm.a
	$(CXX) $(CXXFLAGS) $^ -o $@

cxx2x64asm: main_cxx.o libhello_x64asm.a
	$(CXX) $(CXXFLAGS) $^ -o $@

cxx2rust: main_cxx.o libhello_rust.a
	$(CXX) $(CXXFLAGS) $^ -o $@

arm64asm2c: main_arm64asm.o libhello_c.a
	$(CC) $(CFLAGS) $^ -o $@

arm64asm2cxx: main_arm64asm.o libhello_cxx.a
	$(CC) $(CFLAGS) $^ -o $@

arm64asm2arm64asm: main_arm64asm.o libhello_arm64asm.a
	$(CC) $(CFLAGS) $^ -o $@

arm64asm2rust: main_arm64asm.o libhello_rust.a
	$(CC) $(CFLAGS) $^ -o $@

x64asm2c: main_x64asm.o libhello_c.a
	$(CC) $(CFLAGS) $^ -o $@

x64asm2cxx: main_x64asm.o libhello_cxx.a
	$(CC) $(CFLAGS) $^ -o $@

x64asm2x64asm: main_x64asm.o libhello_x64asm.a
	$(CC) $(CFLAGS) $^ -o $@

x64asm2rust: main_x64asm.o libhello_rust.a
	$(CC) $(CFLAGS) $^ -o $@

rust2c: main.rs libhello_c.a
	cp libhello_c.a libhello.a
	rustc $(RUSTFLAGS) $< -o $@

rust2cxx: main.rs libhello_cxx.a
	cp libhello_cxx.a libhello.a
	rustc $(RUSTFLAGS) $< -o $@

rust2arm64asm: main.rs libhello_arm64asm.a
	cp libhello_arm64asm.a libhello.a
	rustc $(RUSTFLAGS) $< -o $@

rust2x64asm: main.rs libhello_x64asm.a
	cp libhello_x64asm.a libhello.a
	rustc $(RUSTFLAGS) $< -o $@

rust2rust: main.rs libhello_c.a
	mkdir _$@
	cd _$@ && ar -x ../libhello_rust.a
	rm _$@/libhello_rust.4kjqp1i30etsact8.rcgu.o
	libtool  -static _$@/*.o -o libhello.a
	rm -rf _$@
	rustc $(RUSTFLAGS) $< -o $@

lib%.a: %.o
	ar rcs $@ $<

lib%_rust.a: %.rs
	rustc --crate-type=staticlib $< -o $@

%_c.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%_cxx.o: %.cxx
	$(CXX) $(CXXFLAGS) -c $< -o $@

%_arm64asm.o: %.arm_64.s
	$(AS) $(ASFLAGS) $< -o $@

%_x64asm.o: %.x86_64.s
	$(AS) $(ASFLAGS) $< -o $@

run: $(TARGETS)
	for cmd in $(TARGETS); do ./$${cmd}; done

clean:
	rm -rf *.o *.a $(TARGETS)

