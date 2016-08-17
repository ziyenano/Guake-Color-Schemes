#!/usr/bin/env bash

dir=./themes
theme_list=`ls -l $dir | awk '{print $NF}' | sed -n 's/\.theme// p'`
total_num=`ls -l $dir | grep -c \.theme`

cursor=1
name=`echo $theme_list | awk '{print $'"$cursor"'}'`

./guake_theme.sh $name

while [ 1 -eq 1 ] 
do
    read -sn1  key
    if [ "$key" = "n" ]; then
        if [ $cursor -eq $total_num ]; then 
            echo "already hit the bottom"
        else
            cursor=$(($cursor + 1)) 
            name=`echo $theme_list | awk '{print $'"$cursor"'}'`
            ./guake_theme.sh $name
        fi
    elif [ "$key" = "p" ]; then
        if [ $cursor -eq 1 ]; then 
            echo "already hit the top"
        else
            cursor=$(($cursor - 1))
            name=`echo $theme_list | awk '{print $'"$cursor"'}'`
            ./guake_theme.sh $name
        fi
    elif [ "$key" = "y" ]; then
        echo ""
        echo "--- the theme $name is chosen └(^o^)┘ ---"
        echo ""
        exit 0
    else 
        echo 'press the key among {p, n, y}'
    fi
done
