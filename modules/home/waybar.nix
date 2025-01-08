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
          format = "{:%a %d | %b | %I:%M %p}";
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
        padding: 0px;
        margin: 0px;
      }

      #workspaces button {
        padding: 5px;
        margin: 2px;
        color: #d0d0d0; /* Light gray text */
        background: transparent;
        border-radius: 4px;
      }

      #workspaces button.active {
        color: #ffffff; /* White text for active workspace */
        background: #444444; /* Dark gray background for active workspace */
      }

      #workspaces button.focused {
        color: #000000; /* Black text */
        background: #ffffff; /* White background */
        border-radius: 4px;
      }

      #workspaces button.urgent {
        color: #ff0000; /* Red text for urgent workspace */
        background: #000000; /* Black background */
        border-radius: 4px;
      }

      #workspaces button:hover {
        background: #666666; /* Lighter gray on hover */
        color: #ffffff; /* White text */
      }    
    '';
  };
}
