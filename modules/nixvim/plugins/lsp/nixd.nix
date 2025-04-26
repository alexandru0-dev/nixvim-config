{
  lib,
  pkgs,
  self,
  ...
}:
let
  flake = ''(builtins.getFlake (builtins.toString (builtins.findFile builtins.nixPath "self")))'';
  system = ''''${builtins.currentSystem}'';
  # flake = ''builtins.getFlake (builtins.toString (builtins.findFile builtins.nixPath "self"))'';
  hostname = ''''${(${flake}.inputs.nixpkgs.lib.trim (builtins.readFile "/etc/hostname"))}'';
in
{
  plugins.lsp.servers.nixd = {
    enable = true;
    settings =
      # nixpkgs.expr = ''(builtins.getFlake "/etc/nixos").inputs.nixpkgs {}'';

      {
        nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
        formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
        options = rec {
          # Completitions for nixos and home manager options
          nixos.expr = ''${flake}.nixosConfigurations.${hostname}.options'';
          home_manager.expr = ''${nixos.expr}.home-manager.users.type.getSubOptions [ ]'';
          nixvim.expr = ''
            (
              builtins.fromJSON (
                builtins.readFile "''${
                  (builtins.getFlake "${self}")
                  .inputs.nixvim.outputs.packages.''${builtins.currentSystem}.options-json
                }/share/doc/nixos/options.json"
              )
            )'';

          # For flake-parts options.
          # Firstly read the docs here to enable "debugging", exposing declarations for nixd.
          # https://flake.parts/debug
          flake-parts.expr = ''(builtins.getFlake "${self}").debug.options'';
          # For a `perSystem` flake-parts option:
          flake-parts2.expr = ''(builtins.getFlake "${self}").currentSystem.options'';
        };
      };
  };
}
