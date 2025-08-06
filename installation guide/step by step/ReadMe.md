## Important things!
You need a USB disk to make a bootable drive for Arch
You may need Ethernet cable for wifi but there is other way (iwctl)

## Phase 1: Pre-Installation
1. If dual boot with Windows (change between Arch and Windows), then go to Disc Management and allocate more free space for Arch Linux (minimum 50GB recommended). If you only want Arch, then skip to step 2
2. Install Etcher, Rufus, or Ventoy to make bootable USB. I used Rufus for Arch
3. Install ISO file from [archlinux.org/download](https://archlinux.org/download/) | Scroll all the way down and find your country (This only helps download faster, actual files are all the same)
4. Go to BIOS/UEFI (can be entered via "Recovery Options" (if on Windows) or a shortcut varies depends on motherboard companies
5. Turn off CSM Support and Secure Boot (Location of these depends on motherboard companies)
6. Choose boot in Arch, you should see something like this:
<img width="598" height="148" alt="image" src="https://github.com/user-attachments/assets/fe75772c-ee69-47e7-b59f-f77ddb7ddea3" />
7. This

## Now that you are in Arch, you can now setup Arch from USB
1. ```loadkeys <language>``` to change keyboard layout ```loadkeys us``` changes to US layout
2. Partition disk:
  1. ```lsblk``` to see the disk partition
  2. ```cfdisk <disk directory> ``` so if ```lsblk``` shows similar result in example below then run ```cfdisk /dev/sda``` but cfdisk should work with sda. Or nvme0n1, then run ```cfdisk /dev/nvme0n1```
<img width="867" height="291" alt="image" src="https://github.com/user-attachments/assets/20109b61-cb7b-47c3-9adc-a15cbb392579" />
  3. Go to Free Space section, New, and create 100M, 4G, rest of the storage (root)
  4. Write the partition & quit
5. Format partition disk: Refer to ```lsblk``` for disk partition name
  1. ```mkfs.ext4 <root disk>``` this is the one using the rest of the storage when you set up in step 3 of Partition disk
7. 


Run ```sudo pacman -S git base-devel``` to install essential packages
