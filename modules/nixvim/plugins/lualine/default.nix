{ config, lib, ... }:
{
  plugins.lualine = {
    enable = true;

    lazyLoad.settings.event = [
      "VimEnter"
      "BufReadPost"
      "BufNewFile"
    ];

    settings.sections = {

      lualine_c = [
        {
          __unkeyed-1.__raw = ''
            function()
              local reg = vim.fn.reg_recording()
              if reg ~= "" then
                return "Recording @" .. reg
              else
                return ""
              end
            end
          '';
          cond.__raw = ''
            function()
              local reg = vim.fn.reg_recording()
              if reg ~= "" then
                return true
              else
                return false
              end
            end
          '';
          color = {
            fg = "#ff9e64";
          };
        }
      ];
    };
    settings.options = {
      refresh.statusline = 100;
    };
  };
}
