Follow along to install Arch Linux

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
