# Starbelly Protobuf

## Overview

This repository contains
[protobuf](https://developers.google.com/protocol-buffers/) definitions for use
with Starbelly. The [Starbelly
server](https://github.com/hyperiongray/starbelly) uses Python
bindings, and the [web
client](https://github.com/hyperiongray/starbelly-web-client) uses Dart
bindings. Both sets of bindings are generated from the protobuf definitions
bindings contained in this repository.

## Installation

Compilation requires the installation of the `protoc` compiler. On Ubuntu 16,
this package is called `protobuf-compiler`.

    $ apt install protobuf-compiler

The `protoc` compiler has built-in support for Python. (It also supports C, C++,
and Java, but we don't use those on this project.) Support for Dart requires
some additional tools. First, install dart version 2.1 following [these
instructions](https://www.dartlang.org/tools/sdk).

Next, check out the Dart plugin for `protoc`. You should run this this command
from the root of this repository.

    $ git clone https://github.com/dart-lang/dart-protoc-plugin

Now install the plugin's dependencies:

    $ cd dart-protoc-plugin
    $ pub get

You will also need Docker installed to build documentation for the protobufs.
Now you should be ready to compile the protobuf definitions.

## Compilation

To compile protobuf definitions, run this command from the root of this
repository:

    $ protoc --plugin=dart-protoc-plugin/bin/protoc-gen-dart \
             --dart_out=build \
             --python_out=build \
             starbelly.proto

To build documentation:

    $ docker run --rm -v "$PWD/build:/out" -v "$PWD:/protos" \
             pseudomuto/protoc-gen-doc --doc_opt=/protos/template.html,protobuf.html

The resulting files will be placed in the `build` directory. If your
`starbelly` and `starbelly-web-client` directories are checked out in the same
directory as this project, then you can use these commands to copy the build
artifacts to the correct locations:

    $ cp build/*.dart ../starbelly-web-client/lib/protobuf/
    $ cp build/starbelly_pb2.py ../starbelly/starbelly/
    $ cp build/protobuf.html ../starbelly/docs/

---

[![define hyperion gray](https://hyperiongray.s3.amazonaws.com/define-hg.svg)](https://www.hyperiongray.com/?pk_campaign=github&pk_kwd=starbelly-protobuf "Hyperion Gray")
