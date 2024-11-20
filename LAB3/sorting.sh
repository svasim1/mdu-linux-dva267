#!/bin/bash

# A.
echo "A."
cat numbers.txt | sort -g

# B.
echo "B."
cat numbers.txt | sort -gu

# C.
echo "C."
sort -go sorted.txt numbers.txt
