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
Currently, the following programming languages have available libraries:

  - C
  - Python
  - Javascript (Node.js)

How to Build
-------------
In order to build a usable library that can be imported into your language of choice, use the
provided Makefile.<br />

All make targets will first compile a release version of the FFI by running `cargo build --release`.<br />

`make clean`<br />
Will remove the "Cargo.lock", the "target/" directory and the "lib/" directory.<br />
It's recommended to run this before building a new library.

### C
`make c-build`<br />
Will compile the FFI and build the C object file in the resulting "lib/" directory.<br />

In order to use this object file, you need to link both it and the FFI at compilation of your main source code.<br />
An example is: `$ gcc test.c iptool.o -L ./ -liptool -o run`<br />
This will compile the source code file "test.c" and link it with the IP Tool object file and the "libiptool.so" library (the FFI).<br />
When executing, specify your LD_LIBRARY_PATH like so: `$ LD_LIBRARY_PATH=./ ./run`<br />
You can permanently set LD_LIBRARY_PATH but be warned you might run into issues with executing other C code.

### Python
`make py-build`<br />
Will compile the FFI and build the Python library in the resulting "lib/" directory.

### Javascript
`make js-build`<br />
Will compile the FFI and build the Node.js library in the resulting "lib/" directory.

Examples
-------------
The "examples" directory provides example source code files of how to use the generated libraries for each
binding. They assume you've already built the library and imported it/compiled it with your souce code
or followed standard build procedures for the programming language.
