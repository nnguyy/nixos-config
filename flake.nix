{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland-qtutils, nixos-wsl, home-manager, stylix, ... }@inputs:

  let
    # Define configurations for each system
    systems = {
      desktop = { userName = "nnguy"; hostName = "desktop"; };
      laptop = { userName = "nnguy"; hostName = "laptop"; };
      wsl = { userName = "nixos"; hostName = "wsl"; };
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
        (if name == "wsl" then inputs.nixos-wsl.nixosModules.wsl else { })
        {
          home-manager.useUserPackages = true;
          home-manager.users.${config.userName} = import ./hosts/${name}/home.nix;
        }
      ];
    };
  in
  {
    nixosConfigurations = {
      desktop = mkSystem "desktop" systems.desktop;
      laptop = mkSystem "laptop" systems.laptop;
      wsl = mkSystem "wsl" systems.wsl;
    };
  };
}
