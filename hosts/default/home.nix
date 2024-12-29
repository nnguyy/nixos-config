{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nnguy";
  home.homeDirectory = "/home/nnguy";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    gh
    gnumake
    google-chrome
    spotify

    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    neofetch

    wofi
    wl-clipboard
    kitty
    swww
    dunst
    inputs.hyprland-qtutils.packages."${pkgs.system}".default

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # lf config
  programs.lf = {
    enable = true;

    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        mkdir $DIR
      }}
      '';
    };

    keybindings = {
      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";

      do = "dragon-out";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig = 
    let
      previewer = 
        pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5

        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
          ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
          exit 1
        fi

          ${pkgs.pistol}/bin/pistol "$file"
        '';
        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
    in
    ''
      set cleaner ${cleaner}/bin/clean/sh
      set previewer ${previewer}/bin/pv.sh
    '';
  };

  # git config
  programs.git = {
    enable = true;
    userName = "nnguyy";
    userEmail = "nnoahnguyenn@gmail.com";
  };

  # neovim config
  programs.neovim = {
    enable = true;

    extraLuaConfig = ''
      ${builtins.readFile ../../modules/home-manager/nvim/options.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      nvim-lspconfig

      gruvbox-nvim

      nvim-cmp

      telescope-nvim

      telescope-fzf-native-nvim

      cmp-nvim-lsp

      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
      ]))
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprland.conf".source = ../../modules/home-manager/hyprland/hyprland.conf;
    ".config/waybar/config.jsonc".source = ../../modules/home-manager/waybar/config.jsonc;
    # ".config/alacritty/alacritty.toml".source = ../../modules/home-manager/alacritty/alcritty.toml;
    ".config/lf/icons".source = ../../modules/home-manager/lf/icons;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nnguy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
