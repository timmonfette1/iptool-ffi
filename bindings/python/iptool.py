#!/usr/bin/env python

# Python binding for IP Tool.
# 
# Uses the IP Tool FFI to provide all of the
# IP Tool functions in a Python library.
#
# Author:
# Tim Monfette

import sys, ctypes
from ctypes import cdll, c_void_p, c_char_p

lib = cdll.LoadLibrary("./libiptool.so")

# Describe argument types for each funciton
lib.valid_ipv4.argtypes = (c_char_p, )
lib.ipv4_ipv6.argtypes = (c_char_p, )
lib.ipv4_bin.argtypes = (c_char_p, )
lib.valid_ipv6.argtypes = (c_char_p, )
lib.ipv6_ipv4.argtypes = (c_char_p, )
lib.ipv6_bin.argtypes = (c_char_p, )
lib.free_string.argtypes = (c_void_p, )

# Describe return types for each function
lib.valid_ipv4.restype = c_void_p
lib.ipv4_ipv6.restype = c_void_p
lib.ipv4_bin.restype = c_void_p
lib.valid_ipv6.restype = c_void_p
lib.ipv6_ipv4.restype = c_void_p
lib.ipv6_bin.restype = c_void_p

# Wrapper for valid_ipv4
def valid_ipv4(userInput):
    result = lib.valid_ipv4(userInput.encode('utf-8'))

    try:
        return ctypes.cast(result, c_char_p).value.decode('utf-8')
    finally:
        lib.free_string(result)

# Wrapper for ipv4_ipv6
def ipv4_ipv6(userInput):
    result = lib.ipv4_ipv6(userInput.encode('utf-8'))

    try:
        return ctypes.cast(result, c_char_p).value.decode('utf-8')
    finally:
        lib.free_string(result)

# Wrapper for ipv4_bin
def ipv4_bin(userInput):
    result = lib.ipv4_bin(userInput.encode('utf-8'))

    try:
        return ctypes.cast(result, c_char_p).value.decode('utf-8')
    finally:
        lib.free_string(result)

# Wrapper for valid_ipv6
def valid_ipv6(userInput):
    result = lib.valid_ipv6(userInput.encode('utf-8'))

    try:
        return ctypes.cast(result, c_char_p).value.decode('utf-8')
    finally:
        lib.free_string(result)

# Wrapper for ipv6_ipv4
def ipv6_ipv4(userInput):
    result = lib.ipv6_ipv4(userInput.encode('utf-8'))

    try:
        return ctypes.cast(result, c_char_p).value.decode('utf-8')
    finally:
        lib.free_string(result)

# Wrapper for ipv6_bin
def ipv6_bin(userInput):
    result = lib.ipv6_bin(userInput.encode('utf-8'))

    try:
        return ctypes.cast(result, c_char_p).value.decode('utf-8')
    finally:
        lib.free_string(result)
