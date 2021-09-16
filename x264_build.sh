#!/bin/bash

pushd x264-snapshot-20191217-2245-stable

make clean

autoreconf -ivf

./configure \
--prefix="${PREFIX}" \
--enable-static \
--disable-shared \
--disable-asm \
--enable-pic \
--host="${HOST}" \
--cross-prefix="${CROSS_COMPILE}" \
--sysroot="${SYSROOT}" || exit 1

make && make install || exit 1

popd
