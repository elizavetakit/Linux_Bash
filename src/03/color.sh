#!/bin/bash

if [[ $1 == 1 ]];then
    export color="\033[47m"
elif [[ $1 == 2 ]]; then
    export color="\033[41m"
elif [[ $1 == 3 ]]; then
    export color="\033[42m"
elif [[ $1 == 4 ]]; then
    export color="\033[46m"
elif [[ $1 == 5 ]]; then
    export color="\033[45m"
elif [[ $1 == 6 ]]; then
    export color="\033[40m"
fi

if [[ $2 == 1 ]]; then
    export color2="\033[37m"
elif [[ $2 == 2 ]]; then
    export color2="\033[31m"
elif [[ $2 == 3 ]]; then
    export color2="\033[32m"
elif [[ $2 == 4 ]]; then
    export color2="\033[36m"
elif [[ $2 == 5 ]]; then
    export color2="\033[35m"
elif [[ $2 == 6 ]]; then
    export color2="\033[30m"
fi

if [[ $3 == 1 ]]; then
    export color3="\033[47m"
elif [[ $3 == 2 ]]; then
    export color3="\033[41m"
elif [[ $3 == 3 ]]; then
    export color3="\033[42m"
elif [[ $3 == 4 ]]; then
    export color3="\033[46m"
elif [[ $3 == 5 ]]; then
    export color3="\033[45m"
elif [[ $3 == 6 ]]; then
    export color3="\033[40m"
fi

if [[ $4 == 1 ]]; then
    export color4="\033[37m"
elif [[ $4 == 2 ]]; then
    export color4="\033[31m"
elif [[ $4 == 3 ]]; then
    export color4="\033[32m"
elif [[ $4 == 4 ]]; then
    export color4="\033[36m"
elif [[ $4 == 5 ]]; then
    export color4="\033[35m"
elif [[ $4 == 6 ]]; then
    export color4="\033[30m"
fi

export ENDCOLOR="\033[0m"

if [[ $1 = $2 ]] || [[ $3 = $4 ]]; then
    printf "The color of the text and background are the same.\n"
    read -p "Run the script again? (Y/N): " item
    case $item in
        y|Y)
            read -p "Enter values separated by a space: " a b c d
            bash main.sh $a $b $c $d
    esac
else
        sudo chmod +x output.sh
        bash output.sh
fi