## Why Arch Linux?
- Bloat-free (no preinstalled solitaire)
- Yours (no corporate "helpful" background services)
- Transparent (fully open source)
- Free (no need to activate like Windows)
- Helps you understand about the OS as you install
- Helps you explore and read the manual (Arch Wiki)
- Fully customizable from top to bottom
- No holding hands like other Linux distros
- Considered by many to be the most difficult OS to install
- Other distros have many unnecessary pre-installed software
- Hyprland will be easier to install
- Released on 2002 which is my birthyear
- Able to say "I use Arch, btw"
- Its logo is an 'A' and it's my favorite letter (I think)

Congrats, you have been convinced that Arch is superior. Now let's install Arch Linux

## Installation Guide: Base Arch Installation
1. If dual boot with Windows (change between Arch and Windows), then go to Disc Management and allocate more free space for Arch Linux (minimum 50GB recommended). If you only want Arch, then skip to step 2
2. Install Etcher, Rufus, or Ventoy to make bootable USB. I used Rufus for Arch
3. Install ISO file from [archlinux.org/download](https://archlinux.org/download/) | Scroll all the way down and find your country (This only helps download faster, actual files are all the same)
4. Go to BIOS/UEFI (can be entered via "Recovery Options" (if on Windows) or a shortcut varies depends on motherboard companies
5. Turn off CSM Support and Secure Boot (Location of these depends on motherboard companies)
6. Choose boot in Arch
7. Once in Arch, follow the documentations on https://wiki.archlinux.org/title/Installation_guide | Start at 1.5: Set the console keyboard layout and font
8. Run ```sudo pacman -S git base-devel``` to install essential packages

## Video Guide
- You can also follor [Youtube Video](https://www.youtube.com/watch?v=68z11VAYMS8&) to install
- Notice that in the video, there are no dual booting (no Window + Arch) so there is only Arch

## Successfully install Arch Linux?
- Congratulations! You’ve escaped the confines of proprietary bloat. Your system is now as lightweight as your soul after uninstalling Windows. Enjoy the freedom
- Don’t panic if things break, that’s how you learn. The Arch Wiki is your bible and the terminal is your playground.
- Also, feel free to say "I use Arch, btw" to strangers you met

## Installation Guide: Hyprland & Dependencies
```sudo pacman -S hyprland kitty waybar rofi grim slurp swaybg swaylock-effects firefox```

---
[Arch Wiki](https://archlinux.org/) can contain useful documentations
