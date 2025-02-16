{
  plugins = {
    indent-blankline = {
      enable = true;
      settings = {
        exclude = {
          buftypes = [
            "terminal"
            "quickfix"
          ];
          filetypes = [
            ""
            "checkhealth"
            "help"
            "lspinfo"
            "TelescopePrompt"
            "TelescopeResults"
            "dashboard"
            # "yaml"
          ];
        };
        indent = {
          char = "│";
        };
        scope = {
          show_end = false;
          show_exact_scope = true;
          show_start = false;
        };
      };
    };

    guess-indent.enable = true;
    guess-indent.settings = {
      auto_cmd = true;
      filetype_exclude = [
        "help"
        "nofile"
        "terminal"
        "prompt"
      ];
      on_space_options = {
        expandtab = true;
        shiftwidth = "detected";
        softtabstop = "detected";
        tabstop = "detected";
      };
      on_tab_options = {
        expandtab = false;
      };
      override_editorconfig = true;
    };
  };
}
