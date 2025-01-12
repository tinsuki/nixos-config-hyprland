{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Language developement related tools
    libgcc
  ];
}