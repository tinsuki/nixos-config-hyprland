{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    
    # Web browsers
    inputs.zen-browser.packages."${pkgs.system}" # Firefox like - https://zen-browser.app/
    vivaldi                                              # Vivaldi - https://vivaldi.com/download/
    chromium                                             # Chromium - https://www.chromium.org/getting-involved/download-chromium/
    inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".geckodriver # GeckoDriver

    # Internet interaction
    wget
    curl 
    motrix                                               # HTTP, FTP, Torrent, etc... : https://motrix.app/
  ];

  # Install firefox the Nix way i guess
  programs.firefox.enable = true;                        # Mozilla Firefox
}