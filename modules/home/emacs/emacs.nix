{ pkgs, config, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  home.file.".doom.d".source = ./doom;
}
