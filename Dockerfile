FROM ubuntu:20.04
RUN apt-get update && apt-get install -y git cmake && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/zhlynn/zsign.git && cd zsign && chmod +x INSTALL.sh && mkdir build && ./INSTALL.sh