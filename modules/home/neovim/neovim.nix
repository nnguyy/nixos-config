{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
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
}
