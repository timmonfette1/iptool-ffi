package iptool

/* Go binding for the IP Tool.
*
* Uses the IP Tool FFI to provide all of the
* functions in a Go library.
*
* Author:
* Tim Monfette
 */

/*
#cgo LDFLAGS: -L${SRCDIR}/lib/ -liptool
#include <stdlib.h>
#include "./lib/iptool.h"
*/
import "C"
import "unsafe"

// Wrapper for valid_ipv4
func Valid_Ipv4(userInput string) string {
	cs := C.CString(userInput)
	defer C.free(unsafe.Pointer(cs))

	cResult := C.valid_ipv4(cs)
	defer C.free_string(cResult)

	result := C.GoString(cResult)
	return result
}

// Wrapper for ipv4_ipv6
func Ipv4_Ipv6(userInput string) string {
	cs := C.CString(userInput)
	defer C.free(unsafe.Pointer(cs))

	cResult := C.ipv4_ipv6(cs)
	defer C.free_string(cResult)

	result := C.GoString(cResult)
	return result
}

// Wrapper for ipv4_bin
func Ipv4_Bin(userInput string) string {
	cs := C.CString(userInput)
	defer C.free(unsafe.Pointer(cs))

	cResult := C.ipv4_bin(cs)
	defer C.free_string(cResult)

	result := C.GoString(cResult)
	return result
}

// Wrapper for valid_ipv6
func Valid_Ipv6(userInput string) string {
	cs := C.CString(userInput)
	defer C.free(unsafe.Pointer(cs))

	cResult := C.valid_ipv6(cs)
	defer C.free_string(cResult)

	result := C.GoString(cResult)
	return result
}

// Wrapper for ipv6_ipv4
func Ipv6_Ipv4(userInput string) string {
	cs := C.CString(userInput)
	defer C.free(unsafe.Pointer(cs))

	cResult := C.ipv6_ipv4(cs)
	defer C.free_string(cResult)

	result := C.GoString(cResult)
	return result
}

// Wrapper for ipv6_bin
func Ipv6_Bin(userInput string) string {
	cs := C.CString(userInput)
	defer C.free(unsafe.Pointer(cs))

	cResult := C.ipv6_bin(cs)
	defer C.free_string(cResult)

	result := C.GoString(cResult)
	return result
}
