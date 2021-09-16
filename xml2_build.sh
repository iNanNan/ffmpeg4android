#!/bin/bash

pushd libxml2-2.9.12

make clean

autoreconf -ivf

./autogen.sh

./configure \
  --with-pic \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --disable-shared \
  --enable-static \
  --prefix="${PREFIX}" || exit 1

make && make install || exit 1

popd
