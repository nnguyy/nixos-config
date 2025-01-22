{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland-qtutils, home-manager, stylix, nvf, ... }@inputs:

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
        inputs.nvf.nixosModules.default
      ];
    };

    mkHome = config: home-manager.lib.homeManagerConfiguration {
      inherit (inputs.nixpkgs) pkgs;
      modules = [
        ./hosts/${config.hostName}/home.nix
        #inputs.nvf.homeManagerModules.default
      ];
    };
  in
  {
    nixosConfigurations = {
      # Create configurations for each system
      desktop = mkSystem "desktop" systems.desktop;
      laptop = mkSystem "laptop" systems.laptop;
    };

    homeConfigurations = {
      "${systems.desktop.userName}@${systems.desktop.hostName}" = mkHome systems.desktop;
      "${systems.laptop.userName}@${systems.laptop.hostName}" = mkHome systems.laptop;
    };
  };
}
