#!/bin/bash

# This script is designed to be installed system-wide.
# Executables will be in /usr/local/bin/
# Rofi themes will be in /usr/share/rofi/themes/ or ~/.config/rofi/

# Get input from the user using rofi
INPUT=$(/usr/bin/rofi -dmenu -theme /usr/share/rofi/themes/quicknote.rasi -width 100 -lines 1 -location 0 -yoffset -200 -p "QuickNoteX")

# If the user provided input
if [ -n "$INPUT" ]; then
    # If the input is the /open command
    if [ "$INPUT" = "/open" ]; then
        # Get the notes and display them in a new rofi window using the display theme
        NOTES=$(/usr/local/bin/quicknote /open)
        echo -e "$NOTES" | /usr/bin/rofi -dmenu -theme /usr/share/rofi/themes/quicknote_display.rasi -width 100 -lines 10 -location 0 -p "Your Notes"
    else
        # Otherwise, save the note
        /usr/local/bin/quicknote "$INPUT"
    fi
fi
