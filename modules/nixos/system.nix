{ config, pkgs, userName, ... }:

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
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
  programs.zsh.enable = true;
}
