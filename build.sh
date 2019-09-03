#!/bin/bash

SRC=src
DEST=output
BUILD="-b $SRC $DEST"
SERVE=""

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
        c) rm -rf $DEST ;;
        d) DEPLOY=true ;;
        n) BUILD="" ;;
        s) SERVE="-s" ;;
        \?) usage ;;
    esac
done

if [ -n "$BUILD" -o -n "$SERVE" ] ; then
    jbake $BUILD $SERVE
fi

if [ "$DEPLOY" == "true" ] ; then
    source site.properties
    rsync -varuP --delete -e ssh $DEST/* ${BLOG_USERNAME}@${BLOG_HOST}:${BLOG_DIR}/
fi
