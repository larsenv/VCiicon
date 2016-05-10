#!/bin/bash

# Call this script with at least 10 parameters, for example
# ./scriptname 1
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
	rm iconTex.png
fi
echo "\n"
echo "Done."