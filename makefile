# TODO:	change this location if not in ~ dir
FLAKE_PATH = ~/old-config

# default target 
# TODO: change this to whatever host
all: desktop

desktop:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#desktop

laptop:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#laptop

clean:
	nix-collect-garbage -d
