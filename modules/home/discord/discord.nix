{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (discord.override {
    withVencord = true;
    })
    # webcord-vencord
  ];
  xdg.configFile."Vencord/themes/gruvbox.theme.css".source = ./gruvbox.css;
  xdg.configFile."Vencord/themes/DarkMatter.theme.css".source = ./darkmatter.css;
}
