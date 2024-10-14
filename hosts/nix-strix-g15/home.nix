{ config, pkgs, ... }:

{
  home.username = "tinsuki";
  home.homeDirectory = "/home/tinsuki";

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs[

    fastfetch
    (discord.override {
      withVencord = true;
    })
    jetbrains.clion
    jetbrains.goland
    jetbrains.webstorm
    jetbrains.phpstorm
    jetbrains.datagrip
    jetbrains.ruby-mine
    jetbrains.dataspell
    jetbrains.rust-rover
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    android-studio
    android-tools
    android-studio-tools
    vscodium
    github-desktop
    postman
    insomnia
    spotify
    spotify-tray
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
