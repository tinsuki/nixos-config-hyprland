{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [

    unityhub  # Hub pour Unity moteur de jeu
    inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".godot_4  # Godot 4.3 moteur de jeu open-source
    raylib  # Bibliothèque de développement de jeux en C
    raylib-games  # Jeux créés avec Raylib
    libresprite  # Logiciel de pixel art pour les jeux
    # Bibliothèques de développement de jeux en C
    SDL2
    SDL2_ttf
    SDL2_net
    SDL2_gfx
    SDL2_sound
    SDL2_mixer
    SDL2_image
  
  ];
}