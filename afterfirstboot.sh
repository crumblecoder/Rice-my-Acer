#!/bin/bash -vx
useradd -m -g wheel -s /bin/bash $(read -p "Escriba el nombre de usuario:" ;echo "$REPLY" ) -p $(openssl passwd -6 $(read -p "contraseña:";echo "$REPLY"))
sed -i '/# %wheel ALL=(ALL) ALL/s/^# //' /etc/sudoers
pacman -Sy
pacman -S alacritty  bspwm  sxhkd  xorg-xinit xorg go zsh zsh-completions
cp ./00-keyboard.conf /etc/X11/xorg.conf.d/
su $(ls /home/) << 'EOF'
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
{ echo 1 ; yes ; } | yay -S polybar
{ echo 1 ; yes ; } | yay -S brave-bin
echo "sxhkd &" >  .xinitrc
echo "bspwm"  >> .xinitrc
mkdir -p ~/.config/bspwm/
mkdir -p ~/.config/sxhkd/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
sed -i 's/urxvt/alacritty/'  ~/.config/sxhkd/sxhkdrc
chsh -s /bin/zsh
echo -e 'if systemctl -q is-active graphical.target && [[ ! :0 && 1 -eq 1 ]]; then ''\n'' ''\t'' exec startx''\n''fi' >> ~/.zprofile
EOF

#copy content of bspwm
#Call polybar in bspwmrc
#Add Super + b for browser 
#Install picom to terminal transparent
#sudo pacman -S virt-viewer

#echo "LC_ALL=en_US.UTF-8" >> /etc/environment
#echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
#echo "LANG=en_US.UTF-8" > /etc/locale.conf
#locale-gen en_US.UTF-8
