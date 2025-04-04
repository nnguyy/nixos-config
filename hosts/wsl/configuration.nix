{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  environment.systemPackages = with pkgs; [
  	neovim
	git
	wget
	curl
	htop
	ripgrep
	fd
	unzip
	tree
	neofetch
	tmux
	bash-completion
	yazi
	emacs
	gh
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
