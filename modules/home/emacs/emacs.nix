{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  home.file."~/.config/emacs".source = ./emacs;
  home.file."~/.doom.d".source = ./doom.d;
}
