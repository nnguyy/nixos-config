{ config, pkgs, inputs, ... }:

{
  home.username = "nnguy";
  home.homeDirectory = "/home/nnguy";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ../../modules/home
  ];

  home.packages = with pkgs; [
    gh
    gnumake
    google-chrome
    spotify
    neofetch

    grim
    pavucontrol
    ripgrep
    wl-clipboard
    swww
    dunst
    inputs.hyprland-qtutils.packages."${pkgs.system}".default
  ];

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

#  home.pointerCursor = {
#    gtk.enable = true;
#    package = pkgs.bibata-cursors;
#    name = "Bibata-Modern-Classic";
#    size = 24;
#  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
