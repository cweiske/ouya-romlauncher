#!/bin/sh
set -e

#clean up from last run
git checkout AndroidManifest.xml build.xml res/drawable-xhdpi/ouya_icon.png

[ -d assets/game ] && rm -r assets/game
[ -d bin ] && rm -r bin
[ -d gen ] && rm -r gen
[ -d src/romlauncher ] && rm -r src/romlauncher

exit 0
