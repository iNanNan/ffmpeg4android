#!/bin/bash

pushd libuuid-1.0.3

make clean

autoreconf -ivf

./configure \
  --with-pic \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --disable-shared \
  --enable-static \
  --prefix="${PREFIX}" || exit 1

make && make install || exit 1

popd
