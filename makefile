# IP Tool FFI Makefile
#
# Makefile for building various libraries
# that use IP Tool Core via an FFI.
#
# Author:
# Tim Monfette

default: print-usage

# Print a message
print-usage:
	@echo "No default target for this makefile."
	@echo "See the README for possible targets."

# Compile Python lib
py-build:
	@cargo build --release
	@mkdir lib
	@cp -r ./bindings/python/* ./lib/
	@cp -r ./target/ ./lib/

# clean up back to initial setup
# (no target/, no Cargo.lock)
.PHONY: clean

clean:
	@rm -rf ./target
	@rm -f ./Cargo.lock
	@rm -rf ./lib
