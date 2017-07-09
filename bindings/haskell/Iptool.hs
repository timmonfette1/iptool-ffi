module Iptool (valid_ipv4_h, ipv4_ipv6_h, ipv4_bin_h, valid_ipv6_h, ipv6_ipv4_h, ipv6_bin_h) where

{-# LANGUAGE ForeignFunctionInterface #-}

-- Haskell binding for the IP Tool.
--
-- Uses the IP Tool FFI to provide all of the
-- functions in a Haskell module.
--
-- Author:
-- Tim Monfette

import Foreign.C.String (CString(..), peekCString, newCString)

-- FFI function delcarations --
foreign import ccall unsafe "valid_ipv4"
  valid_ipv4 :: CString -> IO (CString)

foreign import ccall unsafe "ipv4_ipv6"
  ipv4_ipv6 :: CString -> IO (CString)

foreign import ccall unsafe "ipv4_bin"
  ipv4_bin :: CString -> IO (CString)

foreign import ccall unsafe "valid_ipv6"
  valid_ipv6 :: CString -> IO (CString)

foreign import ccall unsafe "ipv6_ipv4"
  ipv6_ipv4 :: CString -> IO (CString)

foreign import ccall unsafe "ipv6_bin"
  ipv6_bin :: CString -> IO (CString)

foreign import ccall unsafe "free_string"
  free_string :: CString -> IO ()

-- Wrappers --

-- Wrapper for valid_ipv4
valid_ipv4_h :: String -> IO (String)
valid_ipv4_h userInput = do
  cstr <- newCString userInput
  ptr <- valid_ipv4 cstr

  str <- peekCString ptr
  free_string ptr
  return $ str

-- Wrapper for ipv4_ipv6
ipv4_ipv6_h :: String -> IO (String)
ipv4_ipv6_h userInput = do
  cstr <- newCString userInput
  ptr <- ipv4_ipv6 cstr

  str <- peekCString ptr
  free_string ptr
  return $ str

-- Wrapper for ipv4_bin
ipv4_bin_h :: String -> IO (String)
ipv4_bin_h userInput = do
  cstr <- newCString userInput
  ptr <- ipv4_bin cstr

  str <- peekCString ptr
  free_string ptr
  return $ str

-- Wrapper for valid_ipv6
valid_ipv6_h :: String -> IO (String)
valid_ipv6_h userInput = do
  cstr <- newCString userInput
  ptr <- valid_ipv6 cstr

  str <- peekCString ptr
  free_string ptr
  return $ str

-- Wrapper for ipv6_ipv4
ipv6_ipv4_h :: String -> IO (String)
ipv6_ipv4_h userInput = do
  cstr <- newCString userInput
  ptr <- ipv6_ipv4 cstr

  str <- peekCString ptr
  free_string ptr
  return $ str

-- Wrapper for ipv6_bin
ipv6_bin_h :: String -> IO (String)
ipv6_bin_h userInput = do
  cstr <- newCString userInput
  ptr <- ipv6_bin cstr

  str <- peekCString ptr
  free_string ptr
  return $ str
