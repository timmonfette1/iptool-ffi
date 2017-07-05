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

# Compile C lib
c-build:
	@cargo build --release
	@mkdir lib
	@cp -r ./bindings/c/* ./lib/
	@cp -r ./target/release/libiptool.so ./lib/
	@gcc -o ./lib/iptool.o -c ./lib/iptool.c

# Compile Python lib
py-build:
	@cargo build --release
	@mkdir lib
	@cp -r ./bindings/python/* ./lib/
	@cp -r ./target/release/libiptool.so ./lib/

# Compile Javascript lib
js-build:
	@cargo build --release
	@mkdir lib
	@cp -r ./bindings/javascript/* ./lib/
	@cp -r ./target/release/libiptool.so ./lib/

# Compile Perl lib
pl-build:
	@cargo build --release
	@sudo cpan App::cpanminus
	@sudo cpanm FFI::Platypus
	@mkdir lib
	@cp -r ./bindings/perl/* ./lib/
	@cp -r ./target/release/libiptool.so ./lib/

# clean up back to initial setup
# (no target/, no Cargo.lock)
.PHONY: clean

clean:
	@rm -rf ./target
	@rm -f ./Cargo.lock
	@rm -rf ./lib
