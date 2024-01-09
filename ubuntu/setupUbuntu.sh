#!/bin/bash

set -e

# sudo installation packages...
echo "Running sudo update..."
sudo apt update

# Install packages using apt
echo "Installing packages with apt fish, tmux, git, fzf, fd-find, gpg, cmake, llvm..."
sudo apt install -y fish tmux git fzf fd-find gpg cmake llvm

# Add FishShell PPA and install
echo "Adding FishShell PPA and installing..."
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install -y fish

# Install eza
echo "Installing eza..."
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# Install Homebrew and packages
echo "Installing Homebrew and packages..."
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc
brew install bat lazygit neovim node gh

# Git clone and setup configurations
echo "Cloning and setting up configurations..."
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
git clone https://github.com/nxstynate/config_files
cp -rf config_files/neovim/nvim_devaslife_2024/* ~/.config/nvim/
rm -rf config_files

# Install Fisher and packages
echo "Installing Fisher and packages..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fish -c "fisher install jorgebucaran/fisher ilancosman/tide jethrokuan/z PatrickF1/fzf.fish"

echo "Installation complete..."
