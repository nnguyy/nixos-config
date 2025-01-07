{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      #name = "Terminess Nerd Font";
      name = "Monocraft";
      #size = 14;
      size = 12;
    };
    extraConfig = "
    cursor_trail 3  
    ";
  };
}
