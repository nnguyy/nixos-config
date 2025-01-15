{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      statusline.lualine.enable = true;
      telescope.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;

      vim.languages = {
        enableLSP = true;
        enableTreesitter = true;

        nix.enable = true;
        ts.enable = true;
        rust.enable = true;
      };
    };
  };
}
