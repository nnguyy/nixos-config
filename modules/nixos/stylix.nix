{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    image = ../../wallpapers/wallpaper.png;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-black.yaml";

    opacity = {
      desktop = 1.0;
    };

    targets = {
      #waybar.enable = true;
      #hyprland.enable = true;
      #kitty.enable = true;
    };

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
