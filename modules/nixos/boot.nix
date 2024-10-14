# boot.nix for grub configuration
{ config, pkgs, options, lib, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    enableCryptodisk = false;
  };
  boot.loader.efi.canTouchEfiVariables = true;
}
