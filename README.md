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

First, when you check out this repository, be sure to use the ``--recursive`` flag to
install the submodule for Dart protobufs.

    $ git clone --recursive https://github.com/HyperionGray/starbelly-protobuf.git

If you already checked out this repository, you can install the submodule by running
these commands:

    $ git submodule init
    $ git submodule update

Go into the protobuf submodule and fetch its dependencies:

    $ cd protobuf/protoc_plugin
    $ pub get

Compilation requires the installation of the `protoc` compiler. On Ubuntu 19.10,
this package is called `protobuf-compiler`.

    $ apt install protobuf-compiler

You will also need Docker installed to build documentation for the protobufs.
Now you should be ready to compile the protobuf definitions.

## Compilation

To compile protobuf definitions, run this command from the root of this
repository:

    $ make build

This will compile the protobufs in to Python and Dart versions, and also create HTML
documentation.

If you have the `starbelly` and `starbelly-web-client` repositories checked out in the
parent directory as this `starbelly-protobuf` directory, then you can run this command
to copy the generated files into their appropriate destinations.

    $ make install

You will need to go into those other repos to see these changes, test them, and commit
them.

---

[![define hyperion gray](https://hyperiongray.s3.amazonaws.com/define-hg.svg)](https://www.hyperiongray.com/?pk_campaign=github&pk_kwd=starbelly-protobuf "Hyperion Gray")
