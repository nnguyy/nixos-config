{ pkgs, config, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  home.file."${config.home.homeDirectory}/.doom.d".source = ./doom;
}
