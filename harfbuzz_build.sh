#!/bin/bash

pushd harfbuzz-2.9.0

make clean

./autogen.sh

./configure \
  --with-pic \
  --with-libstdc++='no' \
  --with-glib='no' \
  --with-gobject='no' \
  --with-cairo='no' \
  --with-chafa='no' \
  --with-icu='no' \
  --with-graphite2='no' \
  --with-uniscribe='no' \
  --with-gdi='no' \
  --with-directwrite='no' \
  --with-coretext='no' \
  --with-sysroot="${SYSROOT}" \
  --host="${HOST}" \
  --disable-shared \
  --enable-static \
  --prefix="${PREFIX}" || exit 1

make && make install || exit 1

popd
