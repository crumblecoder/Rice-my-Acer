#!/bin/bash -vx
useradd -m -g wheel -s /bin/bash $(read -p "Escriba el nombre de usuario:" ;echo "$REPLY" ) -p $(openssl passwd -6 $(read -p "contraseña:";echo "$REPLY"))
sed -i '/# %wheel ALL=(ALL) ALL/s/^# //' /etc/sudoers
pacman -Sy
git clone https://aur.archlinux.org/yay.git
cd yay
su $(ls /home/) <<EOF
makepkg -si
exit
EOF
pacman -S alacritty  bspwm  sxhkd  xorg-xinit xorg
