/* Example usage of the C++ bindings for IP Tool.
 *
 * Uses const_cast<char*>() to turn the string constant
 * into a char* to prevent depricated conversion warnings
 * from g++.
 *
 * I can do this because I know my FFI functions do not
 * change the passed string in anyway, only use it.
 *
 * Author:
 * Tim Monfette
 */

#include <iostream>
#include "iptool.h"

using namespace std;

int main()
{
  iptool ip;

  char result[1024];
  cout<<ip.valid_ipv4_cpp(const_cast<char*>("245.67.88.129"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.valid_ipv4_cpp(const_cast<char*>("1.1.1."), result)<<"\n";

  result[0] = '\0';
  cout<<ip.ipv4_ipv6_cpp(const_cast<char*>("26.76.45.99"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.ipv4_ipv6_cpp(const_cast<char*>("12.155.278.75"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.ipv4_bin_cpp(const_cast<char*>("35.68.199.202"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.ipv4_bin_cpp(const_cast<char*>("97.67.133.29.1"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.valid_ipv6_cpp(const_cast<char*>("1::1"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.valid_ipv6_cpp(const_cast<char*>("5566:45FR:679A::"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.ipv6_ipv4_cpp(const_cast<char*>("2002::3456:5690"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.ipv6_ipv4_cpp(const_cast<char*>("::1::"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.ipv6_bin_cpp(const_cast<char*>("AB6D:4678:12FA::679B"), result)<<"\n";

  result[0] = '\0';
  cout<<ip.ipv6_bin_cpp(const_cast<char*>("34FD::5720::5666"), result)<<"\n";

  return 0;
}
