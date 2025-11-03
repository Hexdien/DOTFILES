#!/bin/bash

caixa=$(wpctl status | grep 'USB Audio Speakers' | sed 's/[*]//' | awk '{print $2}' | tr -d '.')
headset=$(wpctl status | grep 'USB Audio Front Headphones' | sed 's/[*]//' | awk '{print $2}' | tr -d '.')

wpctl set-mute $caixa toggle
wpctl set-mute $headset toggle
