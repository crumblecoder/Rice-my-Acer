#!/bin/bash -vx
useradd -m -g wheel -s /bin/bash $(read -p "Escriba el nombre de usuario:" ;echo "$REPLY" ) -p $(openssl passwd -6 $(read -p "contraseña:";echo "$REPLY"))
sed -i '/# %wheel ALL=(ALL) ALL/s/^# //' /etc/sudoers
pacman -Sy
pacman -S alacritty  bspwm  sxhkd  xorg-xinit xorg go
su $(ls /home/) <<EOF
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -S lemonbar
EOF

