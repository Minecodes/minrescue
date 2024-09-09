#!/usr/bin/bash
if [ "$EUID" -ne 0 ]; then
    sudo pacman -Sy
    sudo pacman -S --noconfirm reflector
    sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
    sudo pacman -Sy
    sudo pacman -S --noconfirm archiso
else
    pacman -Sy
    pacman -S --noconfirm reflector
    reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
    pacman -S --noconfirm archiso
fi