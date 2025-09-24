{
  config,
  lib,
  pkgs,
  ...
}:
{
  # TODO: Consider upstreaming this module to nixvim
  options.plugins.live-rename = {
    enable = lib.mkEnableOption "live-rename" // {
      default = true;
    };

    package = lib.mkPackageOption pkgs.vimPlugins "live-rename" {
      default = "live-rename-nvim";
    };

    settings = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
      description = "Configuration for live-rename";
    };
  };

  config = lib.mkIf config.plugins.live-rename.enable {
    extraPlugins = [
      config.plugins.live-rename.package
    ];

    extraConfigLua = ''
      require('live-rename').setup(${lib.generators.toLua { } config.plugins.live-rename.settings})
    '';

    # TODO: Optional: Add keymaps for the plugin
    keymaps = [
      {
        mode = "n";
        key = "<leader>lR";
        action = "<cmd>lua require('live-rename').rename({ text = ' ', insert = true })<CR>";
        options = {
          desc = "rename";
        };
      }
    ];
  };
}
