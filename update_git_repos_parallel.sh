#!/bin/bash

# store the current dir
CUR_DIR=$(pwd)

# install & test GNU Parallel
#(wget -O - pi.dk/3 || curl pi.dk/3/ || fetch -o - http://pi.dk/3) | bash
#parallel -j0 ping -nc 3 ::: qubes-os.org gnu.org freenetproject.org

# Let the person running the script know what's going on.
echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

# Find all git repositories and update it to the master latest revision
# Processes N flows simultaneously (based on CPU cores)
find . -name ".git" | cut -c 3- | parallel -j +0 'a={}; echo ""; echo -e "\033[33m --==[ "$a" ]==-- \033[0m"; cd $a && cd .. ; git add -A; git commit -m "Automatic commit from <hostname> workstation"; git pull origin master; git push'

# for i in $(find . -name ".git" | cut -c 3-); do

echo -e "\n\033[32mComplete!\033[0m\n"
