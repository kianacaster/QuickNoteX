#!/bin/bash
# QuickNoteX Stock Plugin: Timestamp
# Adds a note with the current timestamp.
# Usage: /timestamp Your note here

custom_command_timestamp() {
    NOTE_WITH_TIMESTAMP="[$(date +'%Y-%m-%d %H:%M:%S')] $1"
    # Call the backend to add the note
    ../backend/quicknote "$NOTE_WITH_TIMESTAMP"
}
