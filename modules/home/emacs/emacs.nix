{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  home.file."~/.config/emacs".source = pkgs.fetchgit {
    url = "https://github.com/doomemacs//doomemacs";
    rev = "master";
  };
  home.file."~/.doom.d".source = ./.doom.d;
}
