{ config, pkgs, userName, ... }:

{
  # Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet";
        user = "${userName}";
      };
    };
  };

  # Hyprland
  programs.hyprland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.terminess-ttf
    monocraft
  ];

  # Cursor
  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    #XCURSOR_SIZE = "24";
  };

  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
