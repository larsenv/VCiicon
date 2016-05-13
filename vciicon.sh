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

if [ "$ARGUMENT" = "DS" ]
then 
	convert screenshot.png -resize 68x92\! -gravity center iconTex-DS.png
	convert iconTex-DS.png -gravity center -crop 128x128 iconTex-DS.png
	composite -geometry +3+17 iconTex-DS.png ./resources/iconTex-DS.png ./resources/iconTex-DS.png ./meta/iconTex.tga
	rm -rf iconTex-DS.png
	convert screenshot.png -resize 225x300\! bootTvTex-DS.png
	convert bootTvTex-DS.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-DS.png
     composite -geometry +132+249 bootTvTex-DS.png ./resources/bootTvTex-DS.png ./resources/bootTvTex-DS.png ./meta/bootTvTex.tga
	 composite -geometry +132+249 bootTvTex-DS.png -resize 854x480 ./resources/bootTvTex-DS.png ./resources/bootTvTex-DS.png ./meta/bootDrcTex.tga
fi

if [ "$ARGUMENT" = "GBA" ]
then 
	convert screenshot.png -resize 122x81\! -gravity center iconTex-GBA.png
	convert iconTex-GBA.png -gravity center -crop 128x128 iconTex-GBA.png
	composite -geometry +3+17 iconTex-GBA.png ./resources/iconTex-GBA.png ./resources/iconTex-GBA.png ./meta/iconTex.tga
	rm -rf iconTex-GBA.png
	convert screenshot.png -resize 400x266\! bootTvTex-GBA.png
	convert bootTvTex-GBA.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-GBA.png
     composite -geometry +132+260 bootTvTex-GBA.png ./resources/bootTvTex-GBA.png ./resources/bootTvTex-GBA.png ./meta/bootTvTex.tga
	 composite -geometry +132+260 bootTvTex-GBA.png -resize 854x480 ./resources/bootTvTex-GBA.png ./resources/bootTvTex-GBA.png ./meta/bootDrcTex.tga
fi

if [ "$ARGUMENT" = "N64" ]
then 
	convert screenshot.png -resize 122x92\! -gravity center iconTex-N64.png
	convert iconTex-N64.png -gravity center -crop 128x128 iconTex-N64.png
	composite -geometry +3+9 iconTex-N64.png ./resources/iconTex-N64.png ./resources/iconTex-N64.png ./meta/iconTex.tga
	rm -rf iconTex-N64.png
	convert screenshot.png -resize 400x300\! bootTvTex-N64.png
	convert bootTvTex-N64.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-N64.png
     composite -geometry +131+249 bootTvTex-N64.png ./resources/bootTvTex-N64.png ./resources/bootTvTex-N64.png ./meta/bootTvTex.tga
	 composite -geometry +131+249 bootTvTex-N64.png -resize 854x480 ./resources/bootTvTex-N64.png ./resources/bootTvTex-N64.png ./meta/bootDrcTex.tga
fi

if [ "$ARGUMENT" = "NES" ]
then 
	convert screenshot.png -resize 122x92\! -gravity center iconTex-NES.png
	convert iconTex-NES.png -gravity center -crop 128x128 iconTex-NES.png
	composite -geometry +3+9 iconTex-NES.png ./resources/iconTex-NES.png ./resources/iconTex-NES.png ./meta/iconTex.tga
	rm -rf iconTex-NES.png
	convert screenshot.png -resize 400x300\! bootTvTex-NES.png
	convert bootTvTex-NES.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-NES.png
     composite -geometry +131+249 bootTvTex-NES.png ./resources/bootTvTex-NES.png ./resources/bootTvTex-NES.png ./meta/bootTvTex.tga
	 composite -geometry +131+249 bootTvTex-NES.png -resize 854x480 ./resources/bootTvTex-NES.png ./resources/bootTvTex-NES.png ./meta/bootDrcTex.tga
fi

if [ "$ARGUMENT" = "SNES" ]
then 
	convert screenshot.png -resize 122x92\! -gravity center iconTex-SNES.png
	convert iconTex-SNES.png -gravity center -crop 128x128 iconTex-SNES.png
	composite -geometry +3+9 iconTex-SNES.png ./resources/iconTex-SNES.png ./resources/iconTex-SNES.png ./meta/iconTex.tga
	rm -rf iconTex-SNES.png
	convert screenshot.png -resize 400x300\! bootTvTex-SNES.png
	convert bootTvTex-SNES.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-SNES.png
     composite -geometry +131+249 bootTvTex-SNES.png ./resources/bootTvTex-SNES.png ./resources/bootTvTex-SNES.png ./meta/bootTvTex.tga
	 composite -geometry +131+249 bootTvTex-SNES.png -resize 854x480 ./resources/bootTvTex-SNES.png ./resources/bootTvTex-SNES.png ./meta/bootDrcTex.tga
fi

cp ./resources/bootLogoTex.tga ./meta/bootLogoTex.tga
cp ./resources/bootMovie.h264 ./meta/bootMovie.h264
cp ./resources/bootSound.btsnd ./meta/bootSound.btsnd

echo "\n"
echo "Done."