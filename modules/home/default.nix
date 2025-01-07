{ inputs, userName, ... }: 

{
  imports = [
    ./hyprland.nix
    ./btop.nix
    ./git.nix
    ./kitty.nix
    ./rofi.nix
    ./zsh.nix
    ./neovim/neovim.nix
    ./lf/lf.nix
    ./waybar.nix
  ];
}
