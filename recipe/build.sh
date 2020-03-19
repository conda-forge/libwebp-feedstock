#!/bin/bash

# The libwebp build script doesn't pick all the other libraries up on its own
# (even though it should by using PREFIX), so pass all the necessary parameters
# for finding other imaging libraries to the configure script.
./configure --prefix=${PREFIX} --disable-gl --disable-dependency-tracking \
	--enable-libwebpmux --enable-libwebpdemux --enable-libwebpdecoder \
	--with-jpeglibdir=${PREFIX}/lib --with-jpegincludedir=${PREFIX}/include \
	--with-tifflibdir=${PREFIX}/../_build_env/lib --with-tiffincludedir=${PREFIX}/../_build_env/include \
	--with-giflibdir=${PREFIX}/lib --with-gifincludedir=${PREFIX}/include
make 
make check
make install
