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
    brightnessctl
    stow

    #emacs-nox
    fd
    shellcheck
    pandoc
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
