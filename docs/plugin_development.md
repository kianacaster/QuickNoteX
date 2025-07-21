# QuickNoteX Plugin Development Guide

QuickNoteX is designed to be easily extensible through a simple plugin system. Plugins are essentially shell scripts that define custom commands, allowing you to add new functionality or integrate with other tools.

## Plugin Location

Plugins are loaded from the `~/.config/quicknotex/plugins/` directory. Any `.sh` file placed in this directory will be sourced by the `quicknotex-launcher` script when it starts.

## Creating a Custom Command (Plugin)

To create a custom command, define a shell function in your plugin file with the naming convention `custom_command_<your_command_name>`. When a user types `/your_command_name` in the Rofi input bar, your function will be executed.

### Function Signature

Your custom command function will receive all arguments typed after the command as a single string. You can parse these arguments within your function as needed.

```bash
# Example: A command to add a note with the current timestamp.
# Usage: /timestamp Your note here
custom_command_timestamp() {
    # $1 will contain "Your note here"
    NOTE_WITH_TIMESTAMP="[$(date +'%Y-%m-%d %H:%M:%S')] $1"
    
    # Call the QuickNoteX backend to add the note
    # The path to the backend executable is relative to the launcher script.
    # It's generally safe to assume `../backend/quicknote` if you're in the launcher's directory.
    ../backend/quicknote "$NOTE_WITH_TIMESTAMP"
}
```

### Calling the QuickNoteX Backend

Your plugins can interact with the core QuickNoteX functionality by calling the `quicknote` backend executable. The `quicknote` binary understands the following commands:

*   `quicknote /open`: Prints all notes to standard output.
*   `quicknote <your_note_content>`: Adds a new note.
*   `quicknote /delete <line_number>`: Deletes a note by line number.
*   `quicknote /search <keyword>`: Searches for notes containing a keyword and prints them.
*   `quicknote /tag <tag>`: Searches for notes containing a specific tag (e.g., `#tag`) and prints them.
*   `quicknote /use <notes_file_path>`: Switches the active notes file.

### Example Plugin: `my_custom_plugin.sh`

```bash
#!/bin/bash

# Command: /greet
# Usage: /greet <name>
# Description: Greets the user with a custom message.
custom_command_greet() {
    if [ -z "$1" ]; then
        echo "Hello there!" | rofi -dmenu -p "Greeting"
    else
        echo "Hello, $1!" | rofi -dmenu -p "Greeting"
    fi
}

# Command: /count_notes
# Usage: /count_notes
# Description: Displays the total number of notes.
custom_command_count_notes() {
    NOTE_COUNT=$(../backend/quicknote /open | wc -l)
    echo "You have $NOTE_COUNT notes." | rofi -dmenu -p "Note Count"
}
```

## Best Practices for Plugin Development

*   **Keep it Simple:** Aim for single-purpose plugins.
*   **Error Handling:** Include basic error handling (e.g., checking if arguments are provided).
*   **Clear Usage:** Add comments to your plugin files explaining their purpose and usage.
*   **Security:** Be cautious when using `source` for external scripts. Only use plugins from trusted sources, as they run with the same permissions as QuickNoteX itself.

By following these guidelines, you can create powerful and useful extensions for QuickNoteX!
