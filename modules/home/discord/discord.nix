{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #(discord.override {
    #withVencord = true;
    #})
    webcord-vencord
  ];
  xdg.configFile."Webcord/Themes/gruvbox.theme.css".source = ./gruvbox.css;
  xdg.configFile."Webcord/Themes/DarkMatter.theme.css".source = ./darkmatter.css;
}
