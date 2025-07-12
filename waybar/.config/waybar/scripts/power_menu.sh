#!/bin/bash

CHOICE=$(printf "🔒 Lock\n🔁 Logout\n⏻ Shutdown\n🔄 Reboot" | wofi --dmenu --width 275 --height 300 --prompt "Power Menu")

case "$CHOICE" in
  "🔒 Lock")    
    hyprlock ;;  # or swaylock if you're using it
  "🔁 Logout")  
    hyprctl dispatch exit ;;
  "⏻ Shutdown") 
    systemctl poweroff ;;
  "🔄 Reboot")  
    systemctl reboot ;;
esac

