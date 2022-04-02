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

sh output.sh $1 $2 $3 $4

read -p "Want to save data?(y/n) " answer
if [ $answer == y ]
        then
                log="$(date +"%d_%m_%y_%H_%M_%S").status"
                bash output.sh > $log
elif [ $answer == Y ]
        then
                log="$(date +"%d_%m_%y_%H_%M_%S").status"
                bash output.sh > $log
fi