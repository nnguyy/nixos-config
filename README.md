# NixOS Configuration
This repository contains my NixOS system configuration and Home Manager user configuration

## Preview
![showcase](https://github.com/user-attachments/assets/7bbbd8a3-ffa8-4c40-b2d5-472c851dfaf4)

## Repository Structure          
![tree](https://github.com/user-attachments/assets/9f8c8a52-ada5-44ef-bd72-3eba3772ece7)

## Setup Instructions (WORK IN PROGRESS!)
1. Boot a NixOS Live ISO
   - https://nixos.org/download/
3. Follow NixOS Installation Guide
   - https://nixos.org/manual/nixos/stable/index.html
4. Clone this Repo
   - git clone https://github.com/nnguyy/nixos-config.git
5. Edit flake.nix to set machine-specific values
   - change userName and hostName
7. Edit makefile
   - change FLAKE_PATH to path of nixos-config
   - select machine host
8. Run make command in terminal
