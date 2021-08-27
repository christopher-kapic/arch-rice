Follow along to install Arch Linux

#### [Download the `.iso`](https://archlinux.org/download/)

#### Flash a USB
Use [Rufus](https://rufus.ie/) (Windows) or [Etcher](https://www.balena.io/etcher/) (MacOS or Linux) to flash the `.iso` to a flash drive.

#### Boot into the installation media
Common boot buttons include:
- `F12` - ThinkPads

#### Connect to the internet
Ethernet/virtual machine does not require any extra setup. For wifi, you will use the `iwctl` utility:

    iwctl device list
    iwctl station [device] get-networks
    iwctl station [device] connect [network]

After the last command runs, you will be prompted to enter a password if the wifi network is private.

_Note: If your network has multiple works, it must be enclosed in quotes._

You can test your connection by using the `ping` command (for example, `ping blog.kapic.io`).

#### Advanced: determine the boot mode

Check whether the `/sys/firmware/efi/efivars` directory exists:

    ls /sys/firmware/efi/efivars

If the directory exists, the computer boots with UEFI. If the directory does not exist, it probably boots with BIOS.

#### Optional: update the system clock

    timedatectl set-ntp true

#### Partition the drive

There are several options for partitioning the drive. You may use whichever you prefer; I suggest `cfdisk` because it is a GUI. ([Video reference](https://youtu.be/HpskN_jKyhc?t=774))

    cfdisk

The Arch Linux Installation Guide suggests using a root and a swap (> 512MiB) partition. If you are booting with UEFI, also create a boot partition.

#### Mount the drive

#### Install essential packages

    pacstrap /mnt base linux linux-firmware

#### Fstab

    genfstab -U /mnt >> /mnt/etc/fstab

#### Change root into the new system

    arch-chroot /mnt
