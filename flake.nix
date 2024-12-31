{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland-qtutils, ... }@inputs: {
    let
        userName = "default"; 
        hostName = "default";
    in {
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs userName hostName; };
        modules = [
          ./hosts/${hostName}/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
    let
        userName = "nnguy"; 
        hostName = "desktop";
    in {
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs userName hostName; };
        modules = [
          ./hosts/${hostName}/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
    let
        userName = "nnguy"; 
        hostName = "laptop";
    in {
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs userName hostName; };
        modules = [
          ./hosts/${hostName}/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
