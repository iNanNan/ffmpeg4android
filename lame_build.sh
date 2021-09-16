#!/bin/bash

pushd lame-3.100

make clean

autoreconf -ivf

./configure \
  --with-pic \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --enable-static \
  --disable-shared \
  --disable-expopt \
  --prefix="${PREFIX}" || exit 1

make && make install || exit 1

popd
