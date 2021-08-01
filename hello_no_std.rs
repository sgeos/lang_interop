#![feature(libc, lang_items)]
#![feature(rustc_private)]
#![no_std]

use core::panic::PanicInfo;

extern crate libc;

extern {
  pub fn printf(format: *const u8, ...) -> i32;
}

#[no_mangle]
pub unsafe extern fn hello(p_from: *const u8) {
  printf(b"Hello from %s to no-std Rust!\n\0" as *const u8, p_from);
}

#[lang = "eh_personality"] extern "C" fn eh_personality() {}
#[panic_handler] fn panic(_panic: &PanicInfo<'_>) -> ! { loop {} }

