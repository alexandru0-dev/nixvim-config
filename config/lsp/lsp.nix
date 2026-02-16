{ config, ... }:
{
  plugins = {
    vim-dadbod.enable = true;
    vim-dadbod-ui.enable = config.plugins.vim-dadbod.enable;
    vim-dadbod-completion.enable = config.plugins.vim-dadbod-ui.enable;
  };
}
