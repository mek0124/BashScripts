#!/bin/bash

# This script opens the user's music folder in VLC Media Player for easier access and playing

music_folder="$HOME/Music"

# Check if VLC is installed
if ! command -v vlc &> /dev/null; then
    echo "Error: VLC media player is not installed."
    exit 1
fi

# Check if music folder exists
if [ ! -d "$music_folder" ]; then
    echo "Error: Music folder not found at $music_folder"
    exit 1
fi

# Open VLC with the music folder, suppressing DVD-related errors
vlc "$music_folder" 2> >(grep -v "dvdnav demux error" >&2) & disown

# Once the media player starts, you can close the terminal and it will still play!
