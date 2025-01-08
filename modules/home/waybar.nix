{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ]; 
        modules-center = [ "hyprland/window" ];
        modules-right = [ "battery" "clock" ];

        "battery" = {
          format = "{capacity} %";
        };
        "clock" = {
          format = "{:%a %d | %b %I:%M %p}";
          timezone = "America/New_York";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: monocraft;
      }

      window#waybar {
        background: rgba(0, 0, 0, 0.2);
        color: #ffffff;
      }
    '';
  };
}
