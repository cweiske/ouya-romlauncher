#!/bin/sh
set -e

#clean up from last run
./cleanup.sh

if [ $# -lt 3 ]; then
    echo "Usage: ./prepare-game.sh title java.package path-to-game.smc"
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
 -e "s/FIXME_PACKAGE/$fullpackage/" \
 -e "s/FIXME_TITLE/$title/" \
 AndroidManifest.xml

#copy game
cp "$filepath" assets/game/

#prepare launcher
mkdir -p "src/romlauncher/$package"
sed -e "s/FIXME_PACKAGE/$fullpackage/"\
 -e "s/FIXME_FILENAME/$filename/"\
 LaunchRomActivity.java.tpl\
 > src/romlauncher/$package/LaunchRomActivity.java

echo "All prepared."
echo "Put a 732x412 image into res/drawable-xhdpi/ouya_icon.png"
