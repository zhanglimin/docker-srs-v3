FROM debian:latest
#FROM resin/rpi-raspbian:wheezy

MAINTAINER Aesirteam "zhongkui@139.com"
ENV TARGET_DIR /usr/local/srs

VOLUME $TARGET_DIR/conf
VOLUME $TARGET_DIR/objs/nginx/html
VOLUME $TARGET_DIR/logs

ADD src/  /usr/src/

RUN apt-get update
RUN apt-get install -y --force-yes --no-install-recommends sudo build-essential make unzip python && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /usr/src/srs/trunk

RUN ./configure --with-ssl --with-stat --without-hds --without-nginx --without-ffmpeg --without-transcode \
      --without-ingest --without-stream-caster --without-librtmp --without-utest
RUN make -j16 && make install

WORKDIR $TARGET_DIR

RUN \
   rm -rf /usr/src/srs conf/*.conf && \
   apt-get purge -y --force-yes --auto-remove build-essential make unzip python && \
   apt-get clean

EXPOSE 1935 1985

ENTRYPOINT ["./objs/srs","-c","conf/srs.conf"]
