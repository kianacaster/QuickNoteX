#!/bin/bash
# Copyright (c) 2025 Kian Acaster. All rights reserved.
#
# This software is licensed under the MIT License.
# See LICENSE for more information.

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

INPUT=$(/usr/bin/rofi -dmenu -theme "$SCRIPT_DIR/rofi_themes/quicknote.rasi" -width 100 -lines 1 -location 0 -yoffset -200 -p "QuickNoteX")

if [ -n "$INPUT" ]; then
    if [ "$INPUT" = "/open" ]; then
        NOTES=$("$SCRIPT_DIR/Backend/quicknote" /open)
        echo -e "$NOTES" | /usr/bin/rofi -dmenu -theme "$SCRIPT_DIR/rofi_themes/quicknote_display.rasi" -width 100 -lines 10 -location 0 -p "Your Notes"
    else
        "$SCRIPT_DIR/Backend/quicknote" "$INPUT"
    fi
fi
