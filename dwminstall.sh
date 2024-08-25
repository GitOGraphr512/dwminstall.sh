#!/bin/bash

echo "#################"
echo "# dwminstall.sh #"
echo "#################"

echo "Please check the README.md and read the prerequisites list. Make sure they are installed."
echo "Starting in 5 seconds..."
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo "0"

echo "!!! DOAS USERS !!! Sudo is used in this script! Install sudo before continuing! Ctrl-C to exit the script now."
echo "Script will continue in 5 seconds."
sleep 5

if [ -d ~/suckless ]; then
	echo "~/suckless exists. Continue."
else
	echo "~/suckless does not exist, create it."
	echo "mkdir ~/suckless"
	mkdir ~/suckless
fi

sleep 2

echo "Cloning repositories..."
sleep 2
pushd ~/suckless
git clone https://github.com/GitOGraphr512/dwmdots.git
git clone https://github.com/GitOGraphr512/stdots.git
git clone https://github.com/GitOGraphr512/slstatusdots.git
git clone https://git.suckless.org/dmenu
popd
echo "Done!"

echo "Building dwm and tools..."
sleep 2
pushd ~/suckless/dwmdots
mkdir patches
mv dwm-alwayscenter-20200625-f04cac6.diff dwm-uselessgap-20211119-58414bee958f2.diff dwm-attachbelow-6.2.diff patches/
sudo make clean install
popd

pushd ~/suckless/dmenu
sudo make clean install
mkdir patches
popd

pushd ~/suckless/stdots
mkdir patches
mv st-scrollback-ringbuffer-0.8.5.diff patches/
sudo make clean install
popd

pushd ~/suckless/slstatusdots
mkdir components
cp battery.o cpu.o datetime.o disk.o entropy.o hostname.o ip.o kernel_release.o keyboard_indicators.o keymap.o load_avg.o netspeeds.o num_files.o ram.o run_command.o swap.o temperature.o uptime.o user.o volume.o wifi.o battery.c cpu.c datetime.c disk.c entropy.c hostname.c ip.c kernel_release.c keyboard_indicators.c keymap.c load_avg.c netspeeds.c num_files.c ram.c run_command.c swap.c temperature.c uptime.c user.c volume.c wifi.c components/
sudo make clean install
popd
echo "Done!"
sleep 2

echo "Cleaning up..."
sleep 2
pushd ~/suckless/slstatusdots
rm battery.o cpu.o datetime.o disk.o entropy.o hostname.o ip.o kernel_release.o keyboard_indicators.o keymap.o load_avg.o netspeeds.o num_files.o ram.o run_command.o swap.o temperature.o uptime.o user.o volume.o wifi.o battery.c cpu.c datetime.c disk.c entropy.c hostname.c ip.c kernel_release.c keyboard_indicators.c keymap.c load_avg.c netspeeds.c num_files.c ram.c run_command.c swap.c temperature.c uptime.c user.c volume.c wifi.c
popd
echo "Done!"

echo "Creating a simple ~/.xinitrc..."
touch ~/.xinitrc
echo "exec dwm &" > ~/.xinitrc
echo "slstatus" >> ~/.xinitrc
echo "Done!"
echo "Note: Starting dwm with 'startx' through a tty is HIGHLY recommended. I am not planning on testing this dwm config with any display managers such as SDDM or Ly, so I have no idea as to if this config works correctly with DMs."
echo "Note: The README.md explains how to edit the ~/.xinitrc file to your needs. Read it before asking: 'How do I add a persistant background?' or 'How do I set my brightness to x% at dwm startup?'"

echo "================================="
echo "dwm and tools should be installed if everything went correctly."
echo "If you find any bugs in this script or have any questions, comments, or concerns, email me at <gitMailbox123@protonmail.com>, or contact me on Jami: <gentoouser420>"
echo "Thanks for using my dwm install script :) - GitOGraphr512"
