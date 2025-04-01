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
    gcc
    wget
    bibata-cursors

    shellcheck
    live-server
    cmake
    libtool
  ];
  virtualisation.docker.enable = true;
  users.extraGroups = {
    docker.members = [ "nnguy" ];
  };

  nixpkgs.config.rocmSupport = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
