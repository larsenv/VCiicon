#!/bin/bash

echo "VCiicon by Larsenv."
echo "Requires ImageMagick for now, and icon to iconTex.png."
echo "\n"

rm -rf "meta"

mkdir "meta"

if (( $# < 3 ))
then
	echo "Usage:"
	echo "\n"
	echo "sh vciicon.sh <name of platform> <title> <release_year> <release_type> <players>"
	echo "\n"
	echo "Name of platform can be DS, Famicom, GBA, MSX, N64, NES, PCEngine, SNES, or SuperFamicom. Required."
	echo "Title is the title of your game. Required."
	echo "Release Year is the year the game was released. Required."
	echo "Release Type can be Europe (Released in Europe), USA (Released in the USA), or Worldwide (Released). This is for cases for games like Super Mario Bros, where it was released in USA and Japan in 1985. Since it was released in Europe in 1987, you can use Europe as this argument to show the specific text."
    echo "Players is the number of players the game has support for. If the game has support for 4 players, you can either put 1-4 meaning 1 to 4 players can play."
    exit 1
fi

if [ "$4" = "Europe" ]
then
	RELEASED='Released in Europe: '
fi

if [ "$4" = "USA" ]
then
	RELEASED='Released in the USA: '
fi

if [ "$4" = "Worldwide" ]
then
	RELEASED='Released: '
fi

if [ -z "$4" ]
then
	RELEASED='Released: '
fi

if [ "$1" = "DS" ]
then
	convert screenshot.png -resize 122x92\! -gravity center iconTex-DS.png
	convert iconTex-DS.png -gravity center -crop 128x128 iconTex-DS.png
	composite -geometry +3+17 iconTex-DS.png ./resources/iconTex-DS.png ./resources/iconTex-DS.png ./meta/iconTex.tga
	rm -rf iconTex-DS.png
	convert screenshot.png -resize 400x266\! bootTvTex-DS.png
	convert bootTvTex-DS.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-DS.png
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-DS.png ./resources/bootTvTex-DS.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

if [ "$1" = "Famicom" ]
then
	convert screenshot.png -resize 122x92\! -gravity center iconTex-Famicom.png
	convert iconTex-Famicom.png -gravity center -crop 128x128 iconTex-Famicom.png
	composite -geometry +3+17 iconTex-Famicom.png ./resources/iconTex-Famicom.png ./resources/iconTex-Famicom.png ./meta/iconTex.tga
	rm -rf iconTex-Famicom.png
	convert screenshot.png -resize 400x266\! bootTvTex-Famicom.png
	convert bootTvTex-Famicom.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-Famicom.png
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-Famicom.png ./resources/bootTvTex-Famicom.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

if [ "$1" = "GBA" ]
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
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-NES.png ./resources/bootTvTex-GBA.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

if [ "$1" = "MSX" ]
then
	convert screenshot.png -resize 122x92\! -gravity center iconTex-MSX.png
	convert iconTex-MSX.png -gravity center -crop 128x128 iconTex-MSX.png
	composite -geometry +3+17 iconTex-MSX.png ./resources/iconTex-MSX.png ./resources/iconTex-MSX.png ./meta/iconTex.tga
	rm -rf iconTex-MSX.png
	convert screenshot.png -resize 400x266\! bootTvTex-MSX.png
	convert bootTvTex-MSX.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-MSX.png
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-MSX.png ./resources/bootTvTex-MSX.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

if [ "$1" = "N64" ]
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
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-NES.png ./resources/bootTvTex-N64.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

if [ "$1" = "NES" ]
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
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 5886,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-NES.png ./resources/bootTvTex-NES.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

if [ "$1" = "PCEngine" ]
then 
	convert screenshot.png -resize 122x92\! -gravity center iconTex-DS.png
	convert iconTex-DS.png -gravity center -crop 128x128 iconTex-DS.png
	composite -geometry +3+17 iconTex-PCEngine.png ./resources/iconTex-PCEngine.png ./resources/iconTex-PCEngine.png ./meta/iconTex.tga
	rm -rf iconTex-PCEngine.png
	convert screenshot.png -resize 400x266\! bootTvTex-PCEngine.png
	convert bootTvTex-PCEngine.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-PCEngine.png
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-PCEngine.png ./resources/bootTvTex-PCEngine.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

if [ "$1" = "SNES" ]
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
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-NES.png ./resources/bootTvTex-SNES.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

if [ "$1" = "SuperFamicom" ]
then
	convert screenshot.png -resize 122x92\! -gravity center iconTex-SuperFamicom.png
	convert iconTex-SuperFamicom.png -gravity center -crop 128x128 iconTex-SuperFamicom.png
	composite -geometry +3+17 iconTex-SuperFamicom.png ./resources/iconTex-SuperFamicom.png ./resources/iconTex-SuperFamicom.png ./meta/iconTex.tga
	rm -rf iconTex-SuperFamicom.png
	convert screenshot.png -resize 400x266\! bootTvTex-SuperFamicom.png
	convert bootTvTex-SuperFamicom.png \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite bootTvTex-SuperFamicom.png
     touch bootTvTex-Text.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,375 $2" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,375 $2" \
           bootTvTex-Text1.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-B.otf -pointsize 36 \
           -fill black  -draw "text 586,375 $2" \
           bootTvTex-Text2.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   -stroke white -strokewidth 5  -draw "text 586,480 $RELEASED $3" \
           -fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text4.png
     convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           -fill black  -draw "text 586,480 $RELEASED $3" \
           bootTvTex-Text5.png
     if [ -n "$5" ]
     then
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
		   	-stroke white -strokewidth 5  -draw "text 586,480 $5" \
           	-fill gradient:#0a0a0a:#2e2e2e  -draw "text 586,480 $5" \
           	bootTvTex-Text7.png
     	convert -size 1280x720 xc:none -font ./resources/Rodin-DB.otf -pointsize 36 \
           	-fill black  -draw "text 586,480 5" \
           	bootTvTex-Text8.png
     fi
	 composite bootTvTex-Text2.png bootTvTex-Text1.png bootTvTex-Text3.png
	 composite bootTvTex-Text5.png bootTvTex-Text4.png bootTvTex-Text6.png
	 if [ -n "$5" ]
	 then
	 	composite bootTvTex-Text8.png bootTvTex-Text7.png bootTvTex-Text9.png
	 fi
     composite -geometry +131+249 bootTvTex-SuperFamicom.png ./resources/bootTvTex-SuperFamicom.png ./meta/bootTvTex.tga
     if [ -n "$5" ]
     then
     	composite bootTvTex-Text9.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     fi
     composite bootTvTex-Text6.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     composite bootTvTex-Text3.png ./meta/bootTvTex.tga ./meta/bootTvTex.tga
     convert -resize 854x480\! ./meta/bootTvTex.tga ./meta/bootDrcTex.tga
     rm -rf bootTvTex-*.png
fi

cp ./resources/bootLogoTex.tga ./meta/bootLogoTex.tga
cp ./resources/bootMovie.h264 ./meta/bootMovie.h264
cp ./resources/bootSound.btsnd ./meta/bootSound.btsnd

echo "\n"
echo "Done."