{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    inotify-info   # INotify Info - https://github.com/mikesart/inotify-info
    btop           # Better Top   - https://github.com/aristocratos/btop
    bottom         # Bottom       - 
    gdu             # Disk usage analyzer
    lsb-release    # LSB Release  - 
    power-profiles-daemon # Power Profiles Daemon - Manages CPU power profiles
  ];
}