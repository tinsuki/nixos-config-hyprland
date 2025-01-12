{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [

    # Allows to customize the terminal appearance - https://ohmyposh.dev/
    oh-my-posh

    # Fast file searching / Command line fuzzy finder - https://github.com/junegunn/fzf
    fzf

    # System information display tool - https://github.com/fastfetch-cli/fastfetch
    fastfetch

    # Improved cd command - https://github.com/ajeetdsouza/zoxide
    zoxide

    # Tree-like directory listing -
    tree

    # Kitty terminal emulator - https://sw.kovidgoyal.net/kitty/
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
    # kitty terminal
    pkgs.kitty

    # Konsole terminal emulator - https://konsole.kde.org/
    kdePackages.konsole
  ];
}