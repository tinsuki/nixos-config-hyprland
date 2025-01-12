{ config, pkgs, ... }:
{
  
  home.file = {
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/hypr";
    ".config/tofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/tofi";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/waybar";
    ".config/fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/fastfetch";
    ".config/oh-my-posh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/oh-my-posh";
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/kitty";
    ".config/dunst".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/dunst";
    ".icons/Furina".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/assets/icons/Furina";
    ".icons/Avidity".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/assets/icons/Avidity";
    ".config/wlogout".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/wlogout";
    ".icons/Furina_hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/assets/icons/Furina_hypr";
    ".icons/Glory-blue".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/assets/icons/Glory-blue";
    ".icons/Glory-blue-dark".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/assets/icons/Glory-blue-dark";
    ".config/gtk-4.0/bookmarks".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/gtk-4.0/bookmarks";
  };
}
