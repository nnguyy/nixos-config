{ pkgs, config, lib, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  home.file."${config.home.homeDirectory}/.doom.d".source = ./doom;
  home.activation = {
    doom-emacs = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if [ ! -d "${config.home.homeDirectory}/.config/emacs" ]; then 
        git clone https://github.com/doomeemacs/doomemacs ${config.home.homeDirectory}/.config/emacs
        doom sync
      fi
      '';
  };
}
