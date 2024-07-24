#!/bin/bash

echo "#################"
echo "# dwminstall.sh #"
echo "#################"

echo "Please check the README.md and read the prerequisites list. Install them if needed."
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

echo "!!! DOAS USERS !!! Sudo is used in this script! Alias doas to sudo or install sudo before continuing! Ctrl-C to exit the script now and apply the changes mentioned."
echo "Script will continue in 15 seconds."
sleep 15

if [ -d ~/suckless ]; then
	echo "~/suckless exists. Continuing..."
else
	echo "~/suckless does not exist, create it."
	echo "mkdir ~/suckless"
	mkdir ~/suckless
fi

echo "Cloning repositories..."
pushd ~/suckless
git clone https://github.com/GitOGraphr512/dwmdots.git
git clone https://github.com/GitOGraphr512/stdots.git
git clone https://github.com/GitOGraphr512/slstatusdots.git
git clone https://git.suckless.org/dmenu
popd
echo "Done!"

echo "Building dwm and suckless tools..."

pushd ~/suckless/dwmdots
mkdir patches
mv dwm-always-center-20200625-f04cac6.diff dwm-uselessgap-20211119-58414bee958f2.diff dwm-attachbelow-6.2.diff patches/
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
sudo make clean install
popd

echo "Done!"
echo "dwm, st, dmenu, and slstatus should be installed if everything went correctly."
echo "If you find any bugs in this script, email me at <gitMailbox123@protonmail.com>."
echo "Thanks for using my install script :-)"
