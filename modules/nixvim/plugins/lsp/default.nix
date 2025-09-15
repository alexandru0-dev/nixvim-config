{ config, ... }:
{
  imports = [
    # ./ccls.nix
    # ./clangd.nix
    ./harper-ls.nix
    # ./helm-ls.nix
    # ./nil-ls.nix
    ./qmllsp.nix
    ./nixd.nix
    ./python.nix
    ./csharp.nix
    # ./rust-analyzer.nix
    # ./typos-lsp.nix
  ];

  plugins = {
    lsp-format.enable = !config.plugins.conform-nvim.enable && config.plugins.lsp.enable;
    lsp-lines.enable = config.plugins.lsp.enable;
    lsp-signature.enable = config.plugins.lsp.enable;
    # keymaps = {
    #   silent = true;
    #   lspBuf = {
    #     gd = {
    #       action = "definition";
    #       desc = "Goto Definition";
    #     };
    #     gr = {
    #       action = "references";
    #       desc = "Goto References";
    #     };
    #     gD = {
    #       action = "declaration";
    #       desc = "Goto Declaration";
    #     };
    #     gI = {
    #       action = "implementation";
    #       desc = "Goto Implementation";
    #     };
    #     gT = {
    #       action = "type_definition";
    #       desc = "Type Definition";
    #     };
    #     K = {
    #       action = "hover";
    #       desc = "Hover";
    #     };
    #     "<leader>cw" = {
    #       action = "workspace_symbol";
    #       desc = "Workspace Symbol";
    #     };
    #     "<leader>cr" = {
    #       action = "rename";
    #       desc = "Rename";
    #     };
    #   };
    #   diagnostic = {
    #     "<leader>cd" = {
    #       action = "open_float";
    #       desc = "Line Diagnostics";
    #     };
    #     "[d" = {
    #       action = "goto_next";
    #       desc = "Next Diagnostic";
    #     };
    #     "]d" = {
    #       action = "goto_prev";
    #       desc = "Previous Diagnostic";
    #     };
    #   };
    # };

    lsp = {
      enable = true;
      # inlayHints = true;
    };
  };
}
