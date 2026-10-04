#!/usr/bin/env bash

# Terminate already running bar instances (standard and Nix-wrapped)
killall -q polybar .polybar-wrapped
pkill -u $UID -x polybar
pkill -u $UID -x .polybar-wrapped

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null || pgrep -u $UID -x .polybar-wrapped >/dev/null; do 
    sleep 1
done

# Loop through all connected monitors and launch the bar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main &
done
