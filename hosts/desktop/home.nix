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

    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    neofetch

    wofi
    grim
    ripgrep
    wl-clipboard
    swww
    dunst
    inputs.hyprland-qtutils.packages."${pkgs.system}".default
  ];

  nixpkgs.config.allowUnfree = true;

  home.file = {
    ".config/hypr/hyprland.conf".source = ../../modules/home/hyprland/hyprland.conf;
    ".config/lf/icons".source = ../../modules/home/lf/icons;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
