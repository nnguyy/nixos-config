{ pkgs, config, lib, ... }:

{
  services.syncthing = {
    enable = true;
    user = "nnguy";
    dataDir = "/home/nnguy/";
  };
}
