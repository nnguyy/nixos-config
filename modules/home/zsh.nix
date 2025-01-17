{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    sessionVariables = {
      PATH = "$HOME/.config/emacs.d/bin:$PATH";
    };
  };
}
