#!/bin/bash

# ESSENTIALS
sudo apt install ripgrep build-essential git cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y

## Node & NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install --lts
source ~/.bashrc

## Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.bashrc
cargo --version

## HACK FONT
sudo apt install fonts-hack-ttf -y
fc-cache -f -v
mkdir Hack
cd Hack
wget https://raw.githubusercontent.com/Shadient/config-mint/main/fonts/hack-fonts.txt
wget -i hack-fonts.txt
rm hack-fonts.txt
cd ~

## TERMINAL EMULATOR
  ## install
  git clone https://github.com/alacritty/alacritty.git
  cd alacritty
  cargo build --release
  ## terminfo
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
  ## Desktop entry
  sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database
  ## Manual Page
  sudo mkdir -p /usr/local/share/man/man1
  gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
  gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
  cd ~
  ## Config file
  mkdir ~/.config/alacritty
  wget -P ~/.config/alacritty https://raw.githubusercontent.com/Shadient/config-mint/main/alacritty/alacritty.yml
  
## NEOVIM
  ## install
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv nvim.appimage /usr/local/bin/nvim
  mkdir .config/nvim
  ## nvchad
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
  ## custom
  cd .config/nvim
  mkdir lua/custom
  cp examples/init.lua lua/custom/init.lua
  cp examples/chadrc.lua lua/custom/chadrc.lua
  curl https://raw.githubusercontent.com/Shadient/config-mint/main/neovim/init.lua > lua/custom/init.lua
  cd ~

## BSPWM
sudo apt install git gcc make xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libxcb-ewmh2 -y
sudo apt-get install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
## Make
cd bspwm
make
sudo make install
cd ..
cd sxhkd/
make
sudo make install
## Config
sudo cp contrib/freedesktop/bspwm.desktop /usr/share/xsessions/
sudo service lightdm restart
