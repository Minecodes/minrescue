#!/usr/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

rm -rf work*
mkdir -p dist work1 work2
mkarchiso -v -w work1 -o dist full
mkarchiso -v -w work2 -o dist minimal
