{ config, lib, ... }:
{
  imports = [
    ./clangd.nix
    ./harper-ls.nix
    ./qmllsp.nix
    ./nixd.nix
    ./python.nix
    ./csharp.nix
  ];

  # Global LSP settings
  plugins.lsp = {
    enable = true;
    inlayHints = true;
  };

  lsp = {
    servers = {
      "*" = {
        config = {
          capabilities = {
            textDocument = {
              semanticTokens = {
                multilineTokenSupport = true;
              };
            };
          };
          root_markers = [
            ".git"
          ];
        };
      };

      # Basic servers enabled here
      html.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      jsonls.enable = true;
      ts_ls.enable = true;
      terraformls.enable = true;

      yamlls = {
        enable = true;
        config.settings = {
          yaml = {
            schemas = {
              kubernetes = "'*.yaml";
              "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
              "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
              "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
              "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
              "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
              "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
              "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
              "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                "*docker-compose*.{yml,yaml}";
              "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" =
                "*flow*.{yml,yaml}";
            };
          };
        };
      };
    };
  };

  # Modern keybindings using LspAttach event
  keymapsOnEvents.LspAttach = [
    {
      mode = "n";
      key = "gd";
      action = lib.nixvim.mkRaw "vim.lsp.buf.definition";
      options.desc = "Goto Definition";
    }
    {
      mode = "n";
      key = "gr";
      action = lib.nixvim.mkRaw "vim.lsp.buf.references";
      options.desc = "Goto References";
    }
    {
      mode = "n";
      key = "gD";
      action = lib.nixvim.mkRaw "vim.lsp.buf.declaration";
      options.desc = "Goto Declaration";
    }
    {
      mode = "n";
      key = "gI";
      action = lib.nixvim.mkRaw "vim.lsp.buf.implementation";
      options.desc = "Goto Implementation";
    }
    {
      mode = "n";
      key = "gT";
      action = lib.nixvim.mkRaw "vim.lsp.buf.type_definition";
      options.desc = "Type Definition";
    }
    {
      mode = "n";
      key = "K";
      action = lib.nixvim.mkRaw "vim.lsp.buf.hover";
      options.desc = "Hover";
    }
    {
      mode = "n";
      key = "<leader>cw";
      action = lib.nixvim.mkRaw "vim.lsp.buf.workspace_symbol";
      options.desc = "Workspace Symbol";
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = lib.nixvim.mkRaw "vim.lsp.buf.rename";
      options.desc = "Rename";
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = lib.nixvim.mkRaw "vim.lsp.buf.code_action";
      options.desc = "Code Action";
    }
    {
      mode = "n";
      key = "<leader>cd";
      action = lib.nixvim.mkRaw "vim.diagnostic.open_float";
      options.desc = "Line Diagnostics";
    }
    {
      mode = "n";
      key = "[d";
      action = lib.nixvim.mkRaw "vim.diagnostic.goto_prev";
      options.desc = "Previous Diagnostic";
    }
    {
      mode = "n";
      key = "]d";
      action = lib.nixvim.mkRaw "vim.diagnostic.goto_next";
      options.desc = "Next Diagnostic";
    }
  ];

  plugins = {
    lsp-format.enable = !config.plugins.conform-nvim.enable;
    lsp-signature.enable = true;

    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>c";
        group = "Code";
        icon = " ";
        mode = "n";
      }
    ];
  };

  # extraConfigLua = ''
  #   local _border = "rounded"
  #
  #   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  #     vim.lsp.handlers.hover, {
  #       border = _border
  #     }
  #   )
  #
  #   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  #     vim.lsp.handlers.signature_help, {
  #       border = _border
  #     }
  #   )
  #
  #   vim.diagnostic.config{
  #     float={border=_border}
  #   };
  #
  #   require('lspconfig.ui.windows').default_options = {
  #     border = _border
  #   }
  # '';
}
