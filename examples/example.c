/* Example usage of the C bindings for IP Tool.
 *
 * Author:
 * Tim Monfette
 */

#include <stdio.h>
#include "iptool.h"

void main() {
  valid_ipv4_c("245.67.88.129");
  valid_ipv4_c("1.1.1.");

  ipv4_ipv6_c("26.76.45.99");
  ipv4_ipv6_c("12.155.278.75");

  ipv4_bin_c("35.68.199.202");
  ipv4_bin_c("97.67.133.29.1");

  valid_ipv6_c("1::1");
  valid_ipv6_c("5566:45FR:679A::");

  ipv6_ipv4_c("2002::3456:5690");
  ipv6_ipv4_c("::1::");

  ipv6_bin_c("AB6D:4678:12FA::679B");
  ipv6_bin_c("34FD::5720::5666");
}
