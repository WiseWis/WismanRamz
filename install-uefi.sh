#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Belize /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "Inspiron" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 Inspiron.localdomain Inspiron" >> /etc/hosts
echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pulseaudio bash-completion openssh rsync acpi acpi_call dnsmasq vde2 openbsd-netcat ebtables iptables ipset flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g 

pacman -S --noconfirm xf86-video-intel
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable fstrim.timer
systemctl enable acpid

useradd -m wisman
echo wisman:password | chpasswd
usermod -c "Wisman Ramsey" wisman

echo "wisman ALL=(ALL) ALL" >> /etc/sudoers.d/wisman


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




