{ pkgs, ... }:

{
  stylix.enable = false;
  stylix.image = ../../wallpapers/wallpaper.png;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gotham.yaml";
}
