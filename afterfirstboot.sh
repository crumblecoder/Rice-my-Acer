#!/bin/bash -vx
useradd -m -g wheel -s /bin/bash $(read -p "Escriba el nombre de usuario:" ;echo "$REPLY" )-p $(openssl passwd -6 $(read -p "contraseña:";echo "$REPLY"))
pacman -S alacritty  bspwm  sxhkd mesa-demos lemonbar xorg-xinit xorg
