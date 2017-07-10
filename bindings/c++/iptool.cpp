/* C++ binding for IP Tool.
 *
 * Implementation of the C++ iptool library.
 * This will be compiled into a .o which can
 * then be linked to any C++ program.
 *
 * Wrappers handle freeing of the Strings from
 * Rust for the user.
 *
 * Author:
 * Tim Monfette
 */

#include <cstring>
#include "iptool.h"

// Constructor
iptool::iptool() {
}

// Destructor
iptool::~iptool() {
}

// Wrapper for valid_ipv4
void iptool::valid_ipv4_cpp(char* userInput, char* buf) {
  char* result = valid_ipv4(userInput);
  strcpy(buf, result);    // copy string from Rust mem to C
  free_string(result);        // free string on Rust mem side
}

// Wrapper for ipv4_ipv6
void iptool::ipv4_ipv6_cpp(char* userInput, char* buf) {
  char* result = ipv4_ipv6(userInput);
  strcpy(buf, result);
  free_string(result);
}

// Wrapper for ipv4_bin
void iptool::ipv4_bin_cpp(char* userInput, char* buf) {
  char* result = ipv4_bin(userInput);
  strcpy(buf, result);
  free_string(result);
}

// Wrapper for valid_ipv6
void iptool::valid_ipv6_cpp(char* userInput, char* buf) {
  char* result = valid_ipv6(userInput);
  strcpy(buf, result);
  free_string(result);
}

// Wrapper for ipv6_ipv4
void iptool::ipv6_ipv4_cpp(char* userInput, char* buf) {
  char* result = ipv6_ipv4(userInput);
  strcpy(buf, result);
  free_string(result);
}

// Wrapper for ipv6_bin
void iptool::ipv6_bin_cpp(char* userInput, char* buf) {
  char* result = ipv6_bin(userInput);
  strcpy(buf, result);
  free_string(result);
}
