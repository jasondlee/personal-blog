#!/bin/bash

SRC=src
DEST=output
BUILD="-b $SRC $DEST"
SERVE=""

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
