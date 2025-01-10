{ config, pkgs, inputs, userName, hostName, ... }:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [{
      stylix.targets = {
        waybar.enable = false;
        neovim.transparentBackground.main = true;
        neovim.transparentBackground.signColumn = true;
      };
    }];
    users = {
      "${userName}" = import ../../hosts/${hostName}/home.nix;
    };
  };
}
