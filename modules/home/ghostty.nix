{ pkgs, ...}:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;

    settings = {
      cursorTrail = 3;
    };
  };
}
