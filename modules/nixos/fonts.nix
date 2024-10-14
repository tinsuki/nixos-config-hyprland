{ config, lib, pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerdfonts
      fira-code
      fira-sans
      vistafonts
      monospace
      roboto
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["roboto-serif" "serif"]
        sansSerif = ["Roboto" "Fira Sans" "sans-serif"]
        monospace = ["CaskaydiaCove" "Fira Code" "monospace"]
      }
  };
}