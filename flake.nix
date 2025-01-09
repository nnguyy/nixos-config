{
  description = "Nixos config flake";

  inputs = {
    stylix.url = "github:danth/stylix";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland-qtutils, ... }@inputs:

  #TODO: change nnguy in userName to a system user
  let
    # Define configurations for each system
    systems = {
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
        inputs.stylix.nixosModules.stylix
      ];
    };
  in
  {
    nixosConfigurations = {
      # Create configurations for each system
      desktop = mkSystem "desktop" systems.desktop;
      laptop = mkSystem "laptop" systems.laptop;
    };
  };
}
