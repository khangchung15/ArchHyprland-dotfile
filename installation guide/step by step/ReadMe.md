## Important things!
You need a USB disk to make a bootable drive for Arch

You may need Ethernet cable for wifi but there is other way (iwctl)

If dual boot with Windows (change between Arch and Windows), scroll to bottom for dual boot step by step

## Part 1: Making Bootable USB
In this part, we will make a bootable Arch USB, turn off Secure Boot, & boot into Arch

1. Install Etcher, Rufus, or Ventoy to make bootable USB. I used Rufus for Arch
2. Install ISO file from [archlinux.org/download](https://archlinux.org/download/) | Scroll all the way down and find your country (This only helps download faster, actual files are all the same)
3. Go to BIOS/UEFI (can be entered via "Recovery Options" (if on Windows) or a shortcut varies depends on motherboard companies
4. Turn off CSM Support and Secure Boot (Location of these depends on motherboard companies)
5. Choose boot in Arch, you should see something like this:
<img width="598" height="148" alt="image" src="https://github.com/user-attachments/assets/fe75772c-ee69-47e7-b59f-f77ddb7ddea3" />

## Part 2: Setting up Arch from USB
Once you boot into Arch, we need to set it up in our system since Arch only currently running on USB. In this part, we will:
- Partition, format, and mount disk 3 different disks
- Setup time, date, and localization
- Setup name and password for system and user
- Setup Grub and dual boot Windows

1. Partition disk: If dual boot with Windows, the first 3-4 partition is Windows
  - ```lsblk``` to see the disk partition
  - ```cfdisk <disk directory> ``` so if ```lsblk``` shows similar result in example below then run ```cfdisk /dev/sda``` but cfdisk should work with sda. Or if you have nvme0n1, then run ```cfdisk /dev/nvme0n1```
<img width="867" height="291" alt="image" src="https://github.com/user-attachments/assets/20109b61-cb7b-47c3-9adc-a15cbb392579" />

  - Go to Free Space section, New, and create 100M (boot), 4G (swap), rest of the storage (root)
  - Write the partition & quit

2. Format partition disk: Refer to ```lsblk``` for disk partition name
  - ```mkfs.ext4 <root>``` this is the one using the rest of the storage when you set up in step 3 of Partition disk
  - Format boot: ```mkfs.fat -F 32 <boot>```
  - Format swap: ```mkswap <swap>```
 
3. Mount disk
  -  Mount root partition: ```mount <root> /mnt```
  -  Make directory and mount boot: ```mkdir -p /mnt/boot/efi``` & ```mount <boot> /mnt/boot/efi```
  -  Turn on swap partition: ```swapon <swap>```
  -  Run ```lsblk``` and check if all 3 partitions are properly formatted as shown here:
    <img width="576" height="168" alt="image" src="https://github.com/user-attachments/assets/356896f5-4f11-4709-a09d-df577fba69e8" />

4. Install basic packages: ```pacstrap /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr nano networkmanager```
5. ```genfstab /mnt > /mnt/etc/fstab``` | The output of ```genfstab /mnt``` should be the same as ```cat /mnt/etc/fstab```
6. ```arch-chroot /mnt``` | The word "root" should no longer be red

7. Set up time & date
  - ```ln -sf /usr/share/zoneinfo/<region> /etc/localtime``` | for example: ```ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime```
  - ```date``` to check for time and date
  - ```hwclock --systohc``` to sync system clock
8. Localization
  - ```nano /etc/locale.gen```
  - Pick to locale, I use ```en_US.UTF-8 UTF-8``` | You can uncomment by deleting ```#```
  - ```Ctrl + S``` to save & ```Ctrl + X``` to exit
  - ```locale-gen``` to generate locale
  - ```nano /etc/locale.conf```
  - ```LANG=en_US.UTF-8```, save & exit

9. Setup PC name & password
  - ```nano /etc/hostname``` & put the name for your PC & save & quit
  - ```passwd``` to set password

10. Setup PC user & password
  - ```useradd -m -G wheel -s /bin/bash <user name>```
  - ```passwd <user name>``` to setup password for that user

11. Allow user to use ```sudo```
  - ```EDITOR=nano visudo``` & scroll all the way down
  - Delete ```#``` under "Uncomment to allow memebers of group wheel to execute any command like so
  - <img width="863" height="55" alt="image" src="https://github.com/user-attachments/assets/b863a075-5082-490d-b470-b41367020f57" />

12. ```systemctl enable NetworkManager```
13. Setup Grub
  - ```grub-install <disk>``` for example ```/dev/sda``` or ```/dev/nvme0n1```
  - ```grub-mkconfig -o /boot/grub/grub.cfg```
  - If you want to setup dual boot with Windows scroll all the way down for instruction

14. ```exit``` to return back to red "root"
15. ```umount -a``` to unmount any non-busy partition
16. ```reboot``` to restart and end up in Arch | You may also want to go back into BIOS and enable Arch as boot option #1 instead of Windows if you get Windows after rebooting

## Part 3: Getting into Hyprland
If you do everything correctly, you should reboot to this screen
<img width="930" height="477" alt="image" src="https://github.com/user-attachments/assets/88fa7bf6-be17-4fbc-b39c-288999f23734" />

1. Login with username and password you created | If successful, the prompt should be white ```[<username>@<system name> ~]$```
2. Install Hyprland & other stuffs ```sudo pacman -S hyprland waybar rofi kitty sddm``` | Keep pressing Enter until it downloads
3. Start display manager ```sudo systemctl enable sddm``` & ```sudo systemctl enable sddm --now```
4. You will no longer see terminal screen (TTY) but you are now in Arch Hyprland

## Part 4: Ricing

# Dual boot with Windows
This is the section for dual boot Windows and Arch
## Make Space for Arch
  - On Windows, ```Windows + X``` → Disk Management & allocate more free space for Arch Linux (minimum 50GB recommended)
  - Right click on partition and choose "Shrink Volume"
## Setup Grub Section
1. Install os prober: ```sudo pacman -S os-prober```
2. Temporarily mount Windows boot partition
  - ```sudo mkdir -p /mnt/windows-efi```
  - ```sudo mount <windows boot partition> /mnt/windows-efi```
  - The Windows boot partition should be the 100MB in the first 3-4 partition
3. Enable os prober
  - ```sudo nano /etc/default/grub```
  - Delete ```#``` from ```GRUB_DISABLE_OS_PROBER=false```
4. Regenerate grub config: ```sudo grub-mkconfig -o /boot/grub/grub.cfg```
