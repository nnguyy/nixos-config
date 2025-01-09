{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/wallpaper2.png;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-mayhem.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.terminess-ttf;
        name = "Terminess Nerd Font";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      sizes = {
        terminal = 14;
      };
    };
  };
}
