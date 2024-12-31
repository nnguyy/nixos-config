{ config, pkgs, inputs, userName, hostName, ... }:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "default" = import ../../hosts/${hostName}/home.nix;
    };
  };
}
