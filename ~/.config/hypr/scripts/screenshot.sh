#!/bin/bash
#  ____                               _           _
# / ___|  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_
# \___ \ / __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __|
#  ___) | (__| | |  __/  __/ | | \__ \ | | | (_) | |_
# |____/ \___|_|  \___|\___|_| |_|___/_| |_|\___/ \__|
# -----------------------------------------------------

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"
FILENAME="Screenshot_$(date +'%Y-%m-%d-%H%M%S').png"
FULL_PATH="$SCREENSHOT_DIR/$FILENAME"

show_menu() {
    echo -e "Copy\nSave\nCopy + Save\nEdit" | \
    rofi -dmenu -p "Screenshot" -mesg "DIR: $SCREENSHOT_DIR" \
        -theme-str 'window {width: 25%; border-radius: 12px;}' \
        -theme-str 'listview {lines: 4; spacing: 0;}'
}

case $(show_menu) in
    "Copy")
        # Capture to clipboard ONLY (no file saved)
        grim -g "$(slurp)" - | wl-copy
        notify-send "Screenshot copied to clipboard" -i edit-copy
        ;;
    "Save")
        # Save to file ONLY (no clipboard)
        grim -g "$(slurp)" "$FULL_PATH"
        notify-send "Screenshot saved" "$FILENAME" -i document-save
        ;;
    "Copy + Save")
        # Save to file AND copy to clipboard
        grim -g "$(slurp)" "$FULL_PATH" && \
        wl-copy < "$FULL_PATH"
        notify-send "Screenshot saved and copied" "$FILENAME" -i edit-paste
        ;;
    "Edit")
        grim -g "$(slurp)" "$FULL_PATH" && \
        swappy -f "$FULL_PATH" -o "$FULL_PATH" &
        notify-send "Editing screenshot" "Opened in Swappy" -i accessories-image-editor
        ;;
esac
