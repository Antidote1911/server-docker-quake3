# build ioquake3
FROM bitnami/minideb:latest AS ioquake3-build

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

RUN apt update && apt install -y ca-certificates build-essential git zlib1g-dev pkg-config && update-ca-certificates 

RUN git clone https://github.com/ioquake/ioq3.git /ioq3 \
    && cd ioq3 \
    && make release

# move the bins to the actual image
FROM bitnami/minideb:latest AS ioquake3

RUN groupadd -g 1337 quake && useradd -u 1337 -g quake -s /bin/sh quake

RUN mkdir -pv /home/quake/.q3a/baseq3 && \
    mkdir -pv /home/quake/.q3a/cpma && \
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

