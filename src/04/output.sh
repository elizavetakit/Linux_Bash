#!/bin/bash

echo -e "$color$color2 Hostname$ENDCOLOR\t = $color3$color4 $HOSTNAME$ENDCOLOR"
echo -e "$color$color2 TIMEZONE$ENDCOLOR\t = $color3$color4 $timezone$ENDCOLOR"
echo -e "$color$color2 USER$ENDCOLOR\t = $color3$color4 $USER$ENDCOLOR"
echo -e "$color$color2 OS$ENDCOLOR\t = $color3$color4 $OSTYPE$ENDCOLOR"
echo -e "$color$color2 DATE$ENDCOLOR\t = $color3$color4 $data$ENDCOLOR"
echo -e "$color$color2 UPTIME$ENDCOLOR\t = $color3$color4 $uptime$ENDCOLOR"
echo -e "$color$color2 UPTIME_SEC$ENDCOLOR\t = $color3$color4 $uptime_sec$ENDCOLOR"
echo -e "$color$color2 IP$ENDCOLOR\t = $color3$color4 $ip$ENDCOLOR"
echo -e "$color$color2 MASK$ENDCOLOR\t = $color3$color4 $mask$ENDCOLOR"
echo -e "$color$color2 GATEWAY$ENDCOLOR\t = $color3$color4 $gw$ENDCOLOR"
echo -e "$color$color2 RAM_TOTAL$ENDCOLOR\t = $color3$color4 $ram_total GB $ENDCOLOR"
echo -e "$color$color2 RAM_USED$ENDCOLOR\t = $color3$color4 $ram_used GB $ENDCOLOR"
echo -e "$color$color2 RAM_FREE$ENDCOLOR\t = $color3$color4 $ram_free GB $ENDCOLOR"
echo -e "$color$color2 SPACE_ROOT$ENDCOLOR\t = $color3$color4 $space_root MB $ENDCOLOR"
echo -e "$color$color2 SPACE_ROOT_USED$ENDCOLOR\t = $color3$color4 $space_root_used MB $ENDCOLOR"
echo -e "$color$color2 SPACE_ROOT_FREE$ENDCOLOR\t = $color3$color4 $space_root_free MB $ENDCOLOR"
echo " "

declare -A colors=( [1]="white" [2]="red" [3]="green" [4]="blue" [5]="purple" [6]="black" )

if [[ $background > 0 ]] && [[ $background < 7 ]] && [[ $fl = 0 ]]; then
        echo "Column 1 background = $background ("${colors[$background]}")"
else
        echo "Column 1 background = default ("${colors[6]}")"
fi

if [[ $fontcolor > 0 ]] && [[ $fontcolor < 7 ]] && [[ $fl1 = 0 ]]; then
        echo "Column 1 background = $fontcolor ("${colors[$fontcolor]}")"
else
        echo "Column 1 font color = default ("${colors[1]}")"
fi

if [[ $background2 > 0 ]] && [[ $background2 < 7 ]] && [[ $fl2 = 0 ]]; then
        echo "Column 2 background = $background2 ("${colors[$background2]}")"
else
        echo "Column 2 background = default ("${colors[2]}")"
fi

if [[ $fontcolor2 > 0 ]] && [[ $fontcolor2 < 7 ]] && [[ $fl3 = 0 ]]; then
        echo "Column 2 font color = $fontcolor2 ("${colors[$fontcolor2]}")"
else
        echo "Column 2 font color = default ("${colors[4]}")"
fi