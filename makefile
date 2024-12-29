.PHONY: update
update:
	sudo nixos-rebuid switch --flake ~/nixos-config/#default

.PHONY: clean
clean:
	nix-collect-garbage -d
