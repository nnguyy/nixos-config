{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        statusline.lualine.enable = true;
        telescope.enable = true;
        preventJunkFiles = true;

        autocomplete.nvim-cmp = {
          enable = true;
          sourcePlugins = ["orgmode-nvim"];
        };

        notes = { 
          orgmode = {
            enable = true; 
            setupOpts.org_agenda_files = [
              "~/org/*"
            ];
            setupOpts.org_default_notes_file = "~/org/notes.org";
            treesitter.enable = true;
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
