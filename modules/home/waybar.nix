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
        modules-right = [ "clock" "battery" ];

        "battery" = {
          format = "{capacity} %";
        };
        "clock" = {
          format = "{:%b %d | %a | %I:%M %p }";
          timezone = "America/New_York";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: monocraft;
        font-size: 14px;
        padding: 0px;
        margin: 0px;
      }

      window#waybar {
        background: rgba(0, 0, 0, 0);
        color: #ffffff;
      }

      #workspaces button {
        color: #d0d0d0; /* Light gray text */
        background: transparent;
      }

      #workspaces button.active {
        color: #ffffff; /* White text for active workspace */
        background: #444444; /* Dark gray background for active workspace */
      }

      #workspaces button.focused {
        color: #000000; /* Black text */
        background: #ffffff; /* White background */
      }

      #workspaces button.urgent {
        color: #ff0000; /* Red text for urgent workspace */
        background: #000000; /* Black background */
      }

      #workspaces button:hover {
        background: #666666; /* Lighter gray on hover */
        color: #ffffff; /* White text */
      }    
    '';
  };
}
