{ config, pkgs, ... }:
# Import all files in the current directory to be used in the configuration

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./bluetooth.nix
    ./fonts.nix
    ./hardware.nix
    ./hyprland.nix
    ./network.nix
    ./ssh.nix
    ./locales.nix
    ./terminal.nix
    ./virt.nix
    ./xserver.nix
    ./packages
  ];
}