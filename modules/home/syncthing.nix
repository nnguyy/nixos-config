{ pkgs, config, lib, ... }:

{
  services.syncthing = {
    enable = true;
    group = "users";
    user = "nnguy";
    dataDir = "/home/nnguy/documents";
    configDir = "/home/nnguy/.config/synthing";

    settings.folders = {
      "OrgNotes" = {
        path = "";
        devices = [ ];
        ignorePerms = false;
      };
    };
  };
}
