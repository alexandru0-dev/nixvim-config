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

  globals = {
    # Disable useless providers
    loaded_ruby_provider = 0; # Ruby
    loaded_perl_provider = 0; # Perl
    loaded_python_provider = 0; # Python 2
  };
}
