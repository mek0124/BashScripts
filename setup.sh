#!/bin/bash

# This script serves as a setup to iterate through all the sub-directories and
# apply the 'chmod +x' permission to each file. THIS ONLY NEEDS TO BE RAN ONCE!

# get the current root directory
current_dir=$(pwd)

# tell the user we're starting permission granting
echo -e "Starting Setup Process... Please Wait..."

# dummy loader
sleep 2

# tell the user we're granting permissions
echo -e "Adding 'chmod +x' to all sub-starting files... Please Wait..."

# iterate through all sub directories of the root directory
for item in "$current_dir"/*; do
    # if the item is a directory
    if [ -d "$item" ]; then
        # look for run.sh in each sub directory
        run_sh="$item/run.sh"
        if [ -f "$run_sh" ]; then
            # apply chmod +x to each sub directories "run.sh" file
            chmod +x "$run_sh"
        fi
    fi
done

# process finished text
echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "Permission Granting Process Completed."
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\n\nPress Any Key To Exit..."
read