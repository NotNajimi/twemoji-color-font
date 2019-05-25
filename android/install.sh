#!/bin/bash

echo Creating and entering temporary directory
mkdir ~/twemoji-color-font && cd ~/twemoji-color-font/

echo Downloading assets...
curl -L -O https://github.com/eosrei/twemoji-color-font/releases/download/v12.0.1/TwitterColorEmoji-SVGinOT-12.0.1.zip > /dev/null 2>&1
echo Done

echo Unzipping archive...
unzip TwitterColorEmoji-SVGinOT-12.0.1.zip > /dev/null 2>&1
echo Done

echo Preparing files
cp TwitterColorEmoji-SVGinOT-12.0.1/TwitterColorEmoji-SVGinOT.ttf NotoColorEmoji.ttf
chmod 644 NotoColorEmoji.ttf

echo Remounting /system as read-write
su
mount -o rw,remount /system

echo Replacing emoji font
cp NotoColorEmoji.ttf /system/fonts/NotoColorEmoji.ttf
cp NotoColorEmoji.ttf /system/fonts/SamsungColorEmoji.ttf
cp NotoColorEmoji.ttf /system/fonts/AndroidEmoji-htc.ttf

echo Remounting /system as read-only
mount -o ro,remount /system
exit

echo Removing temporary directory
rm -rf ~/twemoji-color-font

echo Installation complete! Reboot for the changes to take effect
