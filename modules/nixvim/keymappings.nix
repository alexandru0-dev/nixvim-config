{ lib, helpers, ... }:
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps =
    let
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
    helpers.keymaps.mkKeymaps { options.silent = true; } (visual);
  # helpers.keymaps.mkKeymaps { options.silent = true; } (normal ++ visual ++ insert);
}
