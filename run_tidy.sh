#!/bin/bash -eux

clang-tidy-12 --warnings-as-errors=* split_writer_test.cc -- \
  -std=c++17 \
  -isystem googletest/googlemock \
  -isystem googletest/googlemock/include \
  -isystem googletest/googletest \
  -isystem googletest/googletest/include \
  -iquote googletest
