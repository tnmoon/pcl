#!/bin/bash

source $(dirname $0)/preset.sh

LIB_PATH=$DEPS_DIR/flann

FLAGS=(
  -DBUILD_C_BINDINGS=OFF
  -DBUILD_PYTHON_BINDINGS=OFF
  -DBUILD_MATLAB_BINDINGS=OFF
  -DBUILD_CUDA_LIB=OFF
  -DUSE_OPENMP=OFF
  -DUSE_MPI=OFF
  -DBUILD_EXAMPLES=OFF
  -DBUILD_TESTS=OFF
  -DBUILD_DOC=OFF
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_INSTALL_PREFIX=${LIB_PATH}/build
)

cd $LIB_PATH
rm -rf $LIB_PATH/build
mkdir -p build
cd $LIB_PATH/build

cp /root/pcl/wasm/deps/lz4/buildr/include/lz4.h /root/emsdk-3.1.65/upstream/emscripten/cache/sysroot/include/c++/v1
cp /root/pcl/wasm/deps/lz4/buildr/include/lz4hc.h /root/emsdk-3.1.65/upstream/emscripten/cache/sysroot/include/c++/v1

emcmake cmake ${FLAGS[@]} ..
emmake make -j2 install 
