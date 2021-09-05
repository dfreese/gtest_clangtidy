#!/bin/bash -eux

clang-tidy-12 --warnings-as-errors=* --header-filter=\./.* split_writer_test.cc -- \
  -std=c++17 \
  -isystem googletest/googlemock \
  -isystem googletest/googlemock/include \
  -isystem googletest/googletest \
  -isystem googletest/googletest/include \
  -iquote . \
  -iquote googletest \
  -x c++ \
  -I/usr/lib/clang/12/include \
  -I/usr/local/include \
  -I/usr/include/x86_64-linux-gnu \
  -I/usr/include \
  -I/usr/include/c++/9 \
  -I/usr/include/x86_64-linux-gnu/c++/9 \
  -I/usr/include/c++/9/backward
