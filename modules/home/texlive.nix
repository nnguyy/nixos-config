{ config, lib, pkgs, ... }:

{
  programs.texlive.enable = true;

  programs.texlive.extraPackages = with pkgs.texlive; [
    scheme-basic
    latexmk
  ];
}
