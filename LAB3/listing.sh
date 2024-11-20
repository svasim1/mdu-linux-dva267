#!/bin/bash

# Set variable for output file
OUTPUT_FILE=listing.log

# The first echo overwrites the output file, and then it appends the files from /usr/bin
echo "/usr/bin" > $OUTPUT_FILE
ls $1 /usr/bin >> $OUTPUT_FILE

# Redirects and append the files of /etc
echo "/etc" >> $OUTPUT_FILE
ls $1 /etc >> $OUTPUT_FILE
