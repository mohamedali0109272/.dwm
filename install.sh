#!/bin/bash



#pacman
#-------

if test -f "/bin/pacman"; then
	sudo pacman -S   \
		libx11 \
		libxft \
		awesome-terminal-fonts \
		dmenu \
		pkg-config 
fi


#apt 
#------
if test -f "/bin/apt"; then
	sudo apt install \
	build-essential \
	libx11-dev \
	libxft-dev \
	libxinerama-dev\
	gcc \
	make \
	dmenu 

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

cd ../dmenu;sudo  make clean install

#yay
#------
#if ! test -f "/bin/yay"; then
#	cd /opt
#	sudo git clone https://aur.archlinux.org/yay-git.git
#	sudo chown -R $USER:$USER ./yay-git
#	cd yay-git
#	makepkg -si
#	yay -S \
#	picom-git \
#	twemoji-color-font
#else
#	yay -S \
#		picom-git \
#		twemoji-color-font
#
#fi




#paru
#------
if test -f "/bin/paru"; the
	paru -S \
	twemoji-color-font

fi
