#!/bin/bash

#pacman -Sy
#pacman -S git
#git clone https://github.com/crumblecoder/Rice-my-Acer/

cat sda.dump |sfdisk /dev/sda
loadkeys es
timedatectl set-ntp true
mkfs.ext4 /dev/sda
mount /dev/sdX1 /mnt
pacstrap /mnt base linux linux-firmware networkmanager
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc
sed -i  '/^#es_ES.*  /s/^#//'  /etc/locale.gen
