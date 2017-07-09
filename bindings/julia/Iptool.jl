# Julia binding for IP Tool.
# 
# Uses the IP Tool FFI to provide all of the
# IP Tool functions in a Julia library.
#
# Author:
# Tim Monfette

module Iptool
export valid_ipv4, ipv4_ipv6, ipv4_bin, valid_ipv6, ipv6_ipv4, ipv6_bin

# Call free_string
function free_string(toFree::Cstring)
  ccall((:free_string, "./lib/libiptool"),
        Void, (Cstring,), toFree)
end

# Wrapper for valid_ipv4
function valid_ipv4(userInput::AbstractString)
  result = ccall((:valid_ipv4, "./lib/libiptool"),
                 Cstring, (Cstring,), userInput)
  
  jstring = unsafe_string(result)
  free_string(result)
  jstring
end

# Wrapper for ipv4_ipv6
function ipv4_ipv6(userInput::AbstractString)
  result = ccall((:ipv4_ipv6, "./lib/libiptool"),
                 Cstring, (Cstring,), userInput)

  jstring = unsafe_string(result)
  free_string(result)
  jstring
end

# Wrapper for ipv4_bin
function ipv4_bin(userInput::AbstractString)
  result = ccall((:ipv4_bin, "./lib/libiptool"),
                 Cstring, (Cstring,), userInput)

  jstring = unsafe_string(result)
  free_string(result)
  jstring
end

# Wrapper for valid_ipv6
function valid_ipv6(userInput::AbstractString)
  result = ccall((:valid_ipv6, "./lib/libiptool"),
                 Cstring, (Cstring,), userInput)

  jstring = unsafe_string(result)
  free_string(result)
  jstring
end

# Wrapper for ipv6_ipv4
function ipv6_ipv4(userInput::AbstractString)
  result = ccall((:ipv6_ipv4, "./lib/libiptool"),
                 Cstring, (Cstring,), userInput)

  jstring = unsafe_string(result)
  free_string(result)
  jstring
end

# Wrapper for ipv6_bin
function ipv6_bin(userInput::AbstractString)
  result = ccall((:ipv6_bin, "./lib/libiptool"),
                 Cstring, (Cstring,), userInput)

  jstring = unsafe_string(result)
  free_string(result)
  jstring
end

end
