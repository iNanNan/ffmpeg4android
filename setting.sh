#!/bin/bash

if [ $1 == 1 ]; then

archbit=32

if [ $archbit -eq 32 ];then
echo "build for 32bit"
#32bit
ABI='armeabi-v7a'
CPU='arm'
API=21
ARCH='arm'
HOST='arm-linux'
ANDROID='androideabi'
NATIVE_CPU='armv7-a'
TOOL_CPU_NAME='armv7a'
OPTIMIZE_CFLAGS="-marm -march=$NATIVE_CPU"
else
#64bit
echo "build for 64bit"
ABI='arm64-v8a'
CPU='aarch64'
API=21
ARCH='arm64'
HOST='linux-x86_64'
ANDROID='android'
NATIVE_CPU='armv8-a'
TOOL_CPU_NAME='aarch64'
OPTIMIZE_CFLAGS="-march=$NATIVE_CPU"
fi

#replace your NDK path
export ANDROID_NDK=/home/luoen/Android/android-ndk-r20b-linux-x86_64/android-ndk-r20b

export TOOLCHAIN=$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64

export HOST=$HOST

export SYSROOT=$TOOLCHAIN/sysroot

export PREFIX=$(pwd)/android/$ABI

export TOOL_PREFIX=$TOOLCHAIN/bin/$TOOL_CPU_NAME-linux-$ANDROID

export CROSS_COMPILE=$TOOLCHAIN/bin/$CPU-linux-$ANDROID-

export CC=${TOOL_PREFIX}${API}-clang

export CXX=${TOOL_PREFIX}${API}-clang++

export ADDITIONAL_CONFIGURE_FLAG="--cpu=$NATIVE_CPU"

export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig"

export CFLAGS="-Os -fpic $OPTIMIZE_CFLAGS -I${PREFIX}/include"

export LDFLAGS="-lc -lm -ldl -llog -lgcc -lz -L${PREFIX}/lib"

fi
