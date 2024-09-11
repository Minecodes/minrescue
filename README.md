# MINRESCUE
A small backup live distro built on the Arch Linux installer (archiso).

-------------

The goal of this project is to create a small live distro which is small enough to be booted into memory on old computers but also providing a small TUI to backup your data to a USB drive.

------

## Requirements
- ~512MB of RAM (I recommend the minimal version on older systems)
- ~2GB flash drive (or whatever you want to live boot it from)

## Install "normal" Minrescue
Please replace the `*` with the version number / built date of the ISO file.
Also, replace `sdX` with the device name of your USB drive.

### Installation (Ventoy)
1. Install ventoy on a USB drive
2. Drag and drop the ISO file into the USB drive (`minrescue-*.iso`)
3. Boot into ventoy
4. Select the minrescue ISO file

### Installation (dd)
1. Flash the ISO file to the USB drive
2. Boot into the USB drive

```bash
sudo dd if=minrescue-*.iso status=progress of=/dev/sdX
```
            
### Installation (Etcher)
1. Open Etcher
2. Select the minrescue ISO file
3. Select the USB drive
4. Flash the ISO file to the USB drive

## Install "minimal" Minrescue
Please replace the `*` with the version number / built date of the ISO file.
Also, replace `sdX` with the device name of your USB drive.

### Installation (Ventoy)
1. Install ventoy on a USB drive
2. Drag and drop the ISO file into the USB drive (`minrescue minimal-*.iso`)
3. Boot into ventoy
4. Select the minrescue minimal ISO file

### Installation (dd)
1. Flash the ISO file to the USB drive
2. Boot into the USB drive

```bash
sudo dd if="minrescue minimal-*.iso" status=progress of=/dev/sdX
```

### Installation (Etcher)
1. Open Etcher
2. Select the minrescue minimal ISO file
3. Select the USB drive
4. Flash the ISO file to the USB drive

## Usage
**The script compresses your backup with 7zip! Please note that it will take a lot longer then just using dd to create a ISO**

1. Boot into the USB drive
2. Plug in your backup drive
3. Mount your backup drive (e.g. `mount /dev/sdX1 /mnt`)
4. Go to the mounting location (e.g. `cd /mnt`)
5. Run `minbk` to start the backup process

## Building
**You have to use an arch-based distro/container for this**

### On a VM/PC
1. Clone the repository
2. Run `./install_dependencies.sh`
3. Run `./build.sh` (this will take a while and use 100% of the CPU, because mkarchiso is defaulting to that)
4. Copy/Use the ISO file in `dist/`

### On a container
1. Clone the repository
2. Run `docker run -it --privileged --rm -v ".:/mnt/" archlinux bash` (the privileged flag is needed for mkarchiso)
3. Run `cd /mnt/`
4. Run `./install_dependencies.sh`
5. Run `./build.sh` (this will take a while and use 100% of the CPU, because mkarchiso is defaulting to that)
6. Close your container
7. Copy/Use the ISO file in `dist/`

### On Github Actions
1. Fork the repository
2. Make a new commit or tag