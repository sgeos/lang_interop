use std::ffi::CStr;
use std::os::raw::c_char;

#[no_mangle]
pub unsafe extern fn hello(p_from: *const c_char) {
  let from = CStr::from_ptr(p_from).to_string_lossy().into_owned();
  println!("Hello from {} to std Rust!", from);
}

