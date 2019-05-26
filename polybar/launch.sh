#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# polybar -r bar1 &
if type "xrandr"; then
        for m in $(xrandr --query | grep " connected" | cut -d " " -f1); do
                MONITOR=$m polybar -r bar1 &
        done
else
        polybar --reload bar1 &
fi

echo "Bars launched..."
