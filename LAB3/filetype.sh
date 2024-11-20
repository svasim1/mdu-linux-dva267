#!/bin/bash

if [[ $# -eq 0 ]] then
	echo "Användning: $0 filnamn [filnamn...]"
	exit 1
fi

for arg in "$@"; do
	if [[ -d "$arg" ]]; then
		echo "$arg: Mapp"
	elif [[ -h "$arg" ]]; then
		echo "$arg: Symbolisk länk"
	elif [[ -x "$arg" ]]; then
		echo "$arg: Exekverbar fil"
	elif [[ -f "$arg" ]]; then
		echo "$arg: Vanlig fil"
	else
		echo "$arg: Okänd typ"
fi
done
