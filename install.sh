#!/bin/sh

# remove tofi cache to enable tofi compatibility with the new generation
sudo rm -r $HOME/.cache/tofi*

# remove config files overwritten by the new generation (uncomment or add to add files)
sudo rm -r $HOME/.config/gtk-* $HOME/.config/mimeapps.list
# sudo rm -r $HOME/.config/fastfetch
# sudo rm -r $HOME/.config/oh-my-posh
# sudo rm -r $HOME/.config/kitty

# backup th current config 
sudo cp -r /etc/nixos /etc/nixos.back.$(date +%Y%m%d_%H%M%S)

sudo rm -rf /etc/nixos/*

sudo nixos-generate-config
sudo cp /etc/nixos/hardware-configuration.nix ./hosts/nix-strix-g15/
sudo rm -rf /etc/nixos/*

sudo cp -r ./* /etc/nixos/
sudo cp -r ./*.* /etc/nixos/

if [[ ! -d $HOME/.dotfiles ]]; then
    mkdir -p $HOME/.dotfiles
    cp -r ./dotfiles/* $HOME/.dotfiles/
else
    sudo cp -r $HOME/.dotfiles $HOME/.dotfiles.back.$(date +%Y%m%d_%H%M%S)
    rm -rf $HOME/.dotfiles
    mkdir -p $HOME/.dotfiles
    cp -r ./dotfiles/* $HOME/.dotfiles/
fi

sudo nixos-rebuild switch -p hyprland --flake /etc/nixos/#nix-strix-g15

