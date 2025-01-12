{ inputs, config, lib, pkgs, ... }: { 

  # Install a bunch of nice tools for GNOME - https://apps.gnome.org/en/
  environment.systemPackages = with pkgs; [
    eog                                                            # Eye of GNOME - Image viewer
    ghex                                                           # GNOME Hex Editor
    enter-tex                                                      # LaTeX Editor
    setzer                                                         # LaTeX Editor
    texliveSmall                                                   # LaTeX Editor
    gnome-graphs                                                   # Graphs

    errands                                                        # Post-its
    dialect                                                        # Translation
    hieroglyphic                                                   # Find LaTeX symbols
    inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".gaphor # UML Modeling
    lorem                                                          # Generate "Lorem Ipsums"
    metadata-cleaner                                               # Clean file EXIF like data
    eyedropper                                                     # Color picker
    textpieces                                                     # Quick text processing
    wike                                                           # Open Wikipedia pages from app
    switcheroo                                                     # Convert images from format to format
    forge-sparks                                                   # Get git forges notifications when logged in
    elastic                                                        # Generate animations
    collision                                                      # Check hashes

    yed                                                            # Graph maker - https://www.yworks.com/products/yed
    tldr                                                           # TLDR pages  - https://tldr.sh/
    
    nautilus                                                      # Nautilus - File manager
    orchis-theme                                                  # Orchis Theme - Icon theme
    brightnessctl                                                 # Control screen brightness
    numlockx                                                      # Turn on numlock
    gtk3                                                          # GTK3
    gtk4                                                          # GTK4
    dconf                                                         # Dconf
  ];
}