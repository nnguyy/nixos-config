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
          sources = {
            orgmode = "[Orgmode]";
          };
        };

        notes = { 
          orgmode = {
            enable = true; 
            setupOpts = {
              org_agenda_files = ["~/org/*"];
              org_default_notes_file = "~/org/notes.org";
              org_capture_templates = {
                j = {
                  description = "Journal";
                  template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?";
                  target = "~/org/journal/%<%Y-%m}.org";
                };
              };
            };
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
