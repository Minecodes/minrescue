#!/usr/bin/bash
if [ "$EUID" -ne 0 ]; then
    sudo pacman -Sy
    sudo pacman -S --noconfirm reflector rsync
    sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
    sudo pacman -Sy
    sudo pacman -S --noconfirm archiso grub freetype2 fuse2 lzop efibootmgr os-probe
else
    pacman -Sy
    pacman -S --noconfirm reflector rsync
    reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
    pacman -S --noconfirm archiso grub freetype2 fuse2 lzop efibootmgr os-probe
fi
