#!/bin/bash

INPUT=$(/usr/bin/rofi -dmenu -theme /usr/share/rofi/themes/quicknote.rasi -width 100 -lines 1 -location 0 -yoffset -200 -p "QuickNoteX")

if [ -n "$INPUT" ]; then
    if [ "$INPUT" = "/open" ]; then
        NOTES=$(/usr/local/bin/quicknote /open)
        echo -e "$NOTES" | /usr/bin/rofi -dmenu -theme /usr/share/rofi/themes/quicknote_display.rasi -width 100 -lines 10 -location 0 -p "Your Notes"
    else
        /usr/local/bin/quicknote "$INPUT"
    fi
fi
