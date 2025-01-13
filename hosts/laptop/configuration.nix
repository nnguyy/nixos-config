{ config, pkgs, inputs, userName, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos
      inputs.home-manager.nixosModules.default
    ];

  environment.systemPackages = with pkgs; [
    vim 
    gh
    wget
    bibata-cursors
    brightnessctl
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
