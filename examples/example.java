/* Example usage of the Java bindings for IP Tool.
 *
 * Assumes you've already added the required jars
 * to the build path.
 *
 * See README for more details.
 *
 * Author:
 * Tim Monfette
 */

package ffiTest;

import iptool.Iptool;

public class testing {
  public static void main(String args[]) {
    Iptool ip = new Iptool("/home/tim/workspace/ffiTest/lib");

    System.out.println(ip.valid_ipv4("245.67.88.129"));
    System.out.println(ip.valid_ipv4("1.1.1."));
    System.out.println(ip.ipv4_ipv6("26.76.45.99"));
    System.out.println(ip.ipv4_ipv6("12.155.278.75"));
    System.out.println(ip.ipv4_bin("35.68.199.202"));
    System.out.println(ip.ipv4_bin("97.67.133.29.1"));

    System.out.println(ip.valid_ipv6("1::1"));
    System.out.println(ip.valid_ipv6("5566:45FR:679A::"));
    System.out.println(ip.ipv6_ipv4("2002::3456:5690"));
    System.out.println(ip.ipv6_ipv4("::1::"));
    System.out.println(ip.ipv6_bin("AB6D:4678:12FA::679B"));
    System.out.println(ip.ipv6_bin("34FD::5720::5666"));
  }
}
