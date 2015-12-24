#!/bin/bash

# run gnome-terminal-server in dummy X server
Xvfb :1 &
gnome-terminal --display :1 &

compton --frame-opacity 0.5 &

xfsettingsd &
xfdesktop --disable-wm-check &
xfce4-panel --disable-wm-check &
xfce4-notifyd &

dex -a &
thunar --daemon &
chromium --no-startup-window &