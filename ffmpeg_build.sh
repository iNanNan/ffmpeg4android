#!/bin/bash

. setting.sh 1

#your pkg-config path
export PKG_CONFIG="/usr/bin/pkg-config"

pushd FFmpeg-n4.2.4

make clean

./configure --target-os=android --prefix="$PREFIX" \
--pkgconfigdir="$PKG_CONFIG_PATH" \
--pkg-config="$PKG_CONFIG" \
--arch="$CPU" \
--cc="$CC" \
--cxx="$CXX" \
--enable-cross-compile \
--cross-prefix="$CROSS_COMPILE" \
--sysroot="$SYSROOT" \
--enable-neon \
--enable-hwaccels \
--enable-static \
--disable-shared \
--disable-doc \
--enable-asm \
--enable-small \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-debug \
--enable-gpl \
--disable-avdevice \
--disable-indevs \
--disable-outdevs \
--disable-avresample \
--extra-cflags="$ECFLAGS" \
--extra-cxxflags="$CFLAGS" \
--extra-ldflags="$LDFLAGS" \
--enable-avcodec \
--enable-avformat \
--enable-avutil \
--enable-swresample \
--enable-swscale \
--enable-avfilter \
--enable-network \
--enable-bsfs \
--enable-postproc \
--enable-filters \
--enable-encoders \
--enable-libass \
--enable-libx264 \
--enable-encoder=libx264 \
--disable-decoders \
--enable-decoder=mjpeg,mpeg4,h263,h264,flv,hevc,wmv3,msmpeg4v3,msmpeg4v2,msvideo1,vc1,mpeg1video,mpeg2video,\
aac,ac3,ac3_fixed,m4a,amrnb,amrwb,vorbis,wmav2,truehd,tscc,tscc2,dvvideo,msrle,cinepak,indeo5,vp8,vp9,\
mp3float,mp3,mp3adufloat,mp3adu,mp3on4float,mp3on4,aac_fixed,aac_latm,eac3,png,wmav1,wmv1,wmv2,\
pcm_alaw,pcm_dvd,pcm_f16le,pcm_f24le,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,zlib,flac,opus,mlp,\
pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s64be,pcm_s64le,pcm_mulaw,alac,adpcm_ms,\
pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_vidc,pcm_zork,adpcm_ima_qt,adpcm_ima_wav,gif \
--enable-muxers \
--enable-parsers \
--enable-protocols \
--enable-jni \
--enable-mediacodec \
--enable-decoder=h264_mediacodec \
--enable-decoder=hevc_mediacodec \
--enable-decoder=mpeg4_mediacodec \
--enable-decoder=vp9_mediacodec \
--disable-demuxers \
--enable-demuxer=aac,ac3,alaw,amr,amrnb,amrwb,ape,asf,asf_o,avi,cavsvideo,codec2,concat,dnxhd,eac3,flac,flv,\
gif,gif_pipe,h263,h264,hevc,hls,image2,image2pipe,jpeg_pipe,lrc,m4v,matroska,webm,mjpeg,mov,mp4,m4a,3gp,mp3,mpeg,\
mpegts,mv,ogg,png_pipe,realtext,rm,rtp,rtsp,pcm_s16be,pcm_s16le,pcm_s32be,pcm_s32le,sdp,srt,swf,\
vc1,wav,webm_dash,manifest,xmv,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,mpegvideo,mulaw,sami,srt \
$ADDITIONAL_CONFIGURE_FLAG || exit 1

make && make install || exit 1

popd
