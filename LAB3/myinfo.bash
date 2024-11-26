#!/bin/bash

# Usage message
__usage="Usage: myinfo.bash OPTION...
Print out system information

OPTIONS
-a, --all     Display all information
-v, --version Display linux version
-i, --ip      Display IP address
-m, --mac     Display MAC address
-h, --help    Display this help and exit"

# Functions to gather information
get_version() {
	lsb_release -a 2>/dev/null | grep "Description:" | cut -f2 -d$'\t' || echo "Linux version not found."
}

get_ip() {
	ip -br a 2>/dev/null | awk '/UP/{print $3}' | cut -d/ -f1 || echo "IP address not found."
}

get_mac() {
	ip link 2>/dev/null | awk '/link\/ether/ {print $2}' || echo "MAC address not found."
}

# If the number of arguments is equal to 0 - print message
if [[ $#  -eq 0 ]]; then
	echo "No options provided. Use --help for usage information."
	exit
fi

# While the number of arguments are greater than 0 - check all of them and print corresponding message
while [[ "$#" -gt 0 ]]; do
	case $1 in
		-a|--all)
			echo "Version: $(get_version)"
			echo "IP address: $(get_ip)"
			echo "MAC address: $(get_mac)"	
			;;
		-v|--version)
			echo "Version: $(get_version)"
			;;
		-i|--ip)
			echo "IP address: $(get_ip)"
			;;
		-m|--mac)
			echo "MAC address: $(get_mac)"	
			;;
		-h|--help)
			echo "$__usage"
			;;
		*)
			echo "Invalid option: $1. Use --help for usage information."
			exit
			;;
	esac
	shift
done
