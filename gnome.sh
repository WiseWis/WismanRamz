#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

git clone https://aur.archlinux.org/paru
cd paru/
makepkg -si --noconfirm

sudo pacman -S --noconfirm xorg gdm gnome firefox gnome-tweaks chrome-gnome-shell vlc

sudo flatpak install -y spotify

sudo systemctl enable gdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot


