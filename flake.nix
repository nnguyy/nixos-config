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
  let
    configurations = [
      { userName = "default"; hostName = "default"; }
      { userName = "nnguy"; hostName = "desktop"; }
      { userName = "nnguy"; hostName = "laptop"; }
    ];
  in
  {
    nixosConfigurations = builtins.listToAttrs (map (config: {
      name = config.hostName;
      value = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          userName = config.userName;
          hostName = config.hostName;
        };
        modules = [
          ./hosts/${hostName}/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    }) configurations);
  };
}
