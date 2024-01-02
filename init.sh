#!/bin/bash
# Update and install packages
sudo apt update
sudo NEEDRESTART_MODE=a apt upgrade -y

# Install Ansible
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update
sudo NEEDRESTART_MODE=a apt install ansible git python3 python3-pip -y

### Create users
sudo useradd -m -s kschultz
echo 'kschultz:{{ PASSWORD }}' | sudo chpasswd
sudo usermod -aG sudo kschultz

sudo useradd -m -s semaphore
echo 'semaphore:{{ PASSWORD }}' | sudo chpasswd

# Set Firewall Rules
sudo ufw allow OpenSSH
sudo ufw enable

sudo rsync --archive --chown=kschultz:kschultz ~/.ssh /home/kschultz/



sudo reboot now
