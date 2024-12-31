{ config, pkgs, inputs, userName, hostName, ... }:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "${userName}" = import ../../hosts/${hostName}/home.nix;
    };
  };
}
