#!/bin/bash
#
# Check for internet:
# $ ip a
# timedatectl set-ntp true
# lsblk # to see name of disk
# cfdisk /dev/sda
# dos
# swap partition
# deleta all
# make swap partition primary 4-8gb #82 linux swap
# New partition default (rest of disk) #83 (linux)
# quit
# mkfs.ext4 /dev/sda2
# mkswap /dev/sda1
# swapon /dev/sda1
# mount /dev/sda2 /mnt


# Base Install
echo 'Which is your terminal-based text editor of choice?'
PS3='editor: '
editors=("vim", "neovim", "nano", "emacs")
select editor in "${editors[@]}"; do
	pacstrap /mnt base linux linux-firmware $editor
	break
done

# FSTAB File
genfstab -U /mnt >> /mnt/etc/fstab

# Enter Install
arch-chroot /mnt

# Time Zone
continents=($(basename /usr/share/zoneinfo/*))
echo 'Which continent are you in?'
PS3='continent: '
select continent in "${continents[@]}"; do
	continent=$continent
	break
done

cities=($(basename /usr/share/zoneinfo/$continent/*))
echo 'Which city are you in?'
PS3='city: '
select city in "${cities[@]}"; do
	city=$city
	break
done

ln -sf /usr/share/zoneinfo/$continent/$city /etc/localtime
hwclock --systohc

# Locales (Just uses en_US.UTF-8 UTF-8)
sed -i '/en_US.UTF-8 UTF-8/s/#//2g' /etc/locale.gen

# Alternative way: create a menu (I didn't figure this way out).
# locales=($(sed -n '/aa/,$p' /etc/locale.gen | sed 's/# //'))

locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Hostname
echo "What would you like your machine to be called?"
read _hostname
echo $_hostname >> /etc/hostname

# Hosts file
echo "127.0.0.1			localhost" >> /etc/hosts
echo "::1						localhost" >> /etc/hosts
echo "127.0.1.1			arch.localdomain			$hostname" >> /etc/hosts

# Root Password
echo "Choose your root password."
passwd

# Boot Loader
echo "Next the boot loader packages will be installed. It is fine to accept the defaults for the following prompts."
pacman -S grub networkmanager network-manager-applet dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers
grub-install --target=i396-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Exit Install
exit

# Unmount
unmount -a

echo "You have finished Step 2. Now reboot your system and run config.sh."
