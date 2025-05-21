#!/bin/bash

# Optimized script for smooth music playback in VLC

music_folder="$HOME/Music"
vlc_settings="--file-caching=5000 --network-caching=5000 --no-video"

# Check requirements
if ! command -v vlc &> /dev/null; then
    notify-send "VLC Error" "VLC media player is not installed."
    exit 1
fi

if [ ! -d "$music_folder" ]; then
    notify-send "Music Error" "Music folder not found at $music_folder"
    exit 1
fi

# Launch VLC with optimized settings
vlc $vlc_settings "$music_folder" 2> /dev/null & disown

# Optional: Close the script while keeping VLC running
exit 0

# Once the media player starts, you can close the terminal and it will still play!
