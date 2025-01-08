{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntergration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "natural";
      };
    };
  };
}
