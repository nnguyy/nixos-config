{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Hardware
  hardware = {
    nvidia = {
      modesetting.enable = true;
      open = true;
    };
    graphics.enable = true;
    bluetooth.enable = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  # Security
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # User
  users.users.nnguy = {
    isNormalUser = true;
    description = "noah nguyen";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
  programs.zsh.enable = true;
}
