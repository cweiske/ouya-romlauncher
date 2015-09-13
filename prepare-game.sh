#!/bin/sh
set -e

#clean up from last run
./cleanup.sh

if [ $# -lt 3 ]; then
    echo "Usage: ./prepare-game.sh title java.package path-to-game.smc [cover.png]"
    exit
fi

title=$1
package=$2
fullpackage="romlauncher.$package"
filepath=$3
filename=`basename "$filepath"`

echo "Game title: $title"
echo "Full package path: $fullpackage"
echo "Game file: $filename"

#prepare manifest
sed -i\
 -e "s/FIXME_PACKAGE/$package/" \
 build.xml

#prepare build file
sed -i\
 -e "s/FIXME_PACKAGE/$fullpackage/" \
 -e "s/FIXME_TITLE/$title/" \
 AndroidManifest.xml

#copy game
mkdir -p assets/game
cp "$filepath" assets/game/

#prepare launcher
mkdir -p "src/romlauncher/$package"
sed -e "s/FIXME_PACKAGE/$fullpackage/"\
 -e "s/FIXME_FILENAME/$filename/"\
 LaunchRomActivity.java.tpl\
 > src/romlauncher/$package/LaunchRomActivity.java

if [ $# -gt 3 ]; then
    image=$4
    cp "$image" res/drawable-xhdpi/ouya_icon.png
    echo "Image copied"
else
    echo "Put a 732x412 image into res/drawable-xhdpi/ouya_icon.png"
fi

echo "All prepared."
