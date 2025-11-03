#!/bin/bash

CHOICE=$(printf "Não\nSim" | wofi --dmenu --prompt "Deseja realmente sair do Hyprland?")

if [[ "$CHOICE" == "Sim" ]]; then
  hyprctl dispatch exit
fi
