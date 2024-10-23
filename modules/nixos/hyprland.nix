{config, lib, pkgs, ...}:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  security.pam.services.hyprland.enableGnomeKeyring = true;

  environment.systemPackages = with pkgs; [
    waybar
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    tofi
    hyprlock
    hypridle
    hyprsunset
    hyprpicker
    swww
    hyprlang
    hyprutils
    hyprcursor
  ];
}