{
  config,
  ...
}:
{
  plugins.treesitter = {
    enable = true;
    settings.indent.enable = true;
    settings = {
      highlight = {
        additional_vim_regex_highlighting = true;
        enable = true;
        disable = # Lua
          ''
            function(lang, bufnr)
              return vim.api.nvim_buf_line_count(bufnr) > 10000
            end
          '';
      };
    };

    folding.enable = true;
    nixvimInjections = true;
  };

  plugins.treesitter-context = {
    enable = config.plugins.treesitter.enable && false;
    settings.mode = "topline";
    # settings.max_lines = 1;
  };

  plugins.treesitter-textobjects = {
    enable = config.plugins.treesitter.enable;
    settings = {
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ii" = "@conditional.inner";
          "ai" = "@conditional.outer";
          "il" = "@loop.inner";
          "al" = "@loop.outer";
          "at" = "@comment.outer";
        };
      };
      move = {
        enable = true;
        goto_next_start = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        goto_next_end = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        goto_previous_start = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        goto_previous_end = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };
      swap = {
        enable = true;
        swap_next = {
          "<leader>a" = "@parameters.inner";
        };
        swap_previous = {
          "<leader>A" = "@parameter.outer";
        };
      };
    };
  };
}
