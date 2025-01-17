{ config, pkgs, inputs, ... }:

{
  imports = [
    ./system.nix
    ./networking.nix
    ./locales.nix
    ./desktop.nix
    ./steam.nix
    ./home-manager.nix
    ./stylix.nix
    ./nvf.nix
    ./synthing.nix
  ];
}
