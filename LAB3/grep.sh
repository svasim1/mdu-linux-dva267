#!/bin/bash

# Displays all files under /usr containing "man"
find /usr -type f | grep man 

# Displays all files under /usr containing "man" using ls
ls -R /usr | grep man


# grep '^a' greps everything beginning with a
# grep 'st$' greps everything ending in st
# grep 'p.*n' greps everything containing p...n
