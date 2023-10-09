#!/bin/bash

xidlehook --not-when-fullscreen --not-when-audio --timer 6 'xrandr --output eDP-1 --brightness .3' 'xrandr --output eDP-1 --brightness 1' --timer 1 'xrandr --output eDP-1 --brightness 1; xflock4' ''
