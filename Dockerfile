# ----------------------------------
# Environment: ubuntu
# Minimum Panel Version: 1.X
# ----------------------------------
FROM ubuntu:20.04

LABEL author="Jimmi Hansen" maintainer="jimmi@xevotech.com"

ENV   DEBIAN_FRONTEND noninteractive

## add container user
RUN   useradd -m -d /home/container -s /bin/bash container

## update base packages
RUN   apt-get update \
 &&   apt-get upgrade -y

## install dependencies
RUN   apt-get install -y gcc g++ libgcc1 lib32gcc1 gdb libc6 libstdc++6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 bzip2 zlib1g iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
      libfontconfig libicu66 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev libzip5 locales ffmpeg apt-transport-https init-system-helpers \
      libcurl3-gnutls libjsoncpp1 liblua5.1-0 libluajit-5.1-2 libsqlite3-0 libfluidsynth2

RUN   apt-get install -y golang

## configure locale
RUN   update-locale lang=en_US.UTF-8 \
 &&   dpkg-reconfigure --frontend noninteractive locales

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/bash", "/entrypoint.sh"]