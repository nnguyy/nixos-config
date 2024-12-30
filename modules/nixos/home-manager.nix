{ config, pkgs, inputs, ... }:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "nnguy" = import ./home.nix;
    };
  };
}
