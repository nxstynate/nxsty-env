#!/bin/bash

# Install Ansible
sudo apt-get update
sudo apt-get install -y ansible

# Clone Dotfiles Repository
git clone https://your-dotfiles-repo-url.git ~/dotfiles

# Run Ansible Playbook
cd ~/dotfiles
ansible-playbook -i "localhost," -c local setup.yml
