# arch (by Christopher Kapic)
Used to install and update archlinux

I have yet to write these scripts, but I'm actively getting into linux and I'd like to move into more "unixy" programs. Currently using KDE, when I reinstall I will be using these scripts. The readme currently is documenting what I would like the scripts to do, but the scripts still need to be written.

archinstaller uses default settings that work for me (specifically for my ThinkPad T530).
archinstaller does not partition the disk for you.
archinstaller does create a user for you.
archinstaller uses my .config directory.

archinstaller instals the following programs:
 - .zsh
 - yay
 - alacritty
 - dwm
 - dmenu
 - nvim
 - vscode
 - brave browser
 - neofetch
 - htop
 - ranger
 - Kdenlive
 - Gimp
 - mailspring (subject to change)
 - signal
 - pandoc (and a latex compiler)
 - python

archinstaller asks about the following programs:
 - Slack
 - Discord
 - Zoom
 - libreoffice
 - rust
 - golang

archupdate updates all of the programs on your system:
 - pacman packages
 - yay packages
 - pulls suckless repos and recompiles them
 
 # tutorial
 Partition your disk using `cfdisk`.
 
 Install git with `sudo pacman -S git`.
 
 Make sure you are in root's home directory: `cd`.
 
 Clone this repo: `git clone url`.
 
 Run the installation script: `./path/to/script'.
