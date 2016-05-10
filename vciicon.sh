echo "VCiicon Beta by Larsenv."
echo "Requires ImageMagick for now, and icon to iconTex.png."
echo "\n"
convert iconTex.png -resize 122x81\! -gravity center iconTex.png
convert iconTex.png -gravity center -crop 128x128 iconTex.tga
composite -geometry +3+17 iconTex.tga ./resources/iconTex.png iconTex.bmp
echo "\n"
echo "Done."