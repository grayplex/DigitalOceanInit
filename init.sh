#!/bin/bash
sudo apt update
sudo NEEDRESTART_MODE=a apt upgrade -y

sudo adduser kschultz
echo 'kschultz:{{ PASSWORD }}' | sudo chpasswd
sudo usermod -aG sudo kschultz

sudo ufw allow OpenSSH
sudo ufw enable

sudo rsync --archive --chown=kschultz:kschultz ~/.ssh /home/kschultz/

sudo reboot now
