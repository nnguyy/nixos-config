 # configuration.nix

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/system.nix
      ../../modules/nixos/networking.nix
      ../../modules/nixos/locales.nix
      ../../modules/nixos/desktop.nix
      ../../modules/nixos/services.nix
      ../../modules/nixos/packages.nix
      ../../modules/nixos/home-manager.nix
      inputs.home-manager.nixosModules.default
    ];

  # Nerd Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.terminess-ttf
  ];

  # Cursor 
  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };


  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # XDG
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable Sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

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
  system.stateVersion = "24.11"; # Did you read the comment?
}
