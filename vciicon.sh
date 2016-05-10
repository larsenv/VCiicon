#!/bin/bash

ARGUMENT="$1"

echo "VCiicon Beta by Larsenv."
echo "Requires ImageMagick for now, and icon to iconTex.png."
echo "\n"

rm -rf "meta"

mkdir "meta"

if (( $# != 1 ))
then
	echo "Usage:"
	echo "\n"
	echo "sh vciicon.sh <name of platform>"
    exit 1
fi

if [ "$ARGUMENT" = "GBA" ]
then 
	convert screenshot.png -resize 122x81\! -gravity center iconTex-GBA.png
	convert iconTex.png -gravity center -crop 128x128 iconTex-GBA.png
	composite -geometry +3+17 iconTex-GBA.png ./resources/iconTex-GBA.png ./resources/iconTex-GBA.png ./meta/iconTex.tga
	rm -rf iconTex-GBA.png
	convert screenshot.png -resize 400x266\! bootTvTex-GBA.png
	convert bootTvTex-GBA.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-GBA.png
fi

if [ "$ARGUMENT" = "N64" ]
then 
	convert screenshot.png -resize 122x92\! -gravity center iconTex.png
	convert iconTex.png -gravity center -crop 128x128 iconTex.png
	composite -geometry +3+9 iconTex.png ./resources/iconTex-N64.png ./resources/iconTex-N64.png ./meta/iconTex.tga
	rm -rf iconTex.png
	convert screenshot.png -resize 400x300\! screenshot.png
	convert screenshot.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite screenshot.png
fi

if [ "$ARGUMENT" = "NES" ]
then 
	convert screenshot.png -resize 122x92\! -gravity center iconTex.png
	convert iconTex.png -gravity center -crop 128x128 iconTex.png
	composite -geometry +3+9 iconTex.png ./resources/iconTex-NES.png ./resources/iconTex-NES.png ./meta/iconTex.tga
	rm -rf iconTex.png
	convert screenshot.png -resize 400x300\! screenshot.png
	convert screenshot.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite screenshot.png
fi

if [ "$ARGUMENT" = "SNES" ]
then 
	convert screenshot.png -resize 122x92\! -gravity center iconTex.png
	convert iconTex.png -gravity center -crop 128x128 iconTex.png
	composite -geometry +3+9 iconTex.png ./resources/iconTex-SNES.png ./resources/iconTex-SNES.png ./meta/iconTex.tga
	rm -rf iconTex.png
	convert screenshot.png -resize 400x300\! screenshot.png
	convert screenshot.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite screenshot.png
fi

cp ./resources/bootLogoTex.tga ./meta/bootLogoTex.tga
cp ./resources/bootMovie.h264 ./meta/bootMovie.h264
cp ./resources/bootSound.btsnd ./meta/bootSound.btsnd

echo "\n"
echo "Done."