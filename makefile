# IP Tool FFI Makefile
#
# Makefile for building various libraries
# that use IP Tool Core via an FFI.
#
# Author:
# Tim Monfette

ROOT_DIR := $(PWD)
GO_PKG := $(ROOT_DIR)/lib/pkg/github.com/timmonfette1/iptool/
GO_SRC := $(ROOT_DIR)/lib/src/github.com/timmonfette1/iptool/

GOPATH := $(ROOT_DIR)/lib:${GOPATH}
export GOPATH

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
	@sudo cpanm FFI::CheckLib
	@mkdir lib
	@cp -r ./bindings/perl/* ./lib/
	@cp -r ./target/release/libiptool.so ./lib/

# Compile Go lib
go-build:
	@cargo build --release
	@mkdir $(ROOT_DIR)/lib/	
	@mkdir $(ROOT_DIR)/lib/bin
	@mkdir $(ROOT_DIR)/lib/pkg
	@mkdir $(ROOT_DIR)/lib/src
	@mkdir $(ROOT_DIR)/lib/src/iptool
	@cp -r $(ROOT_DIR)/bindings/go/* $(ROOT_DIR)/lib/src/iptool/
	@cp -r $(ROOT_DIR)/target/release/libiptool.so $(ROOT_DIR)/lib/src/iptool/
	@cd $(ROOT_DIR)/lib/src/ ; go install iptool
	@find ./ -name iptool.a -exec mv {} $(ROOT_DIR)/lib/ \;
	@mv $(ROOT_DIR)/lib/src/iptool/iptool.go $(ROOT_DIR)/lib
	@mv $(ROOT_DIR)/lib/src/iptool/iptool.h $(ROOT_DIR)/lib
	@mv $(ROOT_DIR)/lib/src/iptool/libiptool.so $(ROOT_DIR)/lib
	@rm -rf $(ROOT_DIR)/lib/bin
	@rm -rf $(ROOT_DIR)/lib/src
	@rm -rf $(ROOT_DIR)/lib/pkg
	@mkdir -p $(GO_PKG)
	@mkdir -p $(GO_SRC)
	@mv $(ROOT_DIR)/lib/iptool.a $(GO_PKG)
	@mv $(ROOT_DIR)/lib/iptool.go $(GO_SRC)
	@mv $(ROOT_DIR)/lib/iptool.h $(GO_SRC)
	@mv $(ROOT_DIR)/lib/libiptool.so $(GO_SRC)

# clean up back to initial setup
# (no target/, no Cargo.lock)
.PHONY: clean

clean:
	@rm -rf ./target
	@rm -f ./Cargo.lock
	@rm -rf ./lib
