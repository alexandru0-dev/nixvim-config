{ config, ... }:
{
  imports = [
    # ./ccls.nix
    # ./clangd.nix
    # ./harper-ls.nix
    # ./helm-ls.nix
    # ./nil-ls.nix
    ./nixd.nix
    ./python.nix
    # ./rust-analyzer.nix
    # ./typos-lsp.nix
  ];

  plugins = {
    lsp-format.enable = !config.plugins.conform-nvim.enable && config.plugins.lsp.enable;
    lsp-lines.enable = config.plugins.lsp.enable;
    lsp-signature.enable = config.plugins.lsp.enable;

    lsp = {
      enable = true;
      # inlayHints = true;
    };
  };
}
