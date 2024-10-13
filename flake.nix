{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";


    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          extraSpecialArgs = {inherit inputs;};
          modules = [
            ./hosts/default/configuration.nix
          ]
        };
        nix-strix-g15 = nixpkgs.lib.nixosSystem {
          extraSpecialArgs = {inherit inputs;};
          modules = [
            ./hosts/nix-strix-g15/configuration.nix
          ]
        };
      }
    };
}
