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
    echo "    -d : Deploy to production site"
    echo "    -n : Do NOT build"
    echo "    -s : Serve local copy"
    exit 0;
}

while getopts cdns opt
do
    case "$opt" in
        c)  echo "Cleaning..." ; rm -rf $DEST ;;
        d)  DEPLOY=true 
            DEV_CONFIG=""
            DRAFTS=""
            ;;
        n)  BUILD="" ;;
        s)  SERVE="serve --incremental" 
            BUILD=""
            ;;
        \?) usage ;;
    esac
done

if [ -n "$BUILD" -o -n "$SERVE" ] ; then
set -x
    jekyll $BUILD $SERVE -s $SRC --config $CONFIG$DEV_CONFIG $DRAFTS
fi

if [ "$DEPLOY" == "true" ] ; then
    source site.properties
    rsync -varuP --delete -e ssh $DEST/* ${BLOG_USERNAME}@${BLOG_HOST}:${BLOG_DIR}/
fi
