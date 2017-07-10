/* C binding for IP Tool.
 *
 * Implementation of the C iptool library.
 * This will be compiled into a .o which can
 * then be linked to any C program.
 *
 * Wrappers handle freeing of the Strings from
 * Rust for the user.
 *
 * Author:
 * Tim Monfette
 */

#include <stdio.h>
#include <string.h>
#include "iptool.h"

// Wrapper for valid_ipv4
void valid_ipv4_c(char* userInput, char* buf) {
  char* result = valid_ipv4(userInput);
  strcpy(buf, result);    // copy string from Rust mem to C
  free_string(result);        // free string on Rust mem side
}

// Wrapper for ipv4_ipv6
void ipv4_ipv6_c(char* userInput, char* buf) {
  char* result = ipv4_ipv6(userInput);
  strcpy(buf, result);
  free_string(result);
}

// Wrapper for ipv4_bin
void ipv4_bin_c(char* userInput, char* buf) {
  char* result = ipv4_bin(userInput);
  strcpy(buf, result);
  free_string(result);
}

// Wrapper for valid_ipv6
void valid_ipv6_c(char* userInput, char* buf) {
  char* result = valid_ipv6(userInput);
  strcpy(buf, result);
  free_string(result);
}

// Wrapper for ipv6_ipv4
void ipv6_ipv4_c(char* userInput, char* buf) {
  char* result = ipv6_ipv4(userInput);
  strcpy(buf, result);
  free_string(result);
}

// Wrapper for ipv6_bin
void ipv6_bin_c(char* userInput, char* buf) {
  char* result = ipv6_bin(userInput);
  strcpy(buf, result);
  free_string(result);
}
