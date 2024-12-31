{ config, pkgs, inputs, ... }:

{
  home.username = "nnguy";
  home.homeDirectory = "/home/nnguy";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ../../modules/home-manager/nix-files/git.nix
    ../../modules/home-manager/nix-files/kitty.nix
    ../../modules/home-manager/nix-files/lf.nix
    ../../modules/home-manager/nix-files/neovim.nix
    ../../modules/home-manager/nix-files/zsh.nix
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
    wl-clipboard
    swww
    dunst
    inputs.hyprland-qtutils.packages."${pkgs.system}".default
  ];

  nixpkgs.config.allowUnfree = true;

  home.file = {
    ".config/hypr/hyprland.conf".source = ../../modules/home-manager/files/hyprland/hyprland.conf;
    ".config/waybar/config.jsonc".source = ../../modules/home-manager/files/waybar/config.jsonc;
    ".config/lf/icons".source = ../../modules/home-manager/files/lf/icons;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
