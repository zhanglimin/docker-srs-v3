FROM debian:latest
#FROM resin/rpi-raspbian:jessie

MAINTAINER Aesirteam "zhongkui@139.com"
ENV TARGET_DIR /usr/local/srs

VOLUME $TARGET_DIR/conf
VOLUME $TARGET_DIR/objs/nginx/html
VOLUME $TARGET_DIR/logs

ADD src/  /usr/src/

RUN apt-get update
RUN apt-get install -y --force-yes --no-install-recommends sudo libpcre3 zlib1g && \
    apt-get install -y --force-yes --no-install-recommends build-essential libpcre3-dev zlib1g-dev make unzip python


WORKDIR /usr/src/srs/trunk

RUN ./configure --with-ssl --with-stat --without-hds --without-nginx --without-ffmpeg --without-transcode \
      --without-ingest --without-stream-caster --without-librtmp --without-utest
RUN make -j16 && make install

WORKDIR $TARGET_DIR

RUN \
   rm -rf /usr/src/srs conf/*.conf && \
   apt-get remove -y --force-yes --purge --auto-remove build-essential libpcre3-dev zlib1g-dev make unzip python && \
   rm -rf /var/lib/apt/lists/* && apt-get clean

EXPOSE 1935 1985

ENTRYPOINT ["./objs/srs","-c","conf/srs.conf"]
