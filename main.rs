use std::ffi::CString;
use std::os::raw::c_char;

#[link(name="hello", kind="static")]
extern {
  fn hello(p_from: *const c_char);
}

fn main() {
  let from_environment = CString::new("Rust").expect("CString::new failed");
  unsafe {
    hello(from_environment.as_ptr());
  }
  std::process::exit(0);
}

