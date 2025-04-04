{ inputs, userName, ... }: 

{
  imports = [
    ./hyprland.nix
    ./btop.nix
    ./git.nix
    ./kitty.nix
    ./rofi.nix
    ./zsh.nix
    ./waybar.nix
    ./yazi.nix
    ./ghostty.nix
    ./tmux.nix
    ./lf/lf.nix
    ./discord/discord.nix
    ./syncthing.nix
    ./emacs/emacs.nix
    ./fd.nix
    ./pandoc.nix
    ./zathura.nix
    ./direnv.nix
    ./neovim/neovim.nix
    ./ollama.nix
  ];
}
