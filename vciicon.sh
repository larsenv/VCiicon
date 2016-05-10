echo "VCiicon Beta by Larsenv."
echo "Requires ImageMagick for now, and icon to iconTex.png."
echo "\n"
mkdir "meta"
convert iconTex.png -resize 122x81\! -gravity center iconTex.png
convert iconTex.png -gravity center -crop 128x128 iconTex.png
composite -geometry +3+17 iconTex.png ./resources/iconTex.png ./resources/iconTex.png ./meta/iconTex.tga
echo "\n"
echo "Done."