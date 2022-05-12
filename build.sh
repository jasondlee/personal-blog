#!/bin/bash


BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"
SRC=src
DEST=_site
BUILD="build"
DRAFTS="--drafts"
SERVE=""
DEV_CONFIG=",_dev_config.yml"
CONFIG="_config.yml"
REVEAL_VER=3.8.0

function usage() {
    echo "`basename $0`: <option>"
    echo "    -c : Clean output directory"
    echo "    -n : Do NOT build"
    echo "    -s : Serve local copy"
    exit 0;
}

while getopts cns opt
do
    case "$opt" in
        c)  echo "Cleaning..." ; rm -rf $DEST ;;
        n)  BUILD="" ;;
        s)  SERVE="serve --incremental" 
            BUILD=""
            ;;
        \?) usage ;;
    esac
done

if [ -n "$BUILD" -o -n "$SERVE" ] ; then
    bundle exec jekyll $BUILD $SERVE --config $CONFIG$DEV_CONFIG $DRAFTS
fi
