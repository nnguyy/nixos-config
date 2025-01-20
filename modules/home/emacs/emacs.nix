{ pkgs, config, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  home.file.".doom.d".source = ./doom;
  home.file.".config/emacs" = {
    source = pkgs.fetchgit {
      url = "https://github.com/doomemacs/doomemacs";
      rev = "2bc0524";
      sha256 = "0a1px0igzhzl7mjl0wkp9jnb3sjggpbi2rnj0w2kga08d8frahcb";
    };
  };
}
