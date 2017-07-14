IP Tool FFI
===============

A Foreign Function Interface of the IP Tool Core.<br />
Read about FFIs in Rust here: https://doc.rust-lang.org/1.0.0/book/ffi.html

You can find iptool-core [here](https://github.com/timmonfette1/iptool-core)<br />
You can find the iptool interfaces [here](https://github.com/timmonfette1/iptool)

Description
--------------
This project allows you to build various packages out of the Rust based iptool-core that
can be used in a variety of programming languages.  You can find a list of currently supported
languages in the "Available Bindings" section and you can find build instructions in the
"How to Build" section.<br />

I exposed iptool-core via a Rust FFI and then wrote custom wrappers/bindings in different
languages. When building a package, it takes the binding and the FFI and creates a "package/"
folder that can be used in a project for the chosen language.<br />

This project will change when a new binding for a language is written, so check back often
for updates.

Available Bindings
--------------
All availble bindings that can be built into packages can be found in the "bindings/" directory.<br />
Currently, the following programming languages have available packages:

  - C
  - C++
  - Python
  - Javascript (Node.js)
  - Java
  - Perl
  - Go (Golang)
  - Haskell
  - Julia

Each of the packages expect the "libiptool.so" file to be found in the "./lib/" directory. So make sure
that when moving the package into your code, you keep the code for the iptool bindings at the same
directory level as the "lib/" directory. If you wish to change this structure for whatever reason, you'll
need to change where the binding looks for the FFI or you'll need to change the path to the library when
you link the shared library at compile/run time.

How to Build
-------------
In order to build a usable package that can be imported into your language of choice, use the
provided Makefile.<br />

All make targets will first compile a release version of the FFI by running `cargo build --release`.<br />

`make clean`<br />
Will remove the "Cargo.lock", the "target/" directory and the "package/" directory.<br />
It's recommended to run this before building a new package.

### C
`make c-build`<br />
Will compile the FFI and build the C package in the resulting "package/" directory.<br />

In order to use this object file, you need to link both it and the FFI at compilation of your main source code.<br />
An example is: `$ gcc example.c iptool.o -L ./lib/ -liptool -o run`<br />
This will compile the source code file "example.c" and link it with the IP Tool object file and the "libiptool.so" library (the FFI).<br />
When executing, specify your LD_LIBRARY_PATH like so: `$ LD_LIBRARY_PATH=./lib/ ./run`<br />
You can permanently set LD_LIBRARY_PATH but be warned you might run into issues with executing other C code.

### C++
`make cpp-build`<br />
Will compile the FFI and build the C++ packge in the resulting "package/" directory.<br />

In order to use this object file, you must use the same commands as the C binding only with g++:

  - `$ g++ example.cpp iptool.o -L ./lib/ -liptool -o run`
  - `$ LD_LIBRARY_PATH=./lib/ ./run`

### Python
`make py-build`<br />
Will compile the FFI and build the Python package in the resulting "package/" directory.

### Javascript
`make js-build`<br />
Will compile the FFI and build the Node.js package in the resulting "package/" directory.

### Java
`make java-build`<br />
Will compile the FFI and build the Java package in the resulting "package/" directory.<br />

There is a dependency on the "libjffi-jni" package. I know for a fact this has to be installed on Ubuntu
systems (including Linux Mint and Trisquel). I don't know about other OSes and whether or not they need it.
I didn't include an auto-installation for this in the makefile since it might be OS dependent so installing it is on you.<br />

The Iptool library is provided in a .jar file in the "jars/" directory. Add ALL of these jars to the
build path of your project to make use of the Iptool library.<br />

The Iptool object has two constructors:

  - Pass the path to the "lib/" directory explicitly.
  - Pass nothing and use the defualt location `System.getProperty("user.dir");`.

See the example for passing a path if you need extra clarification.

### Perl
`make pl-build`<br />
Will compile the FFI and build the Perl package in the resulting "package/" directory.<br />

This perl module uses the FFI::Platypus module to call the FFI. You can read about it [here](https://metacpan.org/pod/FFI::Platypus).<br />
The makefile will install this for you, assuming you have sudo permissions on the machine you're building this on.
It will install it using the following two commands:<br />
`$ sudo cpan App::cpanminus` to install "cpanm".<br />
and<br/>
`$ sudo cpanm FFI::Platypus` to install the module.<br />

It also needs the FFI::CheckLib module and installs it with `$ sudo cpanm FFI::CheckLib`.

### Go (Golang)
`make go-build`<br />
Will compile the FFI and build the Golang package in the resulting "package/" directory.<br />

This target does a lot of directory shuffling to build a Go package for iptool. It will temporarily update your $GOPATH to allow for a Go
installation of the Go library. It will then clean-up after itself.<br />
After this it will leave two directories in the "package/" folder:

  - pkg/github.com/timmonfette1/iptool
  - src/github.com/timmonfette1/iptool

The first will be holding the "iptool.a" library and the second will be holding "iptool.go", "iptool.h" and "lib/libiptool.so".<br />
Place the first one in your "pkg" directory in your Go workspace and the second one in your "src" directory in your go workspace.<br />
Examples for my machine are:

  - pkg/linux_amd64/github.com/timmonfette1/iptool/iptool.a
  - src/github.com/timmonfette1/iptool/iptool.go
  - src/github.com/timmonfette1/iptool/iptool.h
  - src/github.com/timmonfette1/iptool/lib/libiptool.so

Make sure to not have nested "pkg" or "src" directories by accident when moving these to your Go workspace.<br />

When building/installing your project, make sure to link to the shared library. An example is:<br />
`$ go install -ldflags="-r /path/to/go/workspace/src/github.com/timmonfette1/iptool/lib"`

### Haskell
`make hs-compile`<br />
Will compile the FFI and build the Haskell package in the resulting "package/" directory.<br />

Similar to the C package, the Haskell module has to be compiled with the main program and the library needs to be linked
at both compile time and run time.<br />

Luckily, GHC will link the module for you, so you compile the code as follows:<br />
`$ ghc --make example.hs -L./lib/ -liptool -o run`<br/>

This will build the main program (called "example.hs") with "Iptool.hs" and link the FFI shared object file using "./lib/" as a library path.
The resulting executable will be called "run" and this can be executed with:<br />
`$ LD_LIBRARY_PATH=./lib/ ./run`<br />

If you wish to put the "Iptool.hs" module in a sub directory (to match any package structure you might have for your modules), just remember to import
it accordingly as my "example.hs" file assumes the module is at the same directory level as the main program.

### Julia
`make jl-build`<br />
Will compile the FFI and build the Julia package in the resulting "package/" directory.<br />

There will be two almost identical Julia files in the directory (notice difference in capitalization):

  - iptool.jl
  - Iptool.jl

The former is a raw function file that can be used with `includes("path/to/iptool.jl")` in your Julia script.<br />
The latter is a Julia module that can be used with `using Iptool` in your Julia script.<br />
Just make sure to add the module to your one of the directories in your LOAD_PATH.

The two methods of using the Iptool are equivalent in terms of functionality provided.<br />
Which one you use is up to you and depends on the structure of your Julia project (I personally prefer using modules).<br />
The "example.jl" in "examples/" shows how to use both methods.

Examples
-------------
The "examples" directory provides example source code files of how to use the generated packages for each
binding. They assume you've already built the package and imported it/compiled it with your souce code
or followed standard build procedures for the programming language.
