#!/bin/bash

pushd fribidi-1.0.9

make clean

autoreconf -ivf

./configure \
  --with-pic \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --enable-static \
  --disable-shared \
  --with-glib=no \
  --prefix="${PREFIX}" || exit 1

make && make install || exit 1

popd
