{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos
      inputs.home-manager.nixosModules.default
    ];

  environment.systemPackages = with pkgs; [
    vim 
    git
    wget
    waybar
    bibata-cursors
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
