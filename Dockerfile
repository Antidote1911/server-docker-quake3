# build ioquake3
FROM alpine:latest AS ioquake3-build

ENV \
    BUILD_STANDALONE=0 \
    BUILD_CLIENT=0 \
    BUILD_SERVER=1 \
    BUILD_GAME_SO=0 \
    BUILD_GAME_QVM=0 \
    BUILD_BASEGAME=1 \
    BUILD_MISSIONPACK=0 \
    BUILD_AUTOUPDATER=0 \
    USE_CURL=1 \
    USE_CURL_DLOPEN=0 \
    USE_INTERNAL_LIBS=0

RUN apk update \
    && apk upgrade \
    && apk --no-cache add \
    curl g++ gcc make git zlib-dev

RUN git clone https://github.com/ioquake/ioq3.git /ioq3 \
    && cd ioq3 \
    && make release

# move the bins to the actual image
FROM alpine:latest AS ioquake3

RUN \
    addgroup -g 1337 quake && \
    adduser -D -h /home/quake -G quake -u 1337 quake && \
    mkdir -pv /home/quake/.q3a/baseq3 && \
    ln -sfv /config/common.cfg /home/quake/.q3a/baseq3/ && \
    ln -sfv /config/ra.cfg /home/quake/.q3a/baseq3/ && \
    ln -sfv /config/ist.cfg /home/quake/.q3a/baseq3/ && \
    ln -sfv /config/ffa.cfg /home/quake/.q3a/baseq3/ && \
    ln -sfv /config/tdm.cfg /home/quake/.q3a/baseq3/ && \
    ln -sfv /config/ctf.cfg /home/quake/.q3a/baseq3/

COPY --from=ioquake3-build /ioq3/build/release-linux-x86_64/ /quake/
COPY static /static

EXPOSE $PORT
CMD /static/shell/entrypoint.sh
