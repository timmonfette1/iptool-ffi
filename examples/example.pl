#!/usr/bin/perl

# Example usage of the Perl bindings for IP Tool.
#
# Author:
# Tim Monfette

use strict;
use warnings;

use File::Basename;
use lib dirname (__FILE__);

use iptool;

print iptool::valid_ipv4("245.67.88.129"), "\n";
print iptool::valid_ipv4("1.1.1."), "\n";
print iptool::ipv4_ipv6("26.76.45.99"), "\n";
print iptool::ipv4_ipv6("12.155.278.75"), "\n";
print iptool::ipv4_bin("35.68.199.202"), "\n";
print iptool::ipv4_bin("97.67.133.29.1"), "\n";

print iptool::valid_ipv6("1::1"), "\n";
print iptool::valid_ipv6("5566:45FR:679A::"), "\n";
print iptool::ipv6_ipv4("2002::3456:5690"), "\n";
print iptool::ipv6_ipv4("::1::"), "\n";
print iptool::ipv6_bin("AB6D:4678:12FA::679B"), "\n";
print iptool::ipv6_bin("34FD::5720::5666"), "\n";
