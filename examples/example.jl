# Example usage of the Julia bindings for IP Tool.
#
# Shows 2 ways of importing the Iptool code.
# The first uses a Julia module in your LOAD_PATH.
# The second uses the regular function file at a path.
#
# Both methods of importing the code work and yield
# the same functional code that can be used the same way.
# Which method you choose is preference and based on your project.
#
# Author:
# Tim Monfette

# This uses the Iptool module
using Iptool

# This uses the regular function file instead of the module
#include("./iptool.jl")

println(valid_ipv4("245.67.88.129"))
println(valid_ipv4("1.1.1."))
println(ipv4_ipv6("26.76.45.99"))
println(ipv4_ipv6("12.155.278.75"))
println(ipv4_bin("35.68.199.202"))
println(ipv4_bin("97.67.133.29.1"))

println(valid_ipv6("1::1"))
println(valid_ipv6("5566:45FR:679A::"))
println(ipv6_ipv4("2002::3456:5690"))
println(ipv6_ipv4("::1::"))
println(ipv6_bin("AB6D:4678:12FA::679B"))
println(ipv6_bin("34FD::5720::5666"))
