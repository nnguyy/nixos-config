{ pkgs, ... }:

{
  home.packages = with pkgs; [ rofi-wayland ];

  home.file = {
    ".config/rofi/config.rasi".text = ''
      * {
          background:     #000000BF;
          background-alt: #121212FF;
          foreground:     #FFFFFFFF;
          selected:       #DD9998FF;
          active:         #5D8787FF;
          urgent:         #444444FF;
      }
      /*****----- Configuration -----*****/
      configuration {
          modi:                       "drun,run,filebrowser,window";
          show-icons:                 false;
          display-drun:               "drun";
          display-run:                "run";
          display-filebrowser:        "files";
          display-window:             "windows";
          drun-display-format:        "{name} [<span weight='light' size='small' color='#444444'><i>({generic})</i></span>]";
          window-format:              "{w} · {c} · {t}";
      }

      * {
          border-colour:               var(selected);
          handle-colour:               var(selected);
          background-colour:           var(background);
          foreground-colour:           var(foreground);
          alternate-background:        var(background-alt);
          normal-background:           var(background);
          normal-foreground:           var(foreground);
          urgent-background:           var(urgent);
          urgent-foreground:           var(background);
          active-background:           var(active);
          active-foreground:           var(background);
          selected-normal-background:  var(selected);
          selected-normal-foreground:  var(background);
          selected-urgent-background:  var(active);
          selected-urgent-foreground:  var(background);
          selected-active-background:  var(urgent);
          selected-active-foreground:  var(background);
          alternate-normal-background: var(background);
          alternate-normal-foreground: var(foreground);
          alternate-urgent-background: var(urgent);
          alternate-urgent-foreground: var(background);
          alternate-active-background: var(active);
          alternate-active-foreground: var(background);
      }

      /*****----- Main Window -----*****/
      window {
          transparency:                "real";
          location:                    center;
          anchor:                      center;
          fullscreen:                  false;
          width:                       600px;
          border:                      3px solid;
          border-color:                @border-colour;
          background-color:            @background-colour;
      }

      /*****----- Main Box -----*****/
      mainbox {
          spacing:                     10px;
          padding:                     15px;
          background-color:            transparent;
          children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
      }

      /*****----- Inputbar -----*****/
      inputbar {
          spacing:                     10px;
          padding:                     10px 5px;
          background-color:            transparent;
          text-color:                  @foreground;
      }

      entry {
          placeholder:                 "search...";
          placeholder-color:           @urgent;
      }

      /*****----- Listview -----*****/
      listview {
          columns:                     1;
          lines:                       10;
          cycle:                       true;
          spacing:                     10px;
          background-color:            transparent;
          text-color:                  @foreground-colour;
      }

      /*****----- Elements -----*****/
      element {
          spacing:                     10px;
          background-color:            transparent;
          text-color:                  @foreground-colour;
      }

      element selected.normal {
          background-color:            var(selected-normal-background);
      }

      element selected.urgent {
          background-color:            var(selected-urgent-background);
      }

      /*****----- Mode Switcher -----*****/
      mode-switcher {
          spacing:                     0px;
          background-color:            transparent;
          text-color:                  @foreground-colour;
      }

      button {
          background-color:            transparent;
          text-color:                  inherit;
      }

      button selected {
          background-color:            transparent;
          text-color:                  @active;
      }
      '';
    };
}
