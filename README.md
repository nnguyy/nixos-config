## NixOS Configuration
This repository contains my NixOS system configuration and Home Manager user configuration

## Repository Structure
nixos                  
├── hosts                  
│   ├── default                  
│   └── laptop                  
└── modules                  
    ├── home-manager                  
    │   ├── files                  
    │   │   ├── hyprland                  
    │   │   ├── lf                  
    │   │   ├── nvim                  
    │   │   └── waybar                  
    │   └── nix-files                  
    ├── nixos                  
    └── wallpapers                  

## Setup Instructions
1. Boot a NixOS Live ISO
2. Follow NixOS Installation Guide
3. Clone this Repo
    git clone https://github.com/nnguyy/nixos-config.git
4. Edit flake.nix to set machine-specific values
5. Copy 
