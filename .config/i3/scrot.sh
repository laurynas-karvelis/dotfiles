#!/usr/bin/env bash
#
# Take a screenshot and display a notification.
#
# Created by Dylan Araps.
#
# Depends on: imagemagick, libnotify (patched with id support)

# Screenshot directory
scr_dir="${HOME}/pictures/screenshots"
mkdir -p "$scr_dir" || { printf "%s\n" "Error: Couldn't create screenshot directory"; exit; }

# Use printf to store the current date/time as variables.
printf -v date "%(%F)T"
printf -v time "%(%I-%M-%S)T"

# Create current date format.
mkdir -p "${scr_dir}/${date}"

# Name the screenshot
scr="${scr_dir}/${date}/${date}-${time}.png"

notify-send "Saved screenshot as ${scr/*\/}"
scrot "$scr" $@
