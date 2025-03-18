{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",1920x1080@180,0x0,1";

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,24"
      ];

      exec-once = [
        "kitty"
        "waybar"
        #"swww init && swww img ~/nixos-config/wallpapers/wallpaper.png"
        "google-chrome-stable"
      ];

      general = {
        gaps_in = 3;
        gaps_out = 3;
        border_size = 2;
        #"col.active_border" = "rgba(ffffffaa)";
        #"col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          #color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global,1,10,default"
          "border,1,5.39,easeOutQuint"
          "windows,1,4.79,easeOutQuint"
          "windowsIn,1,4.1,easeOutQuint,popin 87%"
          "windowsOut,1,1.49,linear,popin 87%"
          "fadeIn,1,1.73,almostLinear"
          "fadeOut,1,1.46,almostLinear"
          "fade,1,3.03,quick"
          "layers,1,3.81,easeOutQuint"
          "layersIn,1,4,easeOutQuint,fade"
          "layersOut,1,1.5,linear,fade"
          "fadeLayersIn,1,1.79,almostLinear"
          "fadeLayersOut,1,1.39,almostLinear"
          "workspaces,1,1.94,almostLinear,fade"
          "workspacesIn,1,1.21,almostLinear,fade"
          "workspacesOut,1,1.94,almostLinear,fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master.new_status = "master";

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = true;
      };

      gestures.workspace_swipe = true;

      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      "$mainMod" = "SUPER";

      bindm = [
        "Control_L, mouse:272, movewindow"
        "Control_L, mouse:273, resizewindow"
      ];

      bind = [
        "$mainMod,RETURN,exec,kitty"
        "$mainMod,W,killactive"
        "$mainMod,B,exit"
        "$mainMod,S,exec,lf"
        "$mainMod,Z,togglefloating"
        "$mainMod,A,exec,rofi -show drun -font 'Terminess Nerd Font 16'"
        "$mainMod,C,pseudo"
        "$mainMod,X,togglesplit"
        "$mainMod,f,fullscreen"
        "$mainMod,j,movefocus,l"
        "$mainMod,l,movefocus,r"
        "$mainMod,i,movefocus,u"
        "$mainMod,k,movefocus,d"
        "ALT,j,resizeactive,-50 0"
        "ALT,l,resizeactive,50 0"
        "ALT,i,resizeactive,0 -50"
        "ALT,k,resizeactive,0 50"
        "$mainMod ALT, j, movewindow, l"
        "$mainMod ALT, l, movewindow, r"
        "$mainMod ALT, i, movewindow, u"
        "$mainMod ALT, k, movewindow, d"
        "$mainMod,1,workspace,1"
        "$mainMod,2,workspace,2"
        "$mainMod,3,workspace,3"
        "$mainMod,4,workspace,4"
        "$mainMod,5,workspace,5"
        "$mainMod,6,workspace,6"
        "$mainMod,7,workspace,7"
        "$mainMod,8,workspace,8"
        "$mainMod,9,workspace,9"
        "$mainMod,0,workspace,10"
        "$mainMod SHIFT,1,movetoworkspace,1"
        "$mainMod SHIFT,2,movetoworkspace,2"
        "$mainMod SHIFT,3,movetoworkspace,3"
        "$mainMod SHIFT,4,movetoworkspace,4"
        "$mainMod SHIFT,5,movetoworkspace,5"
        "$mainMod SHIFT,6,movetoworkspace,6"
        "$mainMod SHIFT,7,movetoworkspace,7"
        "$mainMod SHIFT,8,movetoworkspace,8"
        "$mainMod SHIFT,9,movetoworkspace,9"
        "$mainMod SHIFT,0,movetoworkspace,10"
      ];

      bindel = [
        ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp,exec,brightnessctl s 10%+"
        ",XF86MonBrightnessDown,exec,brightnessctl s 10%-"
      ];

      bindl = [
        ",XF86AudioNext,exec,playerctl next"
        ",XF86AudioPause,exec,playerctl play-pause"
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",XF86AudioPrev,exec,playerctl previous"
      ];

      windowrule = [
        "opacity 0.9 0.8, ^(kitty)$"
      ];
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "opacity 0.9 0.8, class:^(vesktop)$"
        "opacity 0.9 0.8, class:^(Spotify)$"
      ];
    };
  };
}

