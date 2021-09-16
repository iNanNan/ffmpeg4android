#!/bin/bash

pushd freetype-2.11.0

make clean

autoreconf -ivf

./autogen.sh

./configure \
  --with-pic \
  --with-harfbuzz='no' \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --enable-static \
  --disable-shared \
  --prefix="${PREFIX}" || exit 1

make && make install || exit 1

popd
