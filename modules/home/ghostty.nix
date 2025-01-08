{ pkgs, ...}:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };
}
