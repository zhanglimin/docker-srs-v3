FROM debian:latest
MAINTAINER Aesirteam "zhongkui@139.com"

RUN \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends libpcre3 zlib1g nginx sudo && \
    apt-get install -y --force-yes --no-install-recommends build-essential libpcre3-dev zlib1g-dev make unzip python

COPY src/  /usr/src/

WORKDIR /usr/src/srs/trunk

RUN \
   ./configure --with-ssl --with-stat --without-hds --without-nginx --without-ffmpeg --without-transcode --without-ingest \
      --without-stream-caster --without-librtmp --without-utest && \
   make -j16 && make install

WORKDIR /usr/local/srs
COPY default.conf conf/

RUN \
   rm -rf /usr/src/srs && \
   apt-get remove -y --force-yes --purge --auto-remove build-essential libpcre3-dev zlib1g-dev make unzip python && \
   rm -rf /var/lib/apt/lists/*

CMD ["./objs/srs", "-c", "conf/default.conf"]

EXPOSE 1935
EXPOSE 1985
