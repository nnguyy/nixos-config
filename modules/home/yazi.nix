{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "natural";
      };
    };
  };
}
