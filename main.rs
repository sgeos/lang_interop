// For linking with std Rust with rustc.

use std::ffi::CString;
use std::os::raw::c_char;

//#[link(name="hello", kind="static")]
#[link(name="hello")]
extern {
  fn hello(p_from: *const c_char);
}

fn main() {
  let from_environment = CString::new("std Rust (non-library)")
    .expect("CString::new failed");
  unsafe {
    hello(from_environment.as_ptr());
  }
  std::process::exit(0);
}

