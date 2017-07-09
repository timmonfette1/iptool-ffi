-- Example usage of the Haskell binding for IP Tool.
--
-- Author:
-- Tim Monfette

import Iptool

main :: IO()
main = do
  result <- valid_ipv4_h "245.67.88.129"
  putStrLn result

  result <- valid_ipv4_h "1.1.1."
  putStrLn result
 
  result <- ipv4_ipv6_h "26.76.45.99"
  putStrLn result

  result <- ipv4_ipv6_h "12.155.278.75"
  putStrLn result

  result <- ipv4_bin_h "35.68.199.202"
  putStrLn result

  result <- ipv4_bin_h "97.67.133.29.1"
  putStrLn result

  result <- valid_ipv6_h "1::1"
  putStrLn result

  result <- valid_ipv6_h "5566:45FR:679A::"
  putStrLn result

  result <- ipv6_ipv4_h "2002::3456:5690"
  putStrLn result

  result <- ipv6_ipv4_h "::1::"
  putStrLn result

  result <- ipv6_bin_h "AB6D:4678:12FA::679B"
  putStrLn result

  result <- ipv6_bin_h "34FD::5720::5666"
  putStrLn result
