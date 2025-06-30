# Hyprland config file: ```hyprland.conf```

Hyprland will be launched automatically on startup

## Add/Modify:
- Add Super + D to launch rofi (app manager, see rofi Readme.md)
- Set monitor refresh rate to highest
- Prevent sleep
- Disable mouse acceleration and modify sensitivity
- Add appearance for terminal and most apps
  - Blur + Transparent + X-ray (Terminal and Spotify only)
  - Strong outline for currently active window
  - Slight rounding at corners
  - Slight shadow

# Hyprland wallpaper: ```hyprpaper.conf```

Hyprland will launch Hyprpaper in Exec Once section

## Instruction
- Add the wallpaper png file in Downloads directory & rename wallpaper.png
- Or change the file path in config file

# Desktop Environment: ```env.conf```

Hyprland will launch desktop environment in Exec Once section

## Purpose
- This is for forcing GTK apps such as nm-connection-editor (wifi module) in waybar to use dark theme
