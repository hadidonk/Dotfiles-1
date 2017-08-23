#!/usr/bin/env sh

# Terminate already running instances of the bar
killall -q polybar

# Wait for the processes to shut down
while pgrep -x polybar >/dev/null; do sleep 1; done


# Launch the bar
polybar morgareth -q &
polybar morgareth1 -q &

echo "Launched the main bar ..."