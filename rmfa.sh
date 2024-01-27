#! /bin/bash 

# Remove all the folders from 'trash' directory

RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"
BOLD="\e[1m"

echo -e "-----------------------------------------------------------------"
echo -e "${GREEN}${BOLD}Removing all the folders from 'trash' directory...${END}"

find /home/user/trash/* -type d -exec sudo rm -rf {} +

echo -e "${GREEN}${BOLD}Completed!!${END}"
echo -e "-----------------------------------------------------------------"
