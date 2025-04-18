{ pkgs, lib, ... }:
{
  clipboard = {
    # Use system clipboard
    register = "unnamedplus";

    providers = {
      wl-copy = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        enable = true;
        package = pkgs.wl-clipboard-rs;
      };
    };
  };
}
