#!/bin/bash

caixa=$(wpctl status | grep 'USB Audio Speakers' | sed 's/[*]//' | awk '{print $2}' | tr -d '.')
headset=$(wpctl status | grep 'USB Audio Front Headphones' | sed 's/[*]//' | awk '{print $2}' | tr -d '.')

wpctl set-volume -l 1 "$caixa" 5%-
wpctl set-volume -l 1 "$headset" 5%-

