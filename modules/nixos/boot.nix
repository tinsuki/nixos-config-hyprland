# boot.nix for grub configuration
{ config, pkgs, lib, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    enableCryptodisk = true;
    theme = "/etc/nixos/dotfiles/catppuccin-tinsuki-grub-theme";
    extraEntries = ''
      menuentry "BIOS / UEFI (Motherboard configuration)" --class efi {
        fwsetup
      }

      menuentry "Shutdown" --class shutdown {
        insmod halt
        halt
      }

      menuentry "Restart" --class restart {
        insmod reboot
        reboot
      }
    '';
  };
  boot.loader.efi.canTouchEfiVariables = true;
}
