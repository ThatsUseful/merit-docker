#
# Merit.me
#
FROM ubuntu:xenial
MAINTAINER Scott Rutherford <scott@usefulblocks.com>

ENV DEBIAN_FRONTEND noninteractive

# Update  and install
RUN apt-get update && apt-get install -y \
  build-essential libtool autotools-dev automake pkg-config \
  libssl-dev libevent-dev bsdmainutils python3 \
  apt-utils autoconf gcc g++ curl libboost-all-dev supervisor

# Setup supervisor
ADD supervisor/supervisor-meritd.conf /etc/supervisor/conf.d/
ADD supervisor/supervisord.conf /etc/supervisor/

# Get Berkeley DB 4.8 (later not supported)
RUN mkdir -p /src/berkeley-db && \
  cd /src/ && \
  curl -sL http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz | \
  tar xvz --strip-components=1 -C berkeley-db && \
  cd berkeley-db && \
  cd build_unix && \
  ../dist/configure --prefix=/usr/local --enable-cxx --disable-shared --with-pic && \
  make && make install

RUN mkdir -p /src/merit && \
  cd /src/ && \
  curl -sL https://github.com/meritlabs/merit/archive/m0.4.0.tar.gz | \
  tar xvz --strip-components=1 -C merit

# Compile Merit
RUN cd /src/merit && \
  ./autogen.sh && ./configure --enable-debug && \
  cd src/ && make obj/build.h && \
  cd ../ && make && make install

# Overwrite this in your dependent Dockerfile
CMD bash