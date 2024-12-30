{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    git
    wget
    sl
    waybar
    bibata-cursors
    # inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];
}
