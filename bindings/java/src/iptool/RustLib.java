/* Java binding for the IP Tool.
 *
 * Interface for the FFI functions of iptool.
 *
 * Author:
 * Tim Monfette
 */

package iptool;

import jnr.ffi.Pointer;

// FFI function declarations
public interface RustLib {
  Pointer valid_ipv4(String userInput);
  Pointer ipv4_ipv6(String userInput);
  Pointer ipv4_bin(String userInput);
  Pointer valid_ipv6(String userInput);
  Pointer ipv6_ipv4(String userInput);
  Pointer ipv6_bin(String userInput);
  void free_string(Pointer userInput);
}
