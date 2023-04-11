FROM ubuntu:20.04
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y  \
    git  \
    wget  \
    zip  \
    unzip  \
    build-essential  \
    checkinstall  \
    zlib1g-dev  \
    libssl-dev \
    nodejs && rm -rf /var/lib/apt/lists/*
RUN wget -qO- "https://cmake.org/files/v3.21/cmake-3.21.3-linux-x86_64.tar.gz" |  \
    tar --strip-components=1 -xz -C /usr/local
RUN git clone https://github.com/zhlynn/zsign.git /root/zsign
RUN cd /root/zsign && mkdir -p build && cd build && cmake .. && make
EXPOSE 3000