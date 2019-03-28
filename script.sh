#!/bin/sh

curl -O https://ip-ranges.amazonaws.com/ip-ranges.json

function error_exit
{
  echo "$1" 1>&2
  exit
}

var=`cat ip-ranges.json | grep syncToken | awk '{print $1}' | sed -e 's/\"//g' -e 's/\://g'`
now=`date +%m_%d_%Y`

if [ "$var" == "syncToken" ]; then
  cat ip-ranges.json | grep -B 2 EC2 | grep ip_prefix | awk '{print $2}' | sed -e 's/\"//g' -e 's/\,//g' > aws_ip_ranges_$now.txt
else
  error_exit "Invalid IP Ranges File!"
fi

rm ip-ranges.json
exit 0
