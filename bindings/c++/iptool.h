/* C++ binding for IP Tool.
 *
 * Header file for the FFI library.
 *
 * Author:
 * Tim Monfette
 */

#ifndef _IPTOOL_H
#define _IPTOOL_H

// Declare FFI functions
#ifdef __cplusplus
extern "C"{
#endif

char* valid_ipv4(char* userInput);
char* ipv4_ipv6(char* userInput);
char* ipv4_bin(char* userInput);
char* valid_ipv6(char* userInput);
char* ipv6_ipv4(char* userInput);
char* ipv6_bin(char* userInput);
void free_string(char* userInput);

#ifdef __cplusplus
}
#endif

// Define iptool class and functions
class iptool {

  public:

    // Constructor/Destructor
    iptool();
    ~iptool();

    // Wrappers to handle using the funcitons for the user
    void valid_ipv4_cpp(char* userInput, char* buf);
    void ipv4_ipv6_cpp(char* userInput, char* buf);
    void ipv4_bin_cpp(char* userInput, char* buf);
    void valid_ipv6_cpp(char* userInput, char* buf);
    void ipv6_ipv4_cpp(char* userInput, char* buf);
    void ipv6_bin_cpp(char* userInput, char* buf);

};

#endif
