#!/bin/bash



#pacman
#-------

if test -f "/bin/pacman"; then
	sudo pacman -S   \
		libx11 \
		libxft \
		feh \
		albert \
		awesome-terminal-fonts \
		dmenu \
		network-manager-applet \
        gnome-keyring
fi


#apt 
#------
if test -f "/bin/apt"; then
	sudo apt install \
	dmenu \

fi



#dwm
#------

sudo make clean install


#st
#------

cd stt ;sudo make clean install

#slstatus
#-------
cd ../slstatus;sudo  make clean install


#yay
#------
if test -f "/bin/yay"; then
	yay -S \
		picom-git \
		twemoji-color-font
else; then
	cd /opt
	sudo git clone https://aur.archlinux.org/yay-git.git
	sudo chown -R $USER:$USER ./yay-git
	cd yay-git
	makepkg -si
	yay -S \
	picom-git \
	twemoji-color-font
fi
