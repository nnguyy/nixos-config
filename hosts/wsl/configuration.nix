{ config, pkgs, inputs, userName, lib, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl  # Import WSL module
    ../../modules/nixos
    inputs.home-manager.nixosModules.default
  ];

  # Define the platform
  nixpkgs.hostPlatform = "x86_64-linux";

  # Enable WSL support
  wsl.enable = true;
  wsl.defaultUser = userName;

  # Explicitly disable bootloaders to avoid conflicts
  boot.loader.grub.enable = lib.mkForce false;
  boot.loader.systemd-boot.enable = lib.mkForce false;

  # Force the hostname to prevent conflicts
  networking.hostName = lib.mkForce "wsl";

  # System-wide packages
  environment.systemPackages = with pkgs; [
    vim
    gcc
    wget
    shellcheck
    live-server
    cmake
    libtool
    git
    unzip
    fzf
  ];

  # WSL doesn't support full systemd, so we remove system services like Docker
  virtualisation.docker.enable = false;

  # System version
  system.stateVersion = "24.11";
}

