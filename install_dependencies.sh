#!/usr/bin/bash
if [ "$EUID" -ne 0 ]; then
    sudo pacman -Sy
    sudo pacman -S --noconfirm archiso grub freetype2 fuse2 lzop efibootmgr
else
    pacman -Sy
    pacman -S --noconfirm archiso grub freetype2 fuse2 lzop efibootmgr
fi
