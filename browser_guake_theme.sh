#!/usr/bin/env bash

dir=./themes
theme_list=`ls -l $dir | awk '{print $NF}' | sed -n 's/\.theme// p'`
total_num=`ls -l $dir | grep -c \.theme`

cursor=1
name=`echo $theme_list | awk '{print $'"$cursor"'}'`

function reecho {
    # replace current line with text output
    echo -e "\033[1A\033[2K\r$1"
}

echo ""
./guake_theme.sh $name

while [ 1 -eq 1 ] 
do
    read -sn1  key
    if [ "$key" = "n" ]; then
        if [ $cursor -eq $total_num ]; then 
            reecho "already hit the bottom"
        else
            cursor=$(($cursor + 1)) 
            name=`echo $theme_list | awk '{print $'"$cursor"'}'`
            reecho "Current theme: $name"
            ./guake_theme.sh $name
        fi
    elif [ "$key" = "p" ]; then
        if [ $cursor -eq 1 ]; then 
            reecho "already hit the top"
        else
            cursor=$(($cursor - 1))
            name=`echo $theme_list | awk '{print $'"$cursor"'}'`
            reecho "Current theme: $name"
            ./guake_theme.sh $name
        fi
    elif [ "$key" = "y" ]; then
        echo ""
        echo "--- the theme $name is chosen └(^o^)┘ ---"
        echo ""
        exit 0
    else 
        reecho 'press the key among {p, n, y}'
    fi
done
