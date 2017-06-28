IP Tool FFI
===============

A Foreign Function Interface of the IP Tool Core.<br />
Read about FFIs in Rust here: https://doc.rust-lang.org/1.0.0/book/ffi.html

You can find iptool-core [here](https://github.com/timmonfette1/iptool-core)<br />
You can find the iptool interfaces [here](https://github.com/timmonfette1/iptool)

Description
--------------
This project allows you to build various libraries out of the Rust based iptool-core that
can be used in a variety of programming languages.  You can find a list of currently supported
languages in the "Available Libraries" section and you can find build instructions in the
"How to Build" section.<br />

I exposed iptool-core via a Rust FFI and then wrote custom wrappers/bindings in different
languages. When building a library, it takes the binding and the FFI and creates a "lib/"
folder that can be used in a project for the chosen language.<br />

This project will change when a new binding for a language is written, so check back often
for updates.

Available Libraries
--------------
All availble bindings that can be built into libraries can be found in the "bindings/" directory.<br />
Currently, the following programming have available libraries:

  - python

How to Build
-------------
In order to build a usable library that can be imported into your language of choice, use the
provided Makefile.<br />

All make targets will first compile a release version of the FFI by running `cargo build --release`.<br />

`make py-build`
Will compile the FFI and build the Python library in the resulting "lib/" directory.

`make clean`
Will remove the "Cargo.lock", the "target/" directory and the "lib/" directory.<br />
It's recommended to run this before building a new library.
