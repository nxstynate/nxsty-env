#!/bin/bash

echo "Installing FishShell..."
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish

echo "Installing Fisher..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

echo "Installing FZF..."
sudo apt -y install fzf

echo "Installing FD-Find..."
sudo apt -y install fd-find

echo "Installing bat..."
brew install bat

echo "Installing eza..."
sudo apt update
sudo apt -y install gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt -y install eza

echo "Installing Fisher: Tide and Z..."
fish
fisher install ilancosman/tide
fisher install jethrokuan/z
fihser install PatrickF1/fzf.fish
exit

echo "Installing Homebrew..."
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc

echo "Installing Scoop"

echo "Installing Neovim..."
sudo apt-get update
brew install neovim

echo "Cloning LazyVim config..."
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "Cloning personal Neovim configuration..."
git clone https://github.com/nxstynate/config_files
cp -rf config_files/neovim/nvim_devaslife_2024/* ~/.config/nvim/

echo "Installing tmux..."
sudo apt install -yl tmux

echo "LazyGit..."
brew install lazygit
