{ config, pkgs, ... }:
{
  home.username = "tinsuki";
  home.homeDirectory = "/home/tinsuki";

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../../modules/home-manager/tinsuki
  ];

  programs.oh-my-posh.enableBashIntegration = true;

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.home-manager.enable=true;
}
