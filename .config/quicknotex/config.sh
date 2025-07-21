# QuickNoteX Configuration File
# This is a shell script, so you can use shell syntax.

# 1. ROFI THEME CUSTOMIZATION
# ---------------------------
# Specify the full path to your custom rofi theme files.
# You can copy the default themes from the project's 'config/rofi_themes' directory
# to a location of your choice and modify them.

# Theme for the main input bar
QN_THEME_INPUT="/home/kd2/Projects/live/QuickNoteX/config/rofi_themes/quicknote.rasi"

# Theme for displaying notes and search results
QN_THEME_DISPLAY="/home/kd2/Projects/live/QuickNoteX/config/rofi_themes/quicknote_display.rasi"


# 2. COMMAND ALIASES
# ------------------
# Define aliases for existing commands.
# Use the format: QN_ALIASES["alias"]="/command"
declare -A QN_ALIASES
QN_ALIASES["o"]="/open"
QN_ALIASES["d"]="/delete"
QN_ALIASES["s"]="/search"
QN_ALIASES["t"]="/tag"
QN_ALIASES["e"]="/edit"
