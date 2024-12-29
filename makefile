.PHONY: update
update:
	sudo nixos-rebuild switch --flake ~/nixos-config/#default

.PHONY: clean
clean:
	nix-collect-garbage -d
