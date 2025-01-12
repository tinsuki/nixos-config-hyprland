{ config, pkgs, lib, ... } : {

  imports = [
    ./devops
    ./maths
    ./programming
    ./security
    ./sysadmin
    ./ui-ux
    ./game-dev

    ./editors.nix
    ./games.nix
    ./graphics.nix
    ./media.nix
    ./nix-utilities.nix
    ./notes.nix
    ./team-work.nix
    ./utils.nix
    ./web.nix
  ];

}