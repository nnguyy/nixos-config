{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Terminess Nerd Font";
      size = 14;
    };
    cursor_trail = 3;
  };
}
