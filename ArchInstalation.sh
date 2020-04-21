#!/bin/bash -vx

#pacman -Sy
#pacman -S git
#git clone https://github.com/crumblecoder/Rice-my-Acer/
#mount -o remount,size=2G /run/archiso/cowspace

sfdisk -f /dev/sda < sda.dump
loadkeys es
timedatectl set-ntp true
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
pacman -S reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware networkmanager grub git base-devel
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash <<EOF
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc
sed -i  '/^#es_ES.*  /s/^#//'  /etc/locale.gen
locale-gen
echo "KEYMAP=es" > /etc/vconsole.conf
echo "ACER-PC" >/etc/hostname
echo "127.0.0.1	localhost" > /etc/hosts
echo "::1		localhost"    >> /etc/hosts
echo "127.0.1.1	ACER-PC"  >> /etc/hosts
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager

EOF
cp ./afterfirstboot.sh /mnt/root
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
umount -r /mnt

