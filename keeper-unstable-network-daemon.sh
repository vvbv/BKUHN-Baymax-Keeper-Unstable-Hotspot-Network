#!/bin/bash

while :
do

	ping -q -c1 8.8.8.8 > /dev/null

	if [ $? -eq 0 ]
	then
		echo "Conected"
		echo "--[New check in 120 seconds]"
		sleep 120s>/dev/null
	else
		echo "Disconected"
		echo "--[Restarting Network-Manager]"
		service network-manager restart>/dev/null
		nmcli radio wifi off>/dev/null
		nmcli radio wifi on>/dev/null
		sleep 120s>/dev/null
	fi

done
