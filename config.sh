#!/bin/bash

# Activate Internet
systemctl start NetworkManager

echo "Would you like to connect to wifi?"
select wifi in yes no
do
	case $wifi in
		yes)
			nmtui
			break
			;;
		no)
			break
			;;
		*)
			echo "You musch choose yes or no."
			;;
	esac
done

systemctl enable NetworkManager

# New User
echo "What would you like your username to be?"
read username
useradd -m -G wheel $username
passwd $username

# echo 'Which is your terminal-based text editor of choice?'
# echo "(Give the same response as before)."
# PS3='editor: '
# editors=("vim", "neovim", "nano", "emacs")
# select editor in "${editors[@]}"; do
#	EDITOR=$editor
#	break
# done

# Graphics Drivers
echo "Which graphics driver does your machine have?"
PS3='graphics: '
graphics=("nvidia", "intel", "amd")
select graphic in "${graphics[@]}"
do
	case $graphic in
		"nvidia")
			echo "You can accept the default response to the following prompt."
			pacman -S nvidia nvidia-utils
			break
			;;
		"intel")
			echo "You can accept the default response to the following prompt."
			pacman -S xf86-video-intel
			break
			;;
		"amd")
			echo "You can accept the default response to the following prompt."
			pacman -S xf86-video-amdgpu
			break
			;;
		*)
			echo "You must choose a graphics driver."
			;;
	esac
done

cd
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st
echo "You can accept the default response to the following prompt."
pacman -Sy xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk

touch /home/$username/.xinitrc
echo "exec dwm" >> /home/$username/.xinitrc

cd dwm
make clean install
cd ../st
make clean install

echo "startx" >> /home/$username/.bash_profile

echo "Now, run 'EDITOR=nano visudo' and uncomment '%wheel ALL=(ALL) ALL'"
echo "Then reboot your system and login to your user."
