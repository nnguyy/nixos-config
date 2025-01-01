{ inputs, userName, hostName, ... }: 

{
  imports = [
    ./btop.nix
    ./git.nix
    ./kitty.nix
    ./rofi.nix
    ./zsh.nix
  ];
}
