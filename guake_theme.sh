#!/usr/bin/env bash

dir=./themes

if [ $1 = "-l" ]; then
    ls -l $dir | awk '{print $NF}' | sed -n 's/\.theme// p'
    echo "--- all available themes ---"
    exit 0
fi

if [ ! -f $dir/$1.theme ]; then
    echo "Warning: there is no theme called $1, using option -l to cheack all available themes."
    exit 0
else
    . ./$dir/$1.theme
fi

function color_repeat()
{
    char=''
    for i in 1 3 5
    do
        tmp=${1:${i}:2}
        char=${char}${tmp}${tmp}
    done
        echo ${1:0:1}$char
}


palette=`color_repeat $COLOR_01`
loc="01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16"
for i in $loc 
do
    eval color=\$COLOR_$i
    palette=$palette:`color_repeat $color`
done


BACKGROUND_COLOR=`color_repeat $BACKGROUND_COLOR`
FOREGROUND_COLOR=`color_repeat $FOREGROUND_COLOR`

palette=$palette:$BACKGROUND_COLOR:$FOREGROUND_COLOR

#gconftool-2 -s -t string /apps/guake/style/background/color $BACKGROUND_COLOR
#gconftool-2 -s -t string /apps/guake/style/font/color $FOREGROUND_COLOR
#gconftool-2 -s -t string /apps/guake/style/font/palette $palette
dconf write /apps/guake/style/background/color "'$BACKGROUND_COLOR'"
dconf write /apps/guake/style/font/color "'$FOREGROUND_COLOR'"
dconf write /apps/guake/style/font/palette "'$palette'"
dconf write /apps/guake/style/font/palette-name "'$1'"
