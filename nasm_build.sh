#!/bin/bash

pushd nasm-2.15.05

make clean

autoreconf -ivf

./autogen.sh

./configure \
  --with-pic \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --enable-static \
  --disable-shared \
  --prefix="${PREFIX}" || exit 1

make && make install || exit 1

popd
