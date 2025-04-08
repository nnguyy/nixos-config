# TODO:	change this location if not in ~ dir
FLAKE_PATH = ~/nixos-config

# default target 
# TODO: change this to whatever host
all: desktop

desktop:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#desktop

laptop:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#laptop

wsl:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#wsl

clean:
	nix-collect-garbage -d
