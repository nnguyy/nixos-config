{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        preventJunkFiles = true;

        notes = { 
          orgmode = {
            enable = true; 
            setupOpts.org_agenda_files = "
              ~/org/*
              ";
            setupOpts.org_default_notes_file = "
              ~/org/notes.org
              ";
          };
        };
        


        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
        };
      };
    };
  };
}
