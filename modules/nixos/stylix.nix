{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/wallpaper2.png;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };


    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-black.yaml";
  };



}
