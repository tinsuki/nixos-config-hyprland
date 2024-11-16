{ config, pkgs, ...}:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Glory-blue";
    };

    theme = {
      name = "Orchis-Purple-Dark";
      package = pkgs.orchis-theme;
    };

    cursorTheme = {
      name = "Furina";
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "Orchis-Purple-Dark";
  
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-show-weekday = true;
    };
  };
}