#!/bin/bash

choices="Logout\nReboot\nShutdown"
chosen=$(echo -e "$choices" | dmenu -fn 'Monotone:size=14' -p "Power Menu:" -i)

case "$chosen" in
    "Logout")   i3-msg exit ;;
    "Reboot")   systemctl reboot ;;
    "Shutdown") systemctl poweroff ;;
esac

