/* Example usage of the JS bindings for IP Tool.
 *
 * Assumes you've already loaded the iptool.js script.
 *
 * Author:
 * Tim Monfette
 */


function testFFI() {
  console.log(valid_ipv4("245.67.88.129"));
  console.log(valid_ipv4("1.1.1."));

  console.log(ipv4_ipv6("26.76.45.99"));
  console.log(ipv4_ipv6("12.155.278.75"));

  console.log(ipv4_bin("35.68.199.202"));
  console.log(ipv4_bin("97.67.133.29.1"));

  console.log(valid_ipv6("1::1"));
  console.log(valid_ipv6("5566:45FR:679A::"));

  console.log(ipv6_ipv4("2002::3456:5690"));
  console.log(ipv6_ipv4("::1::"));

  console.log(ipv6_bin("AB6D:4678:12FA::679B"));
  console.log(ipv6_bin("34FD::5720::5666"));
}

testFFI();
