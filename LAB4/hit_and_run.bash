#!/bin/bash

processes=()

if [[ -z $1 ]]; then
	echo "No given process."
	exit 1
fi

if [[ -z $2 || ! "$2" =~ ^[0-9]+$ ]]; then
	echo "No valid number of instances given."
	exit 1
fi

if [[ -z $3 || ! "$3" =~ ^[0-9]+$ ]]; then
	echo "No valid given time."
	exit 1
fi




if ! dpkg -V $1 > /dev/null 2>&1; then
	echo "Installing $1"
	sudo apt-get update -y > /dev/null
	sudo apt-get install $1 -y > /dev/null
fi

echo "$1 installed"
echo "Running $2 processes of $1 for $3 seconds in xterm"

for ((i=1; i<=$2; i++)); do
	xterm -e $1 > /dev/null 2>%1 &
	processes+=($!)
	#echo ${processes[@]}
done

sleep $3

kill ${processes[@]}

echo -n "Uninstall $1? (y/N) "
read val

if [[ "$val" == "y" || "$val" == "Y" ]]; then
	echo "Uninstalling $1"
	sudo apt-get remove $1 -y > /dev/null 
	exit 0
fi
