{ config, lib, pkgs, inputs, ... }:
{
  environment.systemPackages = [
    # Add packages here
    pkgs.git
    pkgs.asdf-vm
    pkgs.pkg-config
    pkgs.zoxide

    # editors
    pkgs.vim
    pkgs.neovim
    pkgs.nano

    # NodeJs and Deno2
    pkgs.nodejs_22
    inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".deno

    # compilators and debugers
    pkgs.rustup
    pkgs.gcc
    pkgs.cmake
    pkgs.gnumake
    pkgs.ninja
    pkgs.valgrind

    pkgs.btop
    pkgs.killall
    pkgs.lsb-release

    # android dev tools
    pkgs.android-tools
    pkgs.android-studio-tools

    # Python
    pkgs.python3
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.python312
    pkgs.python312Packages.pip

    # DataBases and API tools
    pkgs.sqlite

    # File managment
    pkgs.xz
    pkgs.gnome.nautilus

    # Virtualization & Emulation
    pkgs.qemu_full
    pkgs.virtualbox
    pkgs.vagrant

    # Media & Multimedia
    pkgs.vlc
    pkgs.playerctl
    pkgs.pamixer
    pkgs.pavucontrol

    # Desktop Environment 
    pkgs.kitty
    pkgs.kdePackages.konsole
    pkgs.brightnessctl
    pkgs.numlockx
    pkgs.gtk3
    pkgs.gtk4
    pkgs.dconf
    pkgs.libsecret
    pkgs.gparted

    # Customization
    pkgs.candy-icons
    pkgs.orchis-theme

    #  Web Browsers
    inputs.zen-browser.packages."${pkgs.system}".default
    pkgs.vivaldi
    pkgs.firefox
    inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".geckodriver

    # Web and Network tools
    pkgs.wget
    pkgs.linux-wifi-hotspot
    pkgs.protonvpn-cli
    pkgs.protonvpn-gui
    pkgs.curl
    pkgs.networkmanagerapplet
    pkgs.inetutils

    # Collaboration & Communication
    pkgs.teams-for-linux
    pkgs.oh-my-posh

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

    # vscodium editor
    (pkgs.vscode-with-extensions.override {
      vscode = pkgs.vscodium;
      vscodeExtensions = with pkgs.vscode-extensions; [
        # Nix support
        bbenoist.nix

        # Catpuccin Theme
        catppuccin.catppuccin-vsc-icons
        catppuccin.catppuccin-vsc

        # Open PDFs
        tomoki1207.pdf
      ];
    })

    # Document generator
    pkgs.doxygen

    # UI/UX design
    pkgs.figma-linux
    pkgs.gimp-with-plugins
  ];

  # nekofetch
  
}
