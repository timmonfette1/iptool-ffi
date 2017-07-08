#!/usr/bin/perl

# Perl binding for IP Tool.
# 
# Uses the IP Tool FFI to provide all of the
# IP Tool functions in a Perl module.
#
# Author:
# Tim Monfette

package iptool;

use strict;
use warnings;

use FFI::Platypus;
use FFI::CheckLib;

# Set up the FFI library
my $ffi = FFI::Platypus->new;
$ffi->lib(find_lib_or_die lib => 'iptool', libpath => './lib/');

###### Subroutine definitions ######

# Test number of arguments
sub argsTest{
  my $n = scalar(@_);

  if ($n > 1){ 
    return 0;
  }

  return 1;
}

# Subroutine for valid_ipv4
sub valid_ipv4{
  my $value = argsTest(@_);

  if ($value == 0){
    return "Too many arguments passed";
  }

  my $result = $ffi->function(valid_ipv4 => ['string'] => 'opaque')->call($_[0]);
  my $converted = $ffi->cast('opaque' => 'string', $result);
  $ffi->function(free_string => ['opaque'] => 'void')->call($result);
  return "$converted";
}

# Subroutine for ipv4_ipv6
sub ipv4_ipv6{
  my $value = argsTest(@_);

  if ($value == 0){
    return "Too many arguments passed";
  }

  my $result = $ffi->function(ipv4_ipv6 => ['string'] => 'opaque')->call($_[0]);
  my $converted = $ffi->cast('opaque' => 'string', $result);
  $ffi->function(free_string => ['opaque'] => 'void')->call($result);
  return "$converted";
}

# Subroutine for ipv4_bin
sub ipv4_bin{
  my $value = argsTest(@_);

  if ($value == 0){
    return "Too many arguments passed";
  }

  my $result = $ffi->function(ipv4_bin => ['string'] => 'opaque')->call($_[0]);
  my $converted = $ffi->cast('opaque' => 'string', $result);
  $ffi->function(free_string => ['opaque'] => 'void')->call($result);
  return "$converted";
}

# Subroutine for valid_ipv6
sub valid_ipv6{
  my $value = argsTest(@_);

  if ($value == 0){
    return "Too many arguments passed";
  }

  my $result = $ffi->function(valid_ipv6 => ['string'] => 'opaque')->call($_[0]);
  my $converted = $ffi->cast('opaque' => 'string', $result);
  $ffi->function(free_string => ['opaque'] => 'void')->call($result);
  return "$converted";
}

# Subroutine for ipv6_ipv4
sub ipv6_ipv4{
  my $value = argsTest(@_);

  if ($value == 0){
    return "Too many arguments passed";
  }

  my $result = $ffi->function(ipv6_ipv4 => ['string'] => 'opaque')->call($_[0]);
  my $converted = $ffi->cast('opaque' => 'string', $result);
  $ffi->function(free_string => ['opaque'] => 'void')->call($result);
  return "$converted";
}

# Subroutine for ipv6_bin
sub ipv6_bin{
  my $value = argsTest(@_);

  if ($value == 0){
    return "Too many arguments passed";
  }

  my $result = $ffi->function(ipv6_bin => ['string'] => 'opaque')->call($_[0]);
  my $converted = $ffi->cast('opaque' => 'string', $result);
  $ffi->function(free_string => ['opaque'] => 'void')->call($result);
  return "$converted";
}

1;
