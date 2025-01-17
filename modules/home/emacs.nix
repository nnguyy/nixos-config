{ pkgs, ... }:

{
  emacs = {
    enable = true;
    package = pkgs.emacsgit;
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };
}
