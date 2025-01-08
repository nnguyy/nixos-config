{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        font = "monocraft, 12";
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
  };
}
