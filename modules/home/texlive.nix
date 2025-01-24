{ config, pkgs, ... }:

{
  programs.texlive.enable = true;

  programs.texlive.extraPackages = with pkgs.texlive; [
    scheme-basic   # Or scheme-full for a complete TeX Live setup
    latexmk        # Add other tools as needed
  ];
}

