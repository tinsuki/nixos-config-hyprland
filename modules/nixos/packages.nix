{ config, lib, pkgs, inputs, ... }:
{
  environment.systemPackages = [
    # Add packages here
    pkgs.git
    pkgs.vim
    pkgs.fzf
    pkgs.oh-my-posh
    pkgs.asdf
    pkgs.wget
    pkgs.zoxide
    pkgs.neovim
    pkgs.spotify
    pkgs.spotify-tray
    pkgs.lsb-release
    inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".btop
    pkgs.qemu
    pkgs.valgrind
    pkgs.virtualbox
    pkgs.vagrant
    pkgs.vlc
    pkgs.rustup
    pkgs.gcc
    pkgs.cmake
    pkgs.sqlite
    pkgs.ninja
    pkgs.killall
    pkgs.wlogout
    pkgs.dunst
    pkgs.libnotify
    pkgs.grimblast
    pkgs.gnome.nautilus
    pkgs.swww
    pkgs.kdePackages.konsole
    pkgs.networkmanagerapplet
    pkgs.wl-clipboard
    pkgs.cliphist
    pkgs.pamixer
    pkgs.pavucontrol
    pkgs.playerctl
    pkgs.brightnessctl
    pkgs.numlockx
    inputs.zen-browser.packages."${pkgs.system}".default
    pkgs.deno
    pkgs.vivaldi
    pkgs.libsecret
    pkgs.keepassxc
    # dependencies for kitty terminal
    pkgs.harfbuzz
    pkgs.zlib
    pkgs.imagemagick
    pkgs.libpng
    pkgs.lcms
    pkgs.xxHash
    pkgs.openssl
    pkgs.freetype
    pkgs.fontconfig
    pkgs.libcanberra
    pkgs.kitty
  ];

  # nekofetch
  
}