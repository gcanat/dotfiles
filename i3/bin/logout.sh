#!/bin/bash
cmd=$(echo -e "suspend\nlogout\nreboot\npoweroff" | rofi -width 350 -theme Monokai -dmenu -p system)
case $cmd in
lock-screen)
  $HOME/.config/i3/bin/lock.sh ;;
suspend)
systemctl suspend ;;
logout)
i3-msg exit ;;
reboot)
systemctl reboot ;;
poweroff)
systemctl poweroff ;;
esac
