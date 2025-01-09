{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.image = ../../wallpapers/wallpaper2.png;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/3024.yaml";

}
