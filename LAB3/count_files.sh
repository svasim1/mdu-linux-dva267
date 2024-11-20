#!/bin/bash

# List one file per line, then count lines of output
echo "Files:"
ls -1 | wc -l

# The same as above, but it also counts hidden files
echo "Hidden files:"
ls -a1 | wc -l

