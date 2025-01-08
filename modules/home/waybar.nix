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
      }

      #workspaces button {
          padding: 5px;
          color: #313244;
          margin-right: 5px;
      }

      #workspaces button.active {
          color: #a6adc8;
      }

      #workspaces button.focused {
          color: #a6adc8;
          background: #eba0ac;
          border-radius: 10px;
      }

      #workspaces button.urgent {
          color: #11111b;
          background: #a6e3a1;
          border-radius: 10px;
      }

      #workspaces button:hover {
          background: #11111b;
          color: #cdd6f4;
          border-radius: 10px;
      }
    '';
  };
}
