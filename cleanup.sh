#!/bin/sh
set -e

#clean up from last run
git checkout AndroidManifest.xml res/drawable-xhdpi/ouya_icon.png
for i in `ls assets/game`; do
    rm assets/game/$i
done
[ -d bin ] && rm -r bin
[ -d gen ] && rm -r gen
[ -d src/romlauncher ] && rm -r src/romlauncher

exit 0
