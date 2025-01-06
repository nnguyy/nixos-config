{ inputs, userName, hostName, ... }: 

{
  imports = [
    ./btop.nix
    ./git.nix
    ./kitty.nix
    ./rofi.nix
    ./zsh.nix
    ./swaync/swaync.nix
    ./neovim/neovim.nix
    ./lf/lf.nix
  ];
}
