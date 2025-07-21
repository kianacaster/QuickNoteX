#!/bin/bash
# QuickNoteX SmartMarkdown Plugin
# Displays notes in a nicely formatted Markdown view.
# Usage: /smart_markdown

custom_command_smart_markdown() {
    # Get all notes from the backend
    ALL_NOTES=$(quicknote /open)

    # Initialize an empty string for Markdown output
    MARKDOWN_OUTPUT=""

    # Use a temporary file for the Markdown output
    # This ensures proper display in external viewers
    TEMP_MD_FILE=$(mktemp /tmp/quicknotex_smart_markdown_XXXXXX.md)

    # Add a main heading
    MARKDOWN_OUTPUT+="# QuickNoteX Notes Overview\n\n"

    # --- Group by Tags ---
    declare -A TAGGED_NOTES
    declare -a ALL_TAGS

    # First pass: Collect all tags and group notes
    while IFS= read -r line; do
        # Extract tags from the line
        TAGS=$(echo "$line" | grep -o '#[a-zA-Z0-9_\-]\+')
        if [ -n "$TAGS" ]; then
            for tag in $TAGS; do
                # Remove the '#' prefix for cleaner display
                CLEAN_TAG=${tag#\#}
                TAGGED_NOTES["$CLEAN_TAG"]+="$line\n"
                # Add tag to a list of all tags if not already present
                if ! [[ " ${ALL_TAGS[@]} " =~ " ${CLEAN_TAG} " ]]; then
                    ALL_TAGS+=("$CLEAN_TAG")
                fi
            done
        else
            # Notes without tags go into a special category
            TAGGED_NOTES["_untagged"]+="$line\n"
        fi
    done <<< "$ALL_NOTES"

    # Sort tags alphabetically
    IFS=$'\n' ALL_TAGS=($(sort <<<"${ALL_TAGS[*]}"))
    unset IFS

    # Second pass: Generate Markdown output
    if [ ${#ALL_TAGS[@]} -gt 0 ]; then
        MARKDOWN_OUTPUT+="## Notes by Tag\n\n"
        for tag in "${ALL_TAGS[@]}"; do
            MARKDOWN_OUTPUT+="### #$tag\n\n"
            # Add notes for this tag
            while IFS= read -r note_line; do
                MARKDOWN_OUTPUT+="- $note_line\n"
            done <<< "${TAGGED_NOTES[$tag]}"
            MARKDOWN_OUTPUT+="\n" # Add a newline after each tag section
        done
    fi

    # Add untagged notes section if any
    if [ -n "${TAGGED_NOTES["_untagged"]}" ]; then
        MARKDOWN_OUTPUT+="## Untagged Notes\n\n"
        while IFS= read -r note_line; do
            MARKDOWN_OUTPUT+="- $note_line\n"
        done <<< "${TAGGED_NOTES["_untagged"]}"
        MARKDOWN_OUTPUT+="\n"
    fi

    # Write the generated Markdown to the temporary file
    echo -e "$MARKDOWN_OUTPUT" > "$TEMP_MD_FILE"

    # Launch the Markdown viewer (default to 'less')
    # User can configure QN_MARKDOWN_VIEWER in config.sh
    "${QN_MARKDOWN_VIEWER:-less}" "$TEMP_MD_FILE"

    # Clean up the temporary file after the viewer exits
    rm "$TEMP_MD_FILE"
}