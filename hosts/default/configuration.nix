 # configuration.nix

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/system.nix
      ../../modules/nixos/networking.nix
      ../../modules/nixos/locales.nix
      ../../modules/nixos/desktop.nix
      ../../modules/nixos/services.nix
      ../../modules/nixos/packages.nix
      ../../modules/nixos/home-manager.nix
      inputs.home-manager.nixosModules.default
    ];
  system.stateVersion = "24.11"; # Did you read the comment?
}
