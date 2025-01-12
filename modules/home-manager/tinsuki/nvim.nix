{ config, pkgs, inputs, lib, ...}:
{
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    extraConfig = lib.fileContents /home/tinsuki/.config/nvim/init.lua;
  };
}