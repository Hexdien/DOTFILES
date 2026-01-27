#!/usr/bin/env bash

option=$(printf "Desligar\nReiniciar\nSuspender" | wofi --dmenu -p "Energia" --width 250 --height 220)
[ -z "$option" ] && exit 0

confirm=$(printf "Não\nSim" | wofi --dmenu -p "Confirmar $option?" --width 250 --height 180)
[ "$confirm" != "Sim" ] && exit 0

case "$option" in
Desligar)
  shutdown now
  ;;
Reiniciar)
  reboot
  ;;
Suspender)
  systemctl suspend
  ;;
esac
