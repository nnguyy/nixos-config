{ config, pkgs, inputs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  home.stateVersion = "24.11";

  imports = [
    ../../modules/home
  ];

  home.packages = with pkgs; [
    gh
    gnumake
    ripgrep
    fd
    wl-clipboard  # WSLg clipboard support
    fzf
    bat
    htop
    zoxide
  ];

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  programs.home-manager.enable = true;
}

