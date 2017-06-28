/* iptool-ffi
 
   IP Tool exposed via an FFI for integration into
   libraries for other languages.

   Author: Tim Monfette
   Version: 0.1.0
*/

extern crate iptool_core;
extern crate libc;

use libc::c_char;
use std::ffi::CString;
use std::ffi::CStr;

use iptool_core::ipv4;
use iptool_core::ipv6;

// Validate an IPv4 address
#[no_mangle]
pub extern fn valid_ipv4(s: *const c_char) -> *mut c_char {
    let c_str = unsafe {

        CStr::from_ptr(s)
    };

    let rstr = c_str.to_str().unwrap();
    let ans = ipv4::validate_ipv4(rstr.to_owned());
    let ret = CString::new(ans).unwrap();

    ret.into_raw()
}

// Translate IPv4 into IPv6
#[no_mangle]
pub extern fn ipv4_ipv6(s: *const c_char) -> *mut c_char {
    let c_str = unsafe {

        CStr::from_ptr(s)
    };

    let rstr = c_str.to_str().unwrap();
    let ans = ipv4::ipv4_to_ipv6(rstr.to_owned());
    let ret = CString::new(ans).unwrap();

    ret.into_raw()
}

// Translate IPv4 into Binary
#[no_mangle]
pub extern fn ipv4_bin(s: *const c_char) -> *mut c_char {
    let c_str = unsafe {

        CStr::from_ptr(s)
    };

    let rstr = c_str.to_str().unwrap();
    let ans = ipv4::ipv4_binary(rstr.to_owned());
    let ret = CString::new(ans).unwrap();

    ret.into_raw()
}

// Validate an IPv6 address
#[no_mangle]
pub extern fn valid_ipv6(s: *const c_char) -> *mut c_char {
    let c_str = unsafe {

        CStr::from_ptr(s)
    };

    let rstr = c_str.to_str().unwrap();
    let ans = ipv6::validate_ipv6(rstr.to_owned());
    let ret = CString::new(ans).unwrap();

    ret.into_raw()
}

// Translate IPv6 into IPv4
#[no_mangle]
pub extern fn ipv6_ipv4(s: *const c_char) -> *mut c_char {
    let c_str = unsafe {

        CStr::from_ptr(s)
    };

    let rstr = c_str.to_str().unwrap();
    let ans = ipv6::ipv6_to_ipv4(rstr.to_owned());
    let ret = CString::new(ans).unwrap();

    ret.into_raw()
}

// Translate IPv6 into Binary
#[no_mangle]
pub extern fn ipv6_bin(s: *const c_char) -> *mut c_char {
    let c_str = unsafe {

        CStr::from_ptr(s)
    };

    let rstr = c_str.to_str().unwrap();
    let ans = ipv6::ipv6_binary(rstr.to_owned());
    let ret = CString::new(ans).unwrap();

    ret.into_raw()
}

// Free a string from memory
#[no_mangle]
pub extern fn release_word(s: *mut c_char) {
    unsafe {
        if s.is_null() { return; }
        CString::from_raw(s)
    };
}
