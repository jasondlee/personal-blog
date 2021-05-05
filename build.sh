#!/bin/bash


BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"
SRC=src
DEST=_site
BUILD="build"
SERVE=""
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
        c) echo "Cleaning..." ; rm -rf $DEST ;;
        d) DEPLOY=true ;;
        n) BUILD="" ;;
        s) SERVE="serve --incremental" 
            CONFIG="$CONFIG,_dev_config.yml"
            ;;
        \?) usage ;;
    esac
done

if [ -n "$BUILD" -o -n "$SERVE" ] ; then
    jekyll $BUILD $SERVE --config $CONFIG
fi

if [ "$DEPLOY" == "true" ] ; then
    source site.properties
    rsync -n -varuP --delete -e ssh $DEST/* ${BLOG_USERNAME}@${BLOG_HOST}:${BLOG_DIR}/
fi
