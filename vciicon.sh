echo "VCiicon Beta by Larsenv."
echo "Requires ImageMagick for now, and icon to iconTex.png."
echo "\n"
convert iconTex.png -resize 130 -gravity center iconTex.png
convert iconTex.png -gravity center -crop 128x128 iconTex.tga
composite -gravity center ./resources/iconTex.png icon: iconTex.png
echo "\n"
echo "Done."