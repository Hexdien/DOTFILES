#!/usr/bin/env bash
set -euo pipefail

echo "==> Arch bootstrap iniciando..."

### Caminho do repositório
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

### 0 Pacotes do Stow
STOW_PACKAGES=(
  Scripts
  greetd
  hypr
  kitty
  mako
  nvim
  waybar
  wofi
)
### 1️⃣ Pacotes
PACKAGES=(
  wl-clipboard
  grim
  slurp
  jdk21-openjdk
  ripgrep
  fd
  docker
  docker-compose
  unzip
  maven
  npm
  gamemode
  gamescope
  mangohud
  bat
  lazygit
  dolphin
  efibootmgr
  firefox
  flatpak
  geany
  git
  greetd
  greetd-tuigreet
  grub
  hyprland
  hyprpaper
  intel-ucode
  kitty
  less
  libnewt
  linux
  linux-firmware
  lutris
  mako
  noto-fonts
  noto-fonts-emoji
  otf-font-awesome
  pavucontrol
  pipewire-alsa
  pipewire-jack
  pipewire-pulse
  steam
  stow
  sudo
  tree
  ttf-dejavu
  ttf-liberation
  uwsm
  vim
  waybar
  wayland
  wine
  winetricks
  wireplumber
  wofi
  zram-generator
)

echo "==> Instalando pacotes..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

### 2️⃣ Ativando Serviços
echo "==> Ativando PipeWire..."
systemctl --user enable --now pipewire pipewire-pulse wireplumber

echo "==> Ativando waybar..."
systemctl --user enable --now waybar

echo "==> Ativando hyprpaper..."
systemctl --user enable --now hyprpaper

echo "==> Ativando greetd..."
sudo systemctl enable --now greetd

### 3️⃣ Diretórios padrão
echo "==> Criando diretórios..."
mkdir -p ~/.config
mkdir -p ~/.local/bin

### 4️⃣ Dotfiles com Stow
echo "==> Aplicando dotfiles..."
stow -d "$REPO_ROOT" -t "$HOME" "${STOW_PACKAGES[@]}"

### 5️⃣ Cache de fontes
echo "==> Atualizando cache de fontes..."
fc-cache -fv

echo "==> Bootstrap finalizado. Logout recomendado."
