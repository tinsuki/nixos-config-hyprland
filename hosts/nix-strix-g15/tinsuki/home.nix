{ config, pkgs, ... }:
{
  home.username = "tinsuki";
  home.homeDirectory = "/home/tinsuki";

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../../modules/home-manager/tinsuki
  ];

  programs.home-manager.enable=true;
}
