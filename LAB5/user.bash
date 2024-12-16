#!/bin/bash

print_help() {
    echo "Usage: users.bash OPTION..."
    echo "Print users"
    echo "OPTIONS"
    echo "-u, --users       List all user accounts"
    echo "-o, --online      List all online users"
    echo "    --help         Display this help and exit"
}

list_users() {
    cut -d: -f1 /etc/passwd | column
}

list_online() {
	who | tr -s " "
}

case "$1" in
	-u|--users)
		list_users
		;;
	-o|--online)
		list_online
		;;
	--help)
		print_help
		;;
	*)
		echo "Invalid option: $1"
		echo "Try using --help for mor information."
		exit 1
		;;
esac

exit 0
