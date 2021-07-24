#!/bin/sh

sudo pacman -Syyu
sudo pacman -S openssh rustup clang go base-devel python python-pip nodejs npm luarocks
rustup default stable
pin install --user wheel pynvim
git clone https://aur.archlinux.org/yay
sudo pacman -S xorg-server lightdm awesome accountsservice
sudo pacman -S xorg-bdftopcf xorg-docs xorg-font-util xorg-fonts-100dpi xorg-fonts-75dpi
sudo pacman -S xorg-iceauth xorg-mkfontscale xorg-server-devel xorg-server-xephyr
sudo pacman -S xorg-server-xnest xorg-server-xvfb xorg-sessreg xorg-smproxy xorg-x11perf
sudo pacman -S xorg-xauth xorg-xbacklight xorg-xcmsdb xorg-xcursorgen xorg-xdpyinfo
sudo pacman -S xorg-xdriinfo xorg-xev xorg-xgamma xorg-xhost xorg-xinit xorg-xinput
sudo pacman -S xorg-xkbevd xorg-xkbutils xorg-xkill xorg-xlsatoms xorg-xlsclients xorg-xmodmap
sudo pacman -S xorg-xpr xorg-xprop xorg-xrandr xorg-xrdb xorg-xrefresh xorg-xset xorg-xsetroot
sudo pacman -S xorg-xvinfo xorg-xwayland xorg-xwd xorg-xwininfo xorg-xwud 

sudo pacman -S pulseaudio pulseaudio-{alsa,bluetooth,equalizer,jackmlirc,rtp,zeroconf} pavucontrol
yay -S lightdm-slick-greeter
sudo sed -i "s/#greeter-session=.*/greeter-session=lightdm-slick-greeter/" /etc/lightdm/lightdm.conf 
sudo systemctl enable lightdm

yay -S betterlockscreen

sudo pacman -S hwdetect sof-firmware
yay -S aic94xx-firmware wd719x-firmware
sudo pacman -S tlp tp_smapi acpi_call htop-vim-temperature
yay -S tlpui-git
sudo systemctl enable tlp.service

yay -S neovim-git
sudo pacman -S xclip
yay -S alacritty-git

sudo pacman -S bluez bluez-utils
sudo pacman -S firefox-developer-edition chromium

yay -S nerd-fonts-complete
cargo install ripgrep
cargo install fd-find

sudo pacman -S libffi
