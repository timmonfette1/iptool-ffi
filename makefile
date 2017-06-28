# IP Tool FFI Makefile
#
# Makefile for building various libraries
# that use IP Tool Core via an FFI.
#
# Author:
# Tim Monfette

# Default builds the script
default: clean

# clean up back to initial setup
# (no target/, no src/)
.PHONY: clean

clean:
	@rm -rf ./target
	@rm -f ./Cargo.lock
