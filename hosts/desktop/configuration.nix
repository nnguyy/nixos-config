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
    python
    rocmPackages.clr
    rocmPackages.rocminfo
    rocmPackages.rocm-smi
    pytorch
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
