{ config, lib, pkgs, inputs,... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../default/configuration.nix
      inputs.home-manager.nixosModules.default
    ];
    
  services.grub-bootloader.enable = true; 

  networking.hostName = "nix-strix-g15";
  networking.networkmanager.enable = true;

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  boot.kernelParams = ["nvidia-drm.modeset=1" "nvidia-drm.fbdev=1"];

  users.users.tinsuki = {
    isNormalUser = true;
    description = "tinsuki";
    extraGroups = [ "networkmanager" "wheel" "docker" "kvm" ];
    packages = with pkgs; [];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "tinsuki" = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    # Hyprland GPU accelerated screen locking utility
    hyprlock
    hypridle
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
