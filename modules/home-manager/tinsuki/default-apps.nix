{ config, pkgs, inputs, ...}:
{
  xdg.mimeApps.enable = true;

  xdg.mimeApps.defaultApplications = {
    "text/html" = "zen.desktop";
    "x-scheme-handler/http" = "zen.desktop";
    "x-scheme-handler/https" = "zen.desktop";
    "x-scheme-handler/about" = "zen.desktop";
    "x-scheme-handler/unknown" = "zen.desktop";
  };

  home.sessionVariables.DEFAULT_BROWSER = "${inputs.zen-browser.packages."${pkgs.system}".default}/bin/zen";
}