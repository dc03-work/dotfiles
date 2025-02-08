#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

BACKGROUND=0xff495156
DARKTEXT=0xff434f55
UNFOCUSED=0xff859289

GREEN=0xffa7c080
TEAL=0xff83c092
BLUE=0xff7fbbb3

RED=0xffe67e80
ORANGE=0xffe69875
YELLOW=0xffdbbc7f

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "chevron.$NAME.pre" background.color=$TEAL \
                             icon.color=$BACKGROUND
    sketchybar --set "$NAME" background.color=$TEAL \
                             label.color=$BACKGROUND
    sketchybar --set "chevron.$NAME.post" background.color=$BACKGROUND \
                             icon.color=$TEAL
else
    sketchybar --set "chevron.$NAME.pre" background.color=$BACKGROUND \
                             icon.color=$BACKGROUND
    sketchybar --set "$NAME" background.color=$BACKGROUND \
                             label.color=$UNFOCUSED
    sketchybar --set "chevron.$NAME.post" background.color=$BACKGROUND \
                             icon.color=$BACKGROUND
fi
