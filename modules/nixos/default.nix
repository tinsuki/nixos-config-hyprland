{ config, pkgs, ... }:
# Import all files in the current directory to be used in the configuration

{
  imports = [
    ./boot.nix
    ./firewall.nix
    ./fonts.nix
    ./hardware.nix
    ./hyprland.nix
    ./keyboard.nix
    ./network.nix
    ./packages.nix
    ./ssh.nix
    ./time.nix
    # ./users.nix
    ./virt.nix
    ./xserver.nix
  ];
}