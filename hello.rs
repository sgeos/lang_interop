use std::ffi::CStr;
use std::os::raw::c_char;

#[no_mangle]
pub extern fn hello(p_from: *const c_char) {
  //let x_from = unsafe {
  //  CStr::from_ptr(p_from).to_string_lossy().into_owned()
  //}
  println!("Hello from {} to Rust!", 
    unsafe {
      CStr::from_ptr(p_from).to_string_lossy().into_owned()
    }
  );
}

