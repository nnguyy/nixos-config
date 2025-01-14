# NixOS Configuration
This repository contains my NixOS system configuration and Home Manager user configuration

## Preview
![20250113_09h14m09s_grim](https://github.com/user-attachments/assets/235ea26b-6a2c-4cc0-8f76-fb625f482fd5)
![20250110_10h44m26s_grim](https://github.com/user-attachments/assets/4d824711-0249-47b1-99ac-6729051fec88)
![20250110_10h41m51s_grim](https://github.com/user-attachments/assets/629e7681-59aa-4526-951a-175490ff76ca)

## Repository Structure          
![treestruc](https://github.com/user-attachments/assets/8d4690d9-d7f3-4d1d-884a-104a3d392306)


## Setup Instructions
1. Boot a NixOS Live ISO
   - https://nixos.org/download/
2. Follow NixOS Installation Guide
   - https://nixos.org/manual/nixos/stable/#sec-installation
3. Clone this Repo
   - nix --extra-experimental-features "nix-command flakes" run nixpkgs#git -- clone https://github.com/nnguyy/nixos-config
4. Edit flake.nix to set machine-specific values
   - change userName (nnguy)
5. Copy Hardware Configuration
   - cp /etc/nixos/hardware-configuration.nix ~/nixos-config/hosts/laptop
6. Run sudo nixos-rebuild switch --flake (flake path)#(host)
   - example: sudo nixos-rebuild switch --flake ~/nixos-config/#laptop
## Optional 
1. Edit makefile
   - change FLAKE_PATH to path of nixos-config
   - select default target
