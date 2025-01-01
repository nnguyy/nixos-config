{ inputs, userName, hostName, ... }: 

{
  imports = [
    ./btop.nix
    ./git.nix
    ./kitty.nix
    ./neovim.nix
    ./rofi.nix
    ./zsh.nix
  ];
}
