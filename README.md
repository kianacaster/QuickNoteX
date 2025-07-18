# QuickNoteX

A fast, rofi-based note-taking application for Arch Linux with Hyprland integration.

## Features

- Quick note capture via rofi input bar.
- Notes saved to `notes.txt`.
- `/open` command to view all notes in a dedicated rofi window.
- Designed for seamless Hyprland workflow.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/QuickNoteX.git # Replace with your repository URL
    cd QuickNoteX
    ```

2.  **Prepare Rofi Themes:**

    Ensure `rofi_themes/quicknote.rasi` and `rofi_themes/quicknote_display.rasi` exist in the `rofi_themes/` directory.

    ```bash
    # Example: Create if they don't exist (replace with actual content)
    mkdir -p rofi_themes
    # nano rofi_themes/quicknote.rasi
    # nano rofi_themes/quicknote_display.rasi
    ```

3.  **Build and Install:**

    ```bash
    makepkg -si
    ```

## Usage

- **Launch:**

    ```bash
    quicknotex-launcher
    ```

- **Take a Note:**

    Type your note in the rofi bar and press `Enter`.

- **View Notes:**

    Type `/open` in the rofi bar and press `Enter`.

## Hyprland Keybind

Add to your `hyprland.conf`:

```conf
bind = SUPER SHIFT, T, exec, quicknotex-launcher
```

## License

MIT License
