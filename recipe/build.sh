#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

# The libwebp build script doesn't pick all the other libraries up on its own
# (even though it should by using PREFIX), so pass all the necessary parameters
# for finding other imaging libraries to the configure script.
./configure --prefix=${PREFIX} --disable-gl --disable-dependency-tracking \
	--enable-libwebpmux --enable-libwebpdemux --enable-libwebpdecoder \
	--with-jpeglibdir=${PREFIX}/lib --with-jpegincludedir=${PREFIX}/include \
	--with-tifflibdir=${PREFIX}/lib --with-tiffincludedir=${PREFIX}/include \
	--with-giflibdir=${PREFIX}/lib --with-gifincludedir=${PREFIX}/include
make 
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check
fi
make install
