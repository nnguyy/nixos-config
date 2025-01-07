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
    ./waybar.nix
    ./lf/lf.nix
    ./discord/discord.nix
  ];
}
