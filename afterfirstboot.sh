#!/bin/bash -vx
useradd -m -g wheel -s /bin/bash $(read -p "Escriba el nombre de usuario:" ;echo "$REPLY" ) -p $(openssl passwd -6 $(read -p "contraseña:";echo "$REPLY"))
sed -i '/# %wheel ALL=(ALL) ALL/s/^# //' /etc/sudoers
pacman -Sy
su $(ls /home/) <<EOF
git clone https://aur.archlinux.org/yay.git
sudo cd yay
makepkg -si
exit
EOF
pacman -S alacritty  bspwm  sxhkd  xorg-xinit xorg
yay -S lemonbar
