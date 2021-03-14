#!/bin/bash
#Synopsis the following sh file will crate a base install of Arch-linux "NO DE"
#Git Repo


ln -sf /usr/share/zoneinfo/America/Belize /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "Test1" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 VMware.localdomain VMware" >> /etc/hosts
echo root:testpw | chpasswd

pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pulseaudio bash-completion openssh rsync reflector acpi acpi_call tlp virt-manager qemu qemu-arch-extra ovmf bridge-utils dnsmasq vde2 openbsd-netcat ebtables iptables ipset firewalld flatpak sof-firmware nss-mdns acpid

pacman -S --noconfirm xf86-video-intel # intel cpu with intel-ucode only
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m ermanno
echo wisman:wizerd12 | chpasswd
usermod -aG libvirt wisman

echo "wisman ALL=(ALL) ALL" >> /etc/sudoers.d/ermanno


/bin/echo -e "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




