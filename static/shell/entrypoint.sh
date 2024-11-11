#!/bin/sh
. /static/shell/common

trap shutdown SIGTERM SIGINT

# -- verify baseq3 and osp presents and not empty -- #

if [ -z "$(find /quake/baseq3 -mindepth 1 -maxdepth 1)" ]; then
    pinfo "Folder baseq3 is empty or not exist. Copy from static folder..."
    cp -a "/static/files/baseq3/." "/quake/baseq3/"
    chmod -R 777 /quake/baseq3/
else
    echo "Folder baseq3 is not empty."
fi

if [ -z "$(find /quake/cpma -mindepth 1 -maxdepth 1)" ]; then
    pinfo "Folder cpma is empty or not exist. Copy from static folder..."
    cp -a "/static/files/cpma/." "/quake/cpma/"
    chmod -R 777 /quake/cpma/
else
    echo "Folder cpma is not empty."
fi

# -- /config/xxxxx.cfg existence -- #

if [ ! -f "/config/common.cfg" ]; then
    pwarn "/config/common.cfg is missing."
    pinfo "static files default common config will be used."
    cp "/static/files/base_common.cfg" "/config/common.cfg"
    chmod -R 777 /config/common.cfg
fi

if [ ! -f "/config/ctf.cfg" ]; then
    pwarn "/config/ctf.cfg is missing."
    pinfo "static files default ctf config will be used."
    cp "/static/files/base_ctf.cfg" "/config/ctf.cfg"
    chmod -R 777 /config/ctf.cfg
fi

if [ ! -f "/config/ffa.cfg" ]; then
    pwarn "/config/ffa.cfg is missing."
    pinfo "static files default ffa config will be used."
    cp "/static/files/base_ffa.cfg" "/config/ffa.cfg"
    chmod -R 777 /config/ffa.cfg
fi

if [ ! -f "/config/tdm.cfg" ]; then
    pwarn "/config/tdm.cfg is missing."
    pinfo "static files default tdm config will be used."
    cp "/static/files/base_tdm.cfg" "/config/tdm.cfg"
    chmod -R 777 /config/tdm.cfg
fi

if [ ! -f "/config/ist.cfg" ]; then
    pwarn "/config/ist.cfg is missing."
    pinfo "static files default ist config will be used."
    cp "/static/files/base_ist.cfg" "/config/ist.cfg"
    chmod -R 777 /config/ist.cfg
fi

if [ ! -f "/config/ra.cfg" ]; then
    pwarn "/config/ra.cfg is missing."
    pinfo "static files default ra config will be used."
    cp "/static/files/base_ra.cfg" "/config/ra.cfg"
    chmod -R 777 /config/ra.cfg
fi

sync
# -- action -- #
_ARGS="+set fs_game cpma"
_ARGS="${_ARGS} +exec common.cfg"
_ARGS="${_ARGS} +exec ${GAME_CFG}"
_ARGS="${_ARGS} ${EXTRA_ARGS}"


pinfo "ioq3ded.x86_64 cmdline args:"
pinfo "${_ARGS}"

pinfo "///////////////"
ls /
pinfo "///////////////"
ls /quake/
pinfo "///////////////"
ls /quake/baseq3/
pinfo "///////////////"

pinfo "setting permissions."
chown -Rh quake:quake /config /home/quake
evalret

su quake -c "/quake/ioq3ded.x86_64 ${_ARGS}" &
#su quake -c "/quake/ioq3ded.x86_64 ${_ARGS}" &

wait $!
