#![feature(lang_items, libc, linkage, rustc_private, start)]
#![no_std]
#![no_main]

use core::panic::PanicInfo;

extern crate libc;

#[link(name="hello", kind="static")]
extern {
  fn hello(p_from: *const u8);
}

#[no_mangle]
pub extern fn main(_argc: i32, _argv: *const *const u8) -> i32 {
  let from_env = b"no-std Rust\0" as *const u8;
  unsafe {
    hello(from_env);
  }
  0
}

#[lang = "eh_personality"]
#[linkage="weak"]
extern "C" fn eh_personality() {}
#[panic_handler] fn panic(_panic: &PanicInfo<'_>) -> ! { loop {} }

