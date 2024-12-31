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

  outputs = { self, nixpkgs, hyprland-qtutils, ... }@inputs:

  #TODO: change default userName to system user

  let
    # Define configurations for each system
    systems = {
      default = { userName = "default"; hostName = "default"; };
      desktop = { userName = "nnguy"; hostName = "desktop"; };
      laptop = { userName = "nnguy"; hostName = "laptop"; };
    };

    # Function to create a nixosSystem configuration
    mkSystem = name: config: nixpkgs.lib.nixosSystem {
      specialArgs = { 
        inherit inputs; 
        userName = config.userName; 
        hostName = config.hostName; 
      };
      modules = [
        ./hosts/${name}/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  in
  {
    nixosConfigurations = {
      # Create configurations for each system
      default = mkSystem "default" systems.default;
      desktop = mkSystem "desktop" systems.desktop;
      laptop = mkSystem "laptop" systems.laptop;
    };
  };
}
