{
  config,
  self,
  system,
  pkgs,
  ...
}:
{
  imports = [
    ./picker.nix
  ];

  plugins = {
    snacks = {
      enable = true;
      package = self.packages.${system}.snacks-nvim;

      settings = {
        image.enabled = true;
        indent.enabled = true;
        scroll.enabled = true;
        statuscolumn = {
          enabled = true;

          folds = {
            open = true;
            git_hl = config.plugins.gitsigns.enable;
          };
        };
      };
    };
  };
}
