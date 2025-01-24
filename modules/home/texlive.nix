{ config, pkgs, ... }:

{
  programs.texlive.enable = true;

  programs.texlive.extraPackages = "tpkgs: {
    inherit (tpkgs) collection-full;
  }";
}

