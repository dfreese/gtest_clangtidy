#!/bin/bash -eux

cd "$( dirname "${BASH_SOURCE[0]}" )"

# Passes without issue
clang-tidy-12 --warnings-as-errors=* split_writer_test.cc -- \
  -std=c++14 \
  -isystem googletest/googlemock/include \
  -isystem googletest/googletest/include

# Fails
clang-tidy-12 --warnings-as-errors=* split_writer_test.cc -- \
  -std=c++17 \
  -isystem googletest/googlemock/include \
  -isystem googletest/googletest/include
