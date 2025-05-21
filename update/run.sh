# This script:
#  - serves as an automated way to run an update and auto remove on your system.
#  - will prompt for your user password for your system given that you're not already
#    in a terminal and have given your password before. 


# NOTE: I cannot get the windows VM to work correctly and I also cannot test mac commands on Linux.
#       Do test before actually using. If you come across any problems with the script, please
#       post the error as a new issue on the issues page -> https://github.com/mek0124/BashScripts/issues
#       Thanks! ~Mek

#!/bin/bash

echo -e "Starting Update Process... Please Wait..."
sleep 2

# prompt user for password
sudo -v

echo -e "\nRunning 'sudo apt update'..."

sudo apt update

echo -e "\nRunning 'sudo apt upgrade -y'..."

sudo apt upgrade -y

echo -e "\nRunning 'sudo apt autoremove --purge -y'..."

sudo apt autoremove --purge -y

echo -e "\nRunning 'sudo apt list --upgradable'..."
echo -e "\nNOTE: Any items that show after this command finishes, will need to be updated manually\n"

sudo apt list --upgradable -a

echo -e "\nUpdate Complete... Press Any Key To Exit..."
read
