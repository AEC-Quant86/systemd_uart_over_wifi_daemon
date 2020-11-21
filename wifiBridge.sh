#!/bin/bash
FILE="/etc/wifiBridge/wifiBridge_db"
#FILE="wifiBridge_db"

function startBridge 
{
    devName=$1
    user=$(whoami)
    ip_port=$2
    res=1
    until [ res == 0 ]
    do
        res=exec socat pty,link=/dev/$devName,ignoreeof,user=$user,group=dialout,mode=777,raw,echo=0 tcp:$ip_port 
    done
}

function readDB 
{
    
    if test -f $FILE
    then 
        pwd
        cat $FILE | while read LINE; do
            echo $LINE
            args=($(echo $LINE | tr " " "\n"))
            echo "0:${args[0]} 1:${args[1]}"
            startBridge ${args[0]} ${args[1]} 
        done 
    fi
}

echo "Reading DB and starting Serial-Over-WiFi bridges"

readDB
for ((;;))
do
sleep 2
done
exit 0

