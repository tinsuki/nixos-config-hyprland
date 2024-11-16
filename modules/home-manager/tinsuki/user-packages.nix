{ config, pkgs, ...}:
{
  home.packages = [
    pkgs.fastfetch
    (
      pkgs.discord.override {
        withVencord = true;
      }
    )
    pkgs.jetbrains.clion
    pkgs.jetbrains.goland
    pkgs.jetbrains.webstorm
    pkgs.jetbrains.phpstorm
    pkgs.jetbrains.datagrip
    pkgs.jetbrains.ruby-mine
    pkgs.jetbrains.dataspell
    pkgs.jetbrains.rust-rover
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.pycharm-professional
    pkgs.android-studio
    pkgs.android-tools
    pkgs.android-studio-tools
    pkgs.github-desktop
    pkgs.postman
    pkgs.insomnia
    pkgs.spotify
    pkgs.spotify-tray
    pkgs.vscode
  ];
}