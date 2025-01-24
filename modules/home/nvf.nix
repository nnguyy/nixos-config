{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings.vim = {
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      useSystemClipboard = true;

      languages = {
        enableLSP = true;
        enableTreesitter = true;

        nix.enable = true;
        ts.enable = true;
        rust.enable = true;
      };
    };
  };
}
