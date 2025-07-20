{
  pkgs,
  self,
  lib,
  config,
  ...
}:
{

  plugins = {
    vim-dadbod.enable = true;
    vim-dadbod-ui.enable = config.plugins.vim-dadbod.enable;
    vim-dadbod-completion.enable = config.plugins.vim-dadbod-ui.enable;

    # helm = {enable = true;};
    lsp = {
      enable = true;
      servers = {
        clangd = {
          enable = true;
        };
        html = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        terraformls = {
          enable = true;
        };
        ts_ls = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        # rust_analyzer = {
        #   enable = true;
        #   autostart = true;
        #   installRustc = false;
        #   installCargo = false;
        # };
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
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

    };
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
