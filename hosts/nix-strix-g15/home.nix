{ config, pkgs, ... }:
{
  home.username = "tinsuki";
  home.homeDirectory = "/home/tinsuki";

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

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
    pkgs.vscodium
    pkgs.github-desktop
    pkgs.postman
    pkgs.insomnia
    pkgs.spotify
    pkgs.spotify-tray
  ];

  home.file = {
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/hypr;
    ".config/tofi".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/tofi;
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/waybar;
    ".config/fastfetch".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/fastfetch;
    ".config/oh-my-posh".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/oh-my-posh;
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/kitty;
  };

  programs.bash.enable = true;

  programs.bash = {
    shellAliases = {
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=tty";
      remove-tofi-cache = "rm /home/tinsuki/.cache/tofi-*";
      cleart = "clear && fastfetch";
    };
    bashrcExtra = ''
      eval "$(oh-my-posh init bash --config /home/tinsuki/.config/oh-my-posh/config.json)"
    
      if [[ -n $KITTY_WINDOW_ID && $(tput lines) -ge 43 && $(tput cols) -ge 92 ]]; then
	      fastfetch
      fi
    '';
  };

  programs.oh-my-posh.enableBashIntegration = true;

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  home.sessionVariables = {
    BROWDER = "zen";
  };

  programs.home-manager.enable=true;
}
