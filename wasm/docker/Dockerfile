ARG UBUNTU_VERSION=20.04

FROM "ubuntu:${UBUNTU_VERSION}"

ARG EMSDK_VERSION=3.1.65

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get -V install -y \
    cmake \
    python3 \
    unzip \
    wget \
    pkg-config \
    build-essential \
    git

RUN mkdir -p /root/download && \
    wget -O /root/download/emsdk-${EMSDK_VERSION}.zip https://codeload.github.com/emscripten-core/emsdk/zip/refs/tags/${EMSDK_VERSION} && \
    unzip /root/download/emsdk-${EMSDK_VERSION}.zip -d /root && \ 
    rm /root/download/emsdk-${EMSDK_VERSION}.zip && \
    cd /root/emsdk-${EMSDK_VERSION} && \
    ./emsdk install latest && \
    ./emsdk activate latest && \
    echo "source "/root/emsdk-$EMSDK_VERSION/emsdk_env.sh"" >> $HOME/.bashrc

RUN echo "export PKG_CONFIG_PATH=/root/pcl/wasm/deps/lz4/buildr/lib/pkgconfig:$PKG_CONFIG_PATH" >> $HOME/.bashrc

RUN git clone -b wasm --single-branch --depth=1 https://github.com/tnmoon/pcl /root/pcl && \
    cd /root/pcl && \
    wasm/shell/build.sh
