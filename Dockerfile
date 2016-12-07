FROM debian:latest
MAINTAINER Aesirteam "zhongkui@139.com"

RUN mkdir -p /etc/srs
VOLUME ["/etc/srs"]

RUN \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends sudo libpcre3 zlib1g && \
    apt-get install -y --force-yes --no-install-recommends build-essential libpcre3-dev zlib1g-dev make unzip python

ADD src/  /usr/src/

WORKDIR /usr/src/srs/trunk

RUN \
   ./configure --with-ssl --with-stat --without-hds --without-nginx --without-ffmpeg --without-transcode --without-ingest \
      --without-stream-caster --without-librtmp --without-utest && \
   make -j16 && make install

WORKDIR /usr/local/srs

RUN \
   rm -rf /usr/src/srs && \
   apt-get remove -y --force-yes --purge --auto-remove build-essential libpcre3-dev zlib1g-dev make unzip python && \
   rm -rf /var/lib/apt/lists/*

EXPOSE 1935 1985

ENTRYPOINT ["./objs/srs"]
