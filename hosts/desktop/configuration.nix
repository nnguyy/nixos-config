{ config, pkgs, inputs, userName, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos
      inputs.home-manager.nixosModules.default
    ];

  home-manager.users.${userName} = import ./home.nix;

  environment.systemPackages = with pkgs; [
    vim 
    git
    wget
    waybar
    bibata-cursors
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
