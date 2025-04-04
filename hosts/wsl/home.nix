{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.packages = with pkgs; [
    zsh starship fzf bat
  ];

  programs.git.enable = true;
  programs.neovim.enable = true;

  home.stateVersion = "24.11";
}

