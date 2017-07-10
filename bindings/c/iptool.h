/* C binding for IP Tool.
 *
 * Header file for the FFI library.
 *
 * Author:
 * Tim Monfette
 */

#ifndef _IPTOOL_H_
#define _IPTOOL_H_

// FFI functions
extern char* valid_ipv4(char* userInput);
extern char* ipv4_ipv6(char* userInput);
extern char* ipv4_bin(char* userInput);
extern char* valid_ipv6(char* userInput);
extern char* ipv6_ipv4(char* userInput);
extern char* ipv6_bin(char* userInput);
extern void free_string(char* userInput);

// Wrappers to handle using the funcitons for the user
extern void valid_ipv4_c(char* userInput, char* buf);
extern void ipv4_ipv6_c(char* userInput, char* buf);
extern void ipv4_bin_c(char* userInput, char* buf);
extern void valid_ipv6_c(char* userInput, char* buf);
extern void ipv6_ipv4_c(char* userInput, char* buf);
extern void ipv6_bin_c(char* userInput, char* buf);
#endif
