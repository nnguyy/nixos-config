# TODO:	change this location if not in ~ dir
FLAKE_PATH = ~/nixos-config

# default target 
# TODO: change this to default
all: desktop

default:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#default

desktop:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#desktop

laptop:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#laptop

clean:
	nix-collect-garbage -d
