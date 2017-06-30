#!/usr/bin/env python

# Example usage of the Python bindings for IP Tool.
#
# Author:
# Tim Monfette

import iptool

print
print(iptool.valid_ipv4("245.67.88.129"))
print
print(iptool.valid_ipv4("1.1.1."))
print
print(iptool.ipv4_ipv6("26.76.45.99"))
print
print(iptool.ipv4_ipv6("12.155.278.75"))
print
print(iptool.ipv4_bin("35.68.199.202"))
print
print(iptool.ipv4_bin("97.67.133.29.1"))
print

print
print(iptool.valid_ipv6("1::1"))
print
print(iptool.valid_ipv6("5566:45FR:679A::"))
print
print(iptool.ipv6_ipv4("2002::3456:5690"))
print
print(iptool.ipv6_ipv4("::1::"))
print
print(iptool.ipv6_bin("AB6D:4678:12FA::679B"))
print
print(iptool.ipv6_bin("34FD::5720::5666"))
print
