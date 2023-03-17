#!/bin/bash

# ESSENTIALS
sudo apt install build-essential git cmake

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
