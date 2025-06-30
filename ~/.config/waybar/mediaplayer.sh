#!/bin/sh

player_status=$(playerctl status 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "{\"text\":\"$(playerctl metadata artist) - $(playerctl metadata title)\",\"class\":\"playing\"}"
elif [ "$player_status" = "Paused" ]; then
    echo "{\"text\":\"Paused\",\"class\":\"paused\"}"
else
    echo '{"text":"No media","class":"stopped"}'
fi
