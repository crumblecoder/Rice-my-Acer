#!/bin/bash -vx
#useradd -m -g wheel -s /bin/bash $(read -p "Escriba el nombre de usuario:" ;echo "$REPLY" ) -p $(openssl passwd -6 $(read -p "contraseña:";echo "$REPLY"))
#sed -i '/# %wheel ALL=(ALL) ALL/s/^# //' /etc/sudoers
#pacman -Sy
#pacman -S alacritty  bspwm  sxhkd  xorg-xinit xorg go
su $(ls /home/) 
cd ~
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si --noconfirm
#yay -S lemonbar


echo "sxhkd &">  .xinitrc
exec "bspwm"  >> .xinitrc
mkdir ~/.config/bspwm/
mkdir ~/.config/sxhkd/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
cp /usr/share/doc/bspwm/examples/bspwmrc mkdir ~/.config/bspwm/
