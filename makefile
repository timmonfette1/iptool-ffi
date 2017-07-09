# IP Tool FFI Makefile
#
# Makefile for building various libraries
# that use IP Tool Core via an FFI.
#
# Author:
# Tim Monfette

###### Variable definitions ######
ROOT_DIR := $(PWD)
GO_PKG := $(ROOT_DIR)/package/pkg/github.com/timmonfette1/iptool/
GO_SRC := $(ROOT_DIR)/package/src/github.com/timmonfette1/iptool/

THIS_FILE := $(lastword $(MAKEFILE_LIST))

GOPATH := $(ROOT_DIR)/package:${GOPATH}
export GOPATH

LANG="none"

###### Target definitions ######

# Need to pass a target to this makefile
null:
	@echo "No default target for this makefile."
	@echo "See the README for possible targets."

# Setup the package directory
setup:
	@cargo build --release
	@mkdir $(ROOT_DIR)/package/
	@mkdir $(ROOT_DIR)/package/lib/

# Build the package with proper bindings
# Don't call this yourself, it won't do anything.
# It's made to be used by this Makefile internally
build:
ifeq ($(LANG),"none")
	@echo "No language specified."
	@echo "Can't build anything."
else
	@echo "Generating $(LANG) build..."
	@cp -r $(ROOT_DIR)/bindings/$(LANG)/* $(ROOT_DIR)/package/
	@cp -r $(ROOT_DIR)/target/release/libiptool.so $(ROOT_DIR)/package/lib/
endif

# Compile C package
c-build: setup
	@$(MAKE) -f $(THIS_FILE) build LANG=c
	@gcc -o $(ROOT_DIR)/package/iptool.o -c $(ROOT_DIR)/package/iptool.c

# Compile Python package
py-build: setup
	@$(MAKE) -f $(THIS_FILE) build LANG=python

# Compile Javascript package
js-build: setup	
	@$(MAKE) -f $(THIS_FILE) build LANG=javascript

# Compile Perl package
pl-build: setup
	@sudo cpan App::cpanminus
	@sudo cpanm FFI::Platypus
	@sudo cpanm FFI::CheckLib	
	@$(MAKE) -f $(THIS_FILE) build LANG=perl

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
	@$(MAKE) -f $(THIS_FILE) build LANG=haskell

# clean up back to initial setup
# (no target/, no package/, no Cargo.lock)
.PHONY: clean

clean:
	@rm -rf $(ROOT_DIR)/target/
	@rm -f $(ROOT_DIR)/Cargo.lock
	@rm -rf $(ROOT_DIR)/package/
