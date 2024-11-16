{ config, pkgs, ... }:
# Import all files in the current directory to be used in the configuration

{
  imports = [
    ./bash.nix
    ./config-files.nix
    ./user-packages.nix
    ./default-apps.nix
    ./gnome.nix
  ];
}