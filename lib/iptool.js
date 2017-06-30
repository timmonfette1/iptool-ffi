/* Javascript binding for the IP Tool.
 *
 * Uses the IP Tool FFI to provide all of the
 * functions in a Node.js file.
 *
 * Can replace any of the "console.log" calls to perform
 * any desired action with the result of the FFI function
 * call.
 *
 * Author:
 * Tim Monfette
 */

const ffi = require('ffi');

const lib = ffi.Library('./libiptool', {
  valid_ipv4: ['char *', ['string']],
  ipv4_ipv6: ['char *', ['string']],
  ipv4_bin: ['char *', ['string']],
  valid_ipv6: ['char *', ['string']],
  ipv6_ipv4: ['char *', ['string']],
  ipv6_bin: ['char *', ['string']],
  free_string:['void',['char *']]
});

// Wrapper for valid_ipv4
function valid_ipv4(userInput) {
  const result = lib.valid_ipv4(userInput);
  try {
    return result.readCString();
  } finally {
    lib.free_string(result);
  }
}

// Wrapper for ipv4_ipv6
function ipv4_ipv6(userInput) {
  const result = lib.ipv4_ipv6(userInput);
  try {
    return result.readCString();
  } finally {
    lib.free_string(result);
  }
}

// Wrapper for ipv4_bin
function ipv4_bin(userInput) {
  const result = lib.ipv4_bin(userInput);
  try {
    return result.readCString();
  } finally {
    lib.free_string(result);
  }
}

// Wrapper for valid_ipv6
function valid_ipv6(userInput) {
  const result = lib.valid_ipv6(userInput);
  try {
    return result.readCString();
  } finally {
    lib.free_string(result);
  }
}

// Wrapper for ipv6_ipv4
function ipv6_ipv4(userInput) {
  const result = lib.ipv6_ipv4(userInput);
  try {
    return result.readCString();
  } finally {
    lib.free_string(result);
  }
}

// Wrapper for ipv6_bin
function ipv6_bin(userInput) {
  const result = lib.ipv6_bin(userInput);
  try {
    return result.readCString();
  } finally {
    lib.free_string(result);
  }
}
