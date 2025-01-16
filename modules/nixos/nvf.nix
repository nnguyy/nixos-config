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
                  template = "*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?";
                  target = "~/org/journal/%<%Y-%m>.org";
                };
                n = {
                  description = "Note";
                  template = "* %^{Note Title}\n  %U\n\n%?";
                  target = "~/org/notes.org";
                };
                t = {
                  description = "Todo";
                  template = "* TODO %^{Task Description}\n  SCHEDULED: %^t\n  %?";
                  target = "~/org/todo.org";
                };
                p = {
                  description = "Project";
                  subtemplates = {
                    m = {
                      description = "make";
                      template = "* %^{Project Name}\n %U\n\n* Tasks\n ** TODO %?";
                      target = "~/org/projects/%^{File Name |New Project}.org";
                    };
                    n = {
                      description = "note";
                      template = "%?";
                      target = "~/org/projects/%^{File name |New Project}.org";
                    };
                    t = {
                      description = "task";
                      template = "** TODO %?";
                      target = "~/org/projects/%^{File name |New Project}.org";
                    };
                  };
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
