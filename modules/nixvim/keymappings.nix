{ lib, helpers, ... }:
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps =
    let
      normal =
        lib.mapAttrsToList
          (
            key:
            { action, ... }@attrs:
            {
              mode = "n";
              inherit action key;
              options = attrs.options or { };
            }
          )
          ({
            "<Space>" = {
              action = "<NOP>";
            };
            "<leader>ut" = {
              action.__raw = ''
                function ()
                  -- vim.g.disable_autoformat = not vim.g.disable_autoformat
                  vim.cmd('FormatToggle!')
                  vim.notify(string.format("Buffer Autoformatting %s", bool2str(not vim.b[0].disable_autoformat), "info"))
                end'';
              options = {
                desc = "Buffer Autoformatting toggle";
              };
            };

            "<leader>uF" = {
              action.__raw = ''
                function ()
                  -- vim.g.disable_autoformat = not vim.g.disable_autoformat
                  vim.cmd('FormatToggle')
                  vim.notify(string.format("Global Autoformatting %s", bool2str(not vim.g.disable_autoformat), "info"))
                end'';
              options = {
                desc = "Global Autoformatting toggle";
              };
            };
          });
      visual =
        lib.mapAttrsToList
          (
            key:
            { action, ... }@attrs:
            {
              mode = "v";
              inherit action key;
              options = attrs.options or { };
            }
          )
          {
            # Better indenting
            "<S-Tab>" = {
              action = "<gv";
              options = {
                desc = "Unindent line";
              };
            };
            "<" = {
              action = "<gv";
              options = {
                desc = "Unindent line";
              };
            };
            "<Tab>" = {
              action = ">gv";
              options = {
                desc = "Indent line";
              };
            };
            ">" = {
              action = ">gv";
              options = {
                desc = "Indent line";
              };
            };
          };
    in
    helpers.keymaps.mkKeymaps { options.silent = true; } (normal ++ visual);
}
