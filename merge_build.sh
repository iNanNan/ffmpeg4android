#!/bin/bash

. setting.sh 1

#$TOOLCHAIN/bin/$CPU-linux-$ANDROID-ld \
sysr=/home/luoen/Android/android-ndk-r17c-linux-x86_64/android-ndk-r17c/platforms/android-21/arch-arm/usr/lib
tool=/home/luoen/Android/android-ndk-r17c-linux-x86_64/android-ndk-r17c/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
$tool/bin/arm-linux-androideabi-ld \
-rpath-link=sysr \
-L$sysr \
-L$PREFIX/lib \
-soname libffmpeg.so -shared -nostdlib -Bsymbolic --whole-archive --no-undefined -o \
$PREFIX/libffmpeg.so \
$PREFIX/lib/libavcodec.a \
$PREFIX/lib/libavfilter.a \
$PREFIX/lib/libavformat.a \
$PREFIX/lib/libavutil.a \
$PREFIX/lib/libpostproc.a \
$PREFIX/lib/libswresample.a \
$PREFIX/lib/libswscale.a \
$PREFIX/lib/libfreetype.a \
$PREFIX/lib/libfribidi.a \
$PREFIX/lib/libass.a \
$PREFIX/lib/libx264.a \
-lc -lm -lz -ldl --dynamic-linker=/system/bin/linker \
$tool/lib/gcc/$CPU-linux-$ANDROID/4.9.x/libgcc.a

echo "end merge libffmpeg.so"
