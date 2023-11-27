#!/bin/sh

    
case "$(echo -e "Shutdown\nRestart\nSuspend\nExit" | dmenu \
    -fn 'Noto Sans-16'\
    -nb "${COLOR_BACKGROUND:-#151515}" \
    -nf "${COLOR_DEFAULT:-#aaaaaa}" \
    -sf "${COLOR_HIGHLIGHT:-#589cc5}" \
    -sb "#1a1a1a" \
    -b -i -p \
    "Power:" -l 5)" in
        Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Suspend) exec systemctl suspend;;
        Exit) exec i3-msg exit;;
esac
