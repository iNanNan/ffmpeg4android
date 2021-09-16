#!/bin/bash

. setting.sh 1

rm -rf ${PREFIX}

./nasm_build.sh || exit 1
./x264_build.sh || exit 1
#./uuid_build.sh || exit 1
#./xml2_build.sh || exit 1
./freetype_build.sh || exit 1
./fribidi_build.sh || exit 1
#./fontconfig_build.sh || exit 1
#./harfbuzz_build.sh || exit 1
./libass_build.sh || exit 1
./lame_build.sh || exit 1
./ffmpeg_build.sh || exit 1
