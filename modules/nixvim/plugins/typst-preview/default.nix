{ config, ... }:
{
  plugins.typst-preview.enable = config.plugins.lsp.servers.tinymist.enable;
}
