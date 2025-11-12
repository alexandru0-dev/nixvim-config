{pkgs, ...}:
{
  plugins.lazy = {
    enable = true;
    plugins = with pkgs.vimPlugins [
    showkeys

    ];

  };
  # plugins.lazy
}
