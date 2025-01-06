{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "battery" "clock" ];


        "hyprland/submap" = {
          format = "{}";
          max-length = 8;
        };

        "battery" = {
          format = "{capacity} %";
        };
        "clock" = {
          format = "{:%a %d | %b %I:%M %p}";
          timezone = "America/New_York";
        };
      };
    };
  };
}
