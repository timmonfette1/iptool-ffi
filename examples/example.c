/* Example usage of the C bindings for IP Tool.
 *
 * Author:
 * Tim Monfette
 */

#include <stdio.h>
#include "iptool.h"

int main() {
  char result[1024];  // Holds return value, I just directly print it.
  valid_ipv4_c("245.67.88.129", result);
  printf("%s\n", result);

  result[0] = '\0';
  valid_ipv4_c("1.1.1.", result);
  printf("%s\n", result);

  result[0] = '\0';
  ipv4_ipv6_c("26.76.45.99", result);
  printf("%s\n", result);

  result[0] = '\0';
  ipv4_ipv6_c("12.155.278.75", result);
  printf("%s\n", result);

  result[0] = '\0';
  ipv4_bin_c("35.68.199.202", result);
  printf("%s\n", result);

  result[0] = '\0';
  ipv4_bin_c("97.67.133.29.1", result);
  printf("%s\n", result);

  result[0] = '\0';
  valid_ipv6_c("1::1", result);
  printf("%s\n", result);

  result[0] = '\0';
  valid_ipv6_c("5566:45FR:679A::", result);
  printf("%s\n", result);

  result[0] = '\0';
  ipv6_ipv4_c("2002::3456:5690", result);
  printf("%s\n", result);

  result[0] = '\0';
  ipv6_ipv4_c("::1::", result);
  printf("%s\n", result);

  result[0] = '\0';
  ipv6_bin_c("AB6D:4678:12FA::679B", result);
  printf("%s\n", result);

  result[0] = '\0';
  ipv6_bin_c("34FD::5720::5666", result);
  printf("%s\n", result);

  return 0;
}
