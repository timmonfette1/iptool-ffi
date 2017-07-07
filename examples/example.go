package main

/* Example usage of the Go binding for IP Tool.
 *
 * Author:
 * Tim Monfette
 */

import (
	"fmt"
	"github.com/timmonfette1/iptool"
)

func main() {
	fmt.Println(iptool.Valid_Ipv4("245.67.88.129"))
	fmt.Println(iptool.Valid_Ipv4("1.1.1."))
	fmt.Println(iptool.Ipv4_Ipv6("26.76.45.99"))
	fmt.Println(iptool.Ipv4_Ipv6("12.155.278.75"))
	fmt.Println(iptool.Ipv4_Bin("35.68.199.202"))
	fmt.Println(iptool.Ipv4_Bin("97.67.133.29.1"))

	fmt.Println(iptool.Valid_Ipv6("1::1"))
	fmt.Println(iptool.Valid_Ipv6("5566:45FR:679A::"))
	fmt.Println(iptool.Ipv6_Ipv4("2002::3456:5690"))
	fmt.Println(iptool.Ipv6_Ipv4("::1::"))
	fmt.Println(iptool.Ipv6_Bin("AB6D:4678:12FA::679B"))
	fmt.Println(iptool.Ipv6_Bin("34FD::5720::5666"))
}
