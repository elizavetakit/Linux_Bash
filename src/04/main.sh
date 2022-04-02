#!/bin/bash

export HOSTNAME=$(hostnamectl | sed -n '1p' | awk '{print $3}')
export data=$(date '+%d %B %Y %H:%M:%S')
export timezone=$(cat /etc/timezone)
export uptime=$(uptime -p)
export OSTYPE=$(cat /etc/issue)
export uptime_sec=$(awk '{print $1}' /proc/uptime)
export netdevice=$(ip r | grep default | awk '/default/ {print $5}')
export ip=$(ip r | grep defaul | awk '{print $9}')
export mask=$(ifconfig "$netdevice"| awk '/netmask/{print $4;}')
export gw=$(ip r | grep default | awk '{print $3}')
export ram_total=$(awk '{printf("%.3f", $2*0.000001); exit}' /proc/meminfo)
export ram_used=$(free | sed -n '2p' | awk '{printf("%.3f", $3*0.000001)}')
export ram_free=$(free | sed -n '2p' | awk '{printf("%.3f", $4*0.000001)}')
export space_root=$(df -h | sed -n '4p' | awk '{printf("%.2f", $2*1000)}')
export space_root_used=$(df -h | sed -n '4p' | awk '{printf("%.2f", $3*1000)}')
export space_root_free=$(df -h | sed -n '4p' | awk '{printf("%.2f", $4*1000)}')

export background=$(cat color.conf | sed -n '1p' | awk '{print $2}')
export fontcolor=$(cat color.conf | sed -n '2p' | awk '{print $2}')
export background2=$(cat color.conf | sed -n '3p' | awk '{print $2}')
export fontcolor2=$(cat color.conf | sed -n '4p'| awk '{print $2}')

export fl=0
export fl1=0
export fl2=0
export fl3=0

if [[ $background = "" ]]; then
        background=6
        fl=1
fi
if [[ $fontcolor = "" ]]; then
        fontcolor=1
        fl1=1
fi
if [[ $background2 = "" ]]; then
        background2=2
        fl2=1
fi
if [[ $fontcolor2 = "" ]]; then
        fontcolor2=4
        fl3=1
fi

flag=0

for var in $background $fontcolor $background2 $fontcolor2
do
        if ! [[ $var =~ ^[1-6]$ ]]; then
                printf "Invalid argument: %s\nArguments must be in range 1-6\nTry to restart script\n" $var
                flag=1
        fi
done

if [[ $flag == 0 ]]; then
        sudo chmod +x color.sh
        bash color.sh $background $fontcolor $background2 $fontcolor2
fi