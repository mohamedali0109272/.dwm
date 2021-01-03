#!/bin/bash



pacman
-------

if test -f "/bin/pacman"; then
	sudo pacman -S   \
		libx11 \
		libxft \
		feh \
		albert \
		awesome-terminal-fonts \
		dmenu
fi

yay
------
if test -f "/bin/yay"; then
	yay -S \
		picom-git \
		twemoji-color-font
fi

apt 
------
if test -f "/bin/apt"; then
	sudo apt install \
	dmenu \

fi



dwm
------

sudo make clean install


st
------

cd st 
sudo make clean install
