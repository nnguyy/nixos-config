{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    #font = {
      #name = "Terminess Nerd Font";
      #size = 14;
      #name = "Monocraft";
      #size = 12;
    #};
    extraConfig = "
    cursor_trail 3  
    ";
  };
}
