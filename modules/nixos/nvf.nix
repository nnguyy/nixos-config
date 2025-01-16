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
              mappings = {
                org = {
                  org_global_cycle = "<A-TAB>";
                };
              };
              org_capture_templates = {
                j = {
                  description = "Journal";
                  template = [
                    "%?"
                    ];
                  target = "~/org/journal/%<%Y-%m>.org";
                  datetree = {
                    tree_type = "custom";
                    tree = [ 
                      {
                        format = "%B %Y Journal";
                        pattern = "^%a+ %d%d%d%d Journal$";
                        order = [1];
                      }
                      {
                        format = "%Y-%m-%d %A";
                        pattern = "^(%d%d%d%d%-%d%d%-%d%d) %a+$";
                        order = [1];
                      }
                    ];
                  };
                };
                n = {
                  description = "Note";
                  template = "\n* %^{Note Title}\n  %U\n%?";
                  target = "~/org/notes.org";
                };
                t = {
                  description = "Todo";
                  template = "* TODO %^{Task Description}\n  SCHEDULED: %^t\n%?";
                  target = "~/org/todo.org";
                };
                p = {
                  description = "Project";
                  subtemplates = {
                    m = {
                      description = "make";
                      template = "*** %^{Project Name}\n**** %U\n\n%?";
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
