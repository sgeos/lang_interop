// For compiling standard Rust to a library before linking.

use std::ffi::CString;
use std::os::raw::c_char;

extern {
  fn hello(p_from: *const c_char);
}

#[no_mangle]
pub extern "C" fn main() {
  let from_environment = CString::new("std Rust (library)")
    .expect("CString::new failed");
  unsafe {
    hello(from_environment.as_ptr());
  }
  std::process::exit(0);
}

