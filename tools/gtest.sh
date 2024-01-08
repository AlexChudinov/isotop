#!/usr/bin/bash
# Устанавливаем gtest

set -e

apt-get install libgtest-dev cmake
cd /usr/src/gtest
cmake CMakeLists.txt
make
cp lib/*.a /usr/lib
ln -s /usr/lib/libgtest.a /usr/local/lib/gtest/libgtest.a
ln -sf /usr/lib/libgtest.a /usr/local/lib/gtest/libgtest.a
mkdir -p /usr/local/lib/gtest
ln -sf /usr/lib/libgtest.a /usr/local/lib/gtest/libgtest.a
ln -s /usr/lib/libgtest_main.a /usr/local/lib/gtest/libgtest_main.a
