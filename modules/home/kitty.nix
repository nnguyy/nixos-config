{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      #name = "Terminess Nerd Font";
      name = "monocraft";
      size = 14;
    };
    extraConfig = "
    cursor_trail 3  
    ";
  };
}
