#!/bin/bash

# This script serves as a reverse setup to iterate through all the sub-directories and
# remove the 'chmod -x' permission from each file. THIS ONLY NEEDS TO BE RAN ONCE!

# get the current directory
current_dir=$(pwd)

# tell the user we're starting the permission removal
echo -e "Starting Un-Setup Process... Please Wait..."

# dummy loader
sleep 2

# tell the user we're removing permissions
echo -e "Removing 'chmod +x' from all sub-starting files... Please Wait..."

# iterate through all sub directories of the root directory
for item in "$current_dir"/*; do
  # if the item is a directory
  if [ -d "$item" ]; then
    # look for the run.sh in each sub directory
    run_sh="$item/run.sh"

    if [ -f "$run_sh" ]; then
      # remove chmod -x to each sub directories "run.sh" file
      chmod -x "$run.sh"
    fi
  fi
done

# process finished text
echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "Permission Removal Process Completed."
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\n\nPress Any Key To Exit..."
read
