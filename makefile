FLAKE_PATH = ~/nixos-config

# default target
all: desktop

default:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#default

desktop:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#desktop

laptop:
	sudo nixos-rebuild switch --flake ${FLAKE_PATH}#laptop

clean:
	nix-collect-garbage -d
