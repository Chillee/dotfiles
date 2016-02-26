#!/bin/bash

# allow chromium, run as non-root, to access X server
xhost +

# run gnome-terminal-server in dummy X server
Xvfb :1 &
sleep 0.1
gnome-terminal --display :1 &

compton --frame-opacity 0.5 &

xfsettingsd &
xfdesktop --disable-wm-check &
xfce4-panel --disable-wm-check &
xfce4-notifyd &

dex -a &
thunar --daemon &
chromium --no-startup-window &
