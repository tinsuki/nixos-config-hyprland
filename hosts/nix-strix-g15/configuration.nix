{ config, lib, pkgs, inputs,... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ../../modules/nixos
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.tinsuki = {
    isNormalUser = true;
    description = "tinsuki";
    extraGroups = [ "networkmanager" "wheel" "docker" "kvm" ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "tinsuki" = import ./tinsuki/home.nix;
    };
  };

  environment.interactiveShellInit = ''
    export PATH=$PATH:/usr/bin
  '';

  environment.variables.PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
  environment.variables.PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
  environment.variables.PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";

  system.stateVersion = "24.11";
}
