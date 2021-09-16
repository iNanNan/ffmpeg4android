#!/bin/bash

pushd libass-0.14.0

make clean

autoreconf -ivf

./configure \
  --disable-dependency-tracking \
  --disable-require-system-font-provider \
  --with-pic \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --disable-enca \
  --disable-asm \
  --disable-harfbuzz \
  --disable-fontconfig \
  --enable-static \
  --disable-shared \
  --prefix="${PREFIX}" || exit 1

make && make install || exit 1

popd
