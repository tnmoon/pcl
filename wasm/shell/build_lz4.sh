#!/bin/bash

source $(dirname $0)/preset.sh

LIB_PATH=$DEPS_DIR/lz4

FLAGS=(
  -DCMAKE_INSTALL_PREFIX=${LIB_PATH}/buildr
)

cd $LIB_PATH
rm -rf $LIB_PATH/buildr
mkdir -p buildr

emcmake cmake ${FLAGS[@]} ./build/cmake
emmake make -j2 install