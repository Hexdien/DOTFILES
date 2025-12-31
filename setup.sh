#!/bin/bash
CONFIGS=(hypr wofi waybar kitty nvim)

for cfg in "${CONFIGS[@]}"; do
  rm -rf ~/.config/$cfg
  ln -s ~/dotfiles/$cfg ~/.config/$cfg
done

echo "✅ Symlinks criados com sucesso!"
