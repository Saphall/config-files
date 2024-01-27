#! /bin/bash

# Remove Docker containers and images

# remove containers except : sqlserver, mongodb
containers_to_remove=$(docker ps -a | grep -v "mssql" | grep -v "mongodb" |  awk 'NR>1 {print $1}')

if [ -n "$containers_to_remove" ]; then
		docker rm $containers_to_remove 
		echo -e "\e[1;32m[+] Containers removed!"
else
		echo -e "\e[1;31m[-] No containers to be cleaned!\e[0m"
fi


# remove images except: sqlserver, mongodb
images_to_remove=$(docker images -a | grep -v "mcr.microsoft.com/mssql/server" | grep -v "mongo" | awk 'NR>1 {print $3}') 

if [ -n "$images_to_remove" ]; then
		docker  rmi -f $images_to_remove
		echo -e "\e[1;32m[+] Images removed!\e[0m"
else
		echo -e "\e[1;31m[-] No images to be cleaned!\e[0m"
fi

