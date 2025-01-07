{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #(discord.override {
    #withVencord = true;
    #})
    #webcord-vencord
    vesktop
  ];

  home.file = {
    ".config/vesktop/themes/gruvbox.theme.css".source = ./gruvbox.css;
    ".config/vesktop/themes/DarkMatter.theme.css".source = ./darkmatter.css;
  };
}
