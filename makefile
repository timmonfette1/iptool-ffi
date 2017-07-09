# IP Tool FFI Makefile
#
# Makefile for building various libraries
# that use IP Tool Core via an FFI.
#
# Author:
# Tim Monfette

ROOT_DIR := $(PWD)
GO_PKG := $(ROOT_DIR)/package/pkg/github.com/timmonfette1/iptool/
GO_SRC := $(ROOT_DIR)/package/src/github.com/timmonfette1/iptool/

GOPATH := $(ROOT_DIR)/package:${GOPATH}
export GOPATH

default: print-usage

# Print a message
print-usage:
	@echo "No default target for this makefile."
	@echo "See the README for possible targets."

# Setup the package directory
setup:
	@cargo build --release
	@mkdir $(ROOT_DIR)/package/
	@mkdir $(ROOT_DIR)/package/lib/

# Compile C package
c-build: setup
	@cp -r $(ROOT_DIR)/bindings/c/* $(ROOT_DIR)/package/
	@cp -r $(ROOT_DIR)/target/release/libiptool.so $(ROOT_DIR)/package/lib/
	@gcc -o $(ROOT_DIR)/package/iptool.o -c $(ROOT_DIR)/package/iptool.c

# Compile Python package
py-build: setup
	@cp -r $(ROOT_DIR)/bindings/python/* $(ROOT_DIR)/package/
	@cp -r $(ROOT_DIR)/target/release/libiptool.so $(ROOT_DIR)/package/lib/

# Compile Javascript package
js-build: setup	
	@cp -r $(ROOT_DIR)/bindings/javascript/* $(ROOT_DIR)/package/
	@cp -r $(ROOT_DIR)/target/release/libiptool.so $(ROOT_DIR)/package/lib/

# Compile Perl package
pl-build: setup
	@sudo cpan App::cpanminus
	@sudo cpanm FFI::Platypus
	@sudo cpanm FFI::CheckLib	
	@cp -r $(ROOT_DIR)/bindings/perl/* $(ROOT_DIR)/package/
	@cp -r $(ROOT_DIR)/target/release/libiptool.so $(ROOT_DIR)/package/lib/

# Compile Go package
go-build: setup	
	@mkdir $(ROOT_DIR)/package/bin
	@mkdir $(ROOT_DIR)/package/pkg
	@mkdir -p $(ROOT_DIR)/package/src/iptool/lib/
	@cp -r $(ROOT_DIR)/bindings/go/* $(ROOT_DIR)/package/src/iptool/
	@cp -r $(ROOT_DIR)/target/release/libiptool.so $(ROOT_DIR)/package/src/iptool/lib/
	@cd $(ROOT_DIR)/package/src/ ; go install iptool
	@find ./ -name iptool.a -exec mv {} $(ROOT_DIR)/package/ \;
	@mv $(ROOT_DIR)/package/src/iptool/iptool.go $(ROOT_DIR)/package/
	@mv $(ROOT_DIR)/package/src/iptool/iptool.h $(ROOT_DIR)/package/
	@mv $(ROOT_DIR)/package/src/iptool/lib/* $(ROOT_DIR)/package/lib/
	@rm -rf $(ROOT_DIR)/package/bin
	@rm -rf $(ROOT_DIR)/package/src
	@rm -rf $(ROOT_DIR)/package/pkg
	@mkdir -p $(GO_PKG)
	@mkdir -p $(GO_SRC)
	@mv $(ROOT_DIR)/package/iptool.a $(GO_PKG)
	@mv $(ROOT_DIR)/package/iptool.go $(GO_SRC)
	@mv $(ROOT_DIR)/package/iptool.h $(GO_SRC)
	@mv $(ROOT_DIR)/package/lib/ $(GO_SRC)

# Compile Haskell package
hs-build: setup
	@cp -r $(ROOT_DIR)/bindings/haskell/* $(ROOT_DIR)/package/
	@cp -r $(ROOT_DIR)/target/release/libiptool.so $(ROOT_DIR)/package/lib/

# clean up back to initial setup
# (no target/, no package/, no Cargo.lock)
.PHONY: clean

clean:
	@rm -rf $(ROOT_DIR)/target/
	@rm -f $(ROOT_DIR)/Cargo.lock
	@rm -rf $(ROOT_DIR)/package/
