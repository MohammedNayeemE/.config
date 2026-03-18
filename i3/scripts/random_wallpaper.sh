#!/bin/bash
# Kill any existing instances of this script (except current PID)
for pid in $(pgrep -f "random_wallpaper.sh"); do
    if [ "$pid" != "$$" ]; then
        kill "$pid" 2>/dev/null
    fi
done
WALL_DIR="$HOME/.config/i3/wallpapers"
# Load wallpapers into an array
mapfile -t WALLPAPERS < <(find "$WALL_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \))
# Exit if no wallpapers found
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    exit 1
fi
# Set initial wallpaper immediately
RANDOM_INDEX=$((RANDOM % ${#WALLPAPERS[@]}))
feh --bg-fill "${WALLPAPERS[$RANDOM_INDEX]}"
# Small delay to ensure i3 IPC is ready
sleep 1
# Listen for workspace events (note the -m flag for monitor mode!)
i3-msg -t subscribe -m '[ "workspace" ]' | while read -r event
do
    if echo "$event" | grep -q '"change":"focus"'; then
        RANDOM_INDEX=$((RANDOM % ${#WALLPAPERS[@]}))
        feh --bg-fill "${WALLPAPERS[$RANDOM_INDEX]}"
    fi
done
