#!/bin/bash

MINPARAMS=2

echo "VCiicon Beta by Larsenv."
echo "Requires ImageMagick for now, and icon to iconTex.png."
echo "\n"
mkdir -p "meta"
if [ "GBA" ]
then 
	convert iconTex.png -resize 122x81\! -gravity center iconTex.png
	convert iconTex.png -gravity center -crop 128x128 iconTex.png
	composite -geometry +3+17 iconTex.png ./resources/iconTex-GBA.png ./resources/iconTex-GBA.png ./meta/iconTex.tga
fi
if [ "NES" ]
then 
	convert iconTex.png -resize 122x92\! -gravity center iconTex.png
	convert iconTex.png -gravity center -crop 128x128 iconTex.png
	composite -geometry +3+9 iconTex.png ./resources/iconTex-NES.png ./resources/iconTex-NES.png ./meta/iconTex.tga
fi
if [ "SNES" ]
then 
	convert iconTex.png -resize 122x92\! -gravity center iconTex.png
	convert iconTex.png -gravity center -crop 128x128 iconTex.png
	composite -geometry +3+9 iconTex.png ./resources/iconTex-SNES.png ./resources/iconTex-SNES.png ./meta/iconTex.tga
fi
rm iconTex.png
echo "\n"
echo "Done."