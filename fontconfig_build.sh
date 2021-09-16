#!/bin/bash

pushd fontconfig-2.13.1

make clean

autoreconf -ivf

./configure \
  --with-pic \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --disable-shared \
  --enable-static \
  --enable-libxml2 \
  --prefix="${PREFIX}" \
  --disable-iconv || exit 1

make && make install || exit 1

popd
