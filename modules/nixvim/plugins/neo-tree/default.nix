{ config, lib, ... }:
{
  plugins.neo-tree = {
    enable = !(config.plugins.snacks.enable && lib.hasAttr "picker" config.plugins.snacks.settings);
    sources = [
      "filesystem"
      "buffers"
      "git_status"
      "document_symbols"
    ];
    addBlankLineAtTop = false;

    filesystem = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
      };
      filteredItems = {
        hideHidden = false;
        visible = true;
      };
    };

    defaultComponentConfigs = {
      indent = {
        withExpanders = true;
        expanderCollapsed = "";
        expanderExpanded = " ";
        expanderHighlight = "NeoTreeExpander";
      };

      gitStatus = {
        symbols = {
          added = " ";
          conflict = "󰩌 ";
          deleted = "󱂥";
          ignored = " ";
          modified = " ";
          renamed = "󰑕";
          staged = "󰩍";
          unstaged = "";
          untracked = "";
        };
      };
    };
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Open/Close Neotree";
      };
    }
  ];
}
