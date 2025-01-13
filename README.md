# NixOS Configuration
This repository contains my NixOS system configuration and Home Manager user configuration

## Preview
![showcase](https://github.com/user-attachments/assets/7bbbd8a3-ffa8-4c40-b2d5-472c851dfaf4)

## Repository Structure          
![tree](https://github.com/user-attachments/assets/9f8c8a52-ada5-44ef-bd72-3eba3772ece7)
![20250113_09h14m09s_grim](https://github.com/user-attachments/assets/235ea26b-6a2c-4cc0-8f76-fb625f482fd5)
![20250110_10h44m26s_grim](https://github.com/user-attachments/assets/4d824711-0249-47b1-99ac-6729051fec88)
![20250110_10h41m51s_grim](https://github.com/user-attachments/assets/629e7681-59aa-4526-951a-175490ff76ca)

## Setup Instructions
1. Boot a NixOS Live ISO
   - https://nixos.org/download/
3. Follow NixOS Installation Guide
   - https://nixos.org/manual/nixos/stable/#sec-installation
4. Clone this Repo
   - git clone https://github.com/nnguyy/nixos-config.git
5. Edit flake.nix to set machine-specific values
   - change userName (nnguy) to for host 
6. Copy YOUR auto genereated hardware configuration to nixos-config/hosts/default
   - cp /etc/nixos/hardware-configuration.nix ~/nixos-config/hosts/default
8. Edit makefile
   - change FLAKE_PATH to path of nixos-config
   - select default target
9. Run sudo nixos-rebuild switch --flake (flake path)#(host)
   - example: sudo nixos-rebuild switch --flake ~/nixos-config/#desktop
   - after install running 'make' should run this command 
