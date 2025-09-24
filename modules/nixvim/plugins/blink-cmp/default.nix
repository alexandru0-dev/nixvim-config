{ pkgs, ... }:
{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      appearance = {
        nerd_font_variant = "mono";
      };
      completion = {
        ghost_text.enabled = true;
        accept = {
          auto_brackets = {
            enabled = true;
          };
        };
        documentation = {
          auto_show = true;
        };
      };
      keymap = {
        "<C-b>" = [
          "scroll_documentation_up"
          "fallback"
        ];
        "<C-e>" = [
          "hide"
        ];
        "<C-f>" = [
          "scroll_documentation_down"
          "fallback"
        ];
        "<C-n>" = [
          "select_next"
          "fallback"
        ];
        "<C-p>" = [
          "select_prev"
          "fallback"
        ];
        "<C-space>" = [
          "show"
          "show_documentation"
          "hide_documentation"
        ];
        "<C-Enter>" = [
          "select_and_accept"
        ];
        "<Down>" = [
          "select_next"
          "fallback"
        ];
        "<S-Tab>" = [
          "snippet_backward"
          "fallback"
        ];
        "<Tab>" = [
          "snippet_forward"
          "fallback"
        ];
        "<Up>" = [
          "select_prev"
          "fallback"
        ];

      };
      signature = {
        enabled = true;
      };
      snippets.preset = "mini_snippets";
      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
          "dadbod"
          # "emoji"
        ];
        cmdline = [ ];
        providers = {
          # BUILT-IN SOURCES
          lsp.score_offset = 4;
          buffer = {
            score_offset = -7;
          };
          lsp = {
            fallbacks = [ ];
          };
          dadbod = {
            name = "Dadbod";
            module = "vim_dadbod_completion.blink";
          };
          # emoji = {
          #   module = "blink-emoji";
          #   name = "Emoji";
          #   score_offset = 15;
          #   opts = {
          #     insert = true;
          #   };
          # };
        };
      };
    };
  };
  plugins.blink-compat = {
    enable = true;

    settings = {
      # When wanted
      # debug = true;
      # NOTE: apparently just doesn't work without using lazy...
      # impersonate_nvim_cmp = true;
    };
  };

  # plugins.blink-emoji.enable = true;

  # extraPlugins = with pkgs.vimPlugins; [
  #   blink-emoji-nvim
  # ];

}
