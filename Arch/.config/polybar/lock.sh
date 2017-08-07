#!/bin/bash

maim /tmp/screen.png
convert /tmp/screen.png -scale 15% -scale 670% -fill black -colorize 20% /tmp/screen.png
lock_icon=$HOME/Wallpapers/image_031.png

if [[ -f $lock_icon ]]; then
  px=0
  py=0
  r=$(file $lock_icon | grep -o '[0-9]* x [0-9]*')
  rx=$(echo $r | cut -d' ' -f 1)
  ry=$(echo $r | cut -d' ' -f 3)
  sr=$(xrandr --query | grep ' connected' | sed 's/primary //' | cut -f3 -d' ')

  for res in $sr; do
    srx=$(echo $res | cut -d'x' -f 1)                   # x pos
    sry=$(echo $res | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
    srox=$(echo $res | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
    sroy=$(echo $res | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset

    px=$(($srox + $srx/2 - $rx/2))
    py=$(($sroy + $sry/2 - $ry/2))

    convert /tmp/screen.png $lock_icon -geometry +$px+$py -composite -matte /tmp/screen.png
  done
fi

i3lock  -u  -i /tmp/screen.png