# boot.nix for grub configuration
{ config, pkgs, lib, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    enableCryptodisk = false;
    theme = /home/tinsuki/.dotfiles/catppuccin-tinsuki-grub-theme;
  };
  boot.loader.efi.canTouchEfiVariables = true;
}
