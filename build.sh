#!/bin/bash

BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"
SRC=src
DEST=output
BUILD="-b $SRC $DEST"
SERVE=""
REVEAL_VER=3.8.0

function buildReveal() {
  REPO=$1

  git clone $1 preso
  cd preso
  GEMFILE=`find . -name Gemfile`
  BASEDIR=`dirname $GEMFILE`
  cd $BASEDIR

  bundle exec asciidoctor-revealjs \
    -a revealjsdir=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/$REVEAL_VER \
    --destination-dir build \
    index.ad

  cp -r assets/* build/
}

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
