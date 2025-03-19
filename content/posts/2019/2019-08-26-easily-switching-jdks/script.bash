---
title: "Easily Switching JDKs"
date: 2019-08-26
tags: [JDK, Bash]
type: post
author: Jason Lee
status: published
---

Development environments can get fairly complex, and making sure you're using the right version of some library or another
can be annoying on the best of days. I have a situation like that where my "day job" requires (still, and hopefully not
for much longer) JDK 8, but my side projects, learning efforts, etc. can use a more modern version.

Years ago, https://twitter.com/headius[Charles Nutter] shared a
https://gist.github.com/happygiraffe/148320/aab71e624f4db87694717fef561e89c72b1acfc2[shell script] he uses to switch JDKs.
I've been happily using it, but I've made some minor tweaks, so I thought I'd share
my version here in case it helps someone (and make it easier for me to find in the future ;).

*UPDATE:* It seems the original author is https://twitter.com/nicksieger/status/1166070669244796929[Nick Sieger]. Thanks
to you as well, Nick, for a great little utility!

// more

The two primary changes in my script versus Charles' is that I try to set JDKS_ROOT if it's not already set, and I try
to filter out "false" JDK entries (where the Ubuntu packages, for example, seem to like to create symlinks). I have not
tested these changes to make sure I haven't broken MacOS support, however, so if you're on a Mac and this doesn't work
correctly, please let me know. :)

Without further ado:

[source, bash]
-----
#!/bin/bash
#
# Provides a function that allows you to choose a JDK.  Just set the environment
# variable JDKS_ROOT to the directory containing multiple versions of the JDK
# and the function will prompt you to select one.  JAVA_HOME and PATH will be cleaned
# up and set appropriately.

# Usage:
# Include in .profile or .bashrc or source at login to get 'pickjdk' command.
# 'pickjdk' alone to bring up a menu of installed JDKs on OS X. Select one.
# 'pickjdk <jdk number>' to immediately switch to one of those JDKs.

_checkos()
{
    if [ $(uname -s) = $1 ]; then
        return 0
    else
        return 1
    fi
}

if [ -z "$JDKS_ROOT" ] ; then
    if _checkos Linux ; then
        JDKS_ROOT=/usr/lib/jvm
    elif _checkos Darwin ; then
        JDKS_ROOT=/Library/Java/JavaVirtualMachines
    fi
fi

pickjdk()
{
    if [ -z "$JDKS_ROOT" ]; then
        return 1
    fi

    declare -a JDKS
    local n=1 jdk total_jdks choice=0 currjdk=$JAVA_HOME explicit_jdk
    for jdk in $JDKS_ROOT/[0-9a-z]*; do
        if [ ! -L $jdk -a -d $jdk -a -e $jdk/bin ]; then
            JDKNAMES[$n]="$(basename $jdk)"
            if _checkos Darwin ; then
                jdk=$jdk/Contents/Home
            fi
            if [ -z "$1" ]; then
              echo -n " $n) ${JDKNAMES[$n]}"
              if [ $jdk = "$currjdk" ]; then
                  echo " < CURRENT"
              else
                  echo
              fi
            fi
            JDKS[$n]=$jdk
            total_jdks=$n
            n=$[ $n + 1 ]
        fi
    done
    if [ -z "$1" ]; then
      echo " $n) None"
    fi
    JDKS[$n]=None
    total_jdks=$n

    if [ $total_jdks -gt 1 ]; then
        if [ -z "$1" ]; then
          while [ -z "${JDKS[$choice]}" ]; do
              echo -n "Choose one of the above [1-$total_jdks]: "
              read choice
          done
        else
          choice=$1
        fi
    fi

    if [ -z "$currjdk" ]; then
        currjdk=$(dirname $(dirname $(type -path java)))
    fi

    if [ ${JDKS[$choice]} != None ]; then
        export JAVA_HOME=${JDKS[$choice]}
    else
        unset JAVA_HOME
    fi

    explicit_jdk=
    for jdk in ${JDKS[*]}; do
        if [ "$currjdk" = "$jdk" ]; then
            explicit_jdk=$jdk
            break
        fi
    done

    if [ "$explicit_jdk" ]; then
        if [ -z "$JAVA_HOME" ]; then
            PATH=$(echo $PATH | sed "s|$explicit_jdk/bin:*||g")
        else
            PATH=$(echo $PATH | sed "s|$explicit_jdk|$JAVA_HOME|g")
        fi
    elif [ "$JAVA_HOME" ]; then
        PATH="$JAVA_HOME/bin:$PATH"
    fi

    echo "New JDK: ${JDKNAMES[$choice]}"

    hash -r
}
-----

To use this, add the following to your Bash profile:

[source,bash]
-----
source /path/to/pickjdk.sh
-----

Restart your shell (or source the file directly), and you can do this:

[source,bash]
-----
$ pickjdk
 1) java-11-openjdk-amd64 < CURRENT
 2) oracle-java8-jdk-amd64
 3) None
Choose one of the above [1-3]:
-----

Make your selection, and you're all set. It's awesome.
