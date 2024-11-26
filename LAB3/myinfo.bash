#!/bin/bash

__usage="Usage: myinfo.bash OPTION...
Print out system information
OPTIONS
-a, --all display all information
-v, --version display linux version
-i, --ip display IP address
-m, --mac display MAC address
--help display this help and exit"

__version=	

__ip=ip -br a | tr -s " "| cut -f3 -d" "

__mac=ip a

case $1 in
	-a|--all)
		echo "Displays all"
		;;
	-v|--version)
		echo "Displays Linux version"
		;;
	-i|--ip)
		$__ip
		;;
	-m|--mac)
		echo "Displays MAC address"
		;;
	-h|--help)
		echo "$__usage"
		;;
	*)
		echo "Please use --help"
		;;
esac