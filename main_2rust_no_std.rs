#![no_std]
#![no_main]

extern crate hello;

extern {
  fn hello(p_from: *const u8);
}

#[no_mangle]
pub extern fn main(_argc: i32, _argv: *const *const u8) -> i32 {
  let from_env = b"no-std Rust (for rlib linkage)\0" as *const u8;
  unsafe {
    hello(from_env);
  }
  0
}

