{
  lib,
  pkgs,
  self,
  ...
}:
let
  flake = ''(builtins.getFlake (builtins.toString (builtins.findFile builtins.nixPath "self")))'';
  hostname = ''''${(${flake}.inputs.nixpkgs.lib.trim (builtins.readFile "/etc/hostname"))}'';
in
{
  plugins.lsp.servers.nixd = {
    enable = true;
    settings = {
      nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
      formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
      options = rec {
        # Completitions for nixos and home manager options
        nixos.expr = ''${flake}.nixosConfigurations.${hostname}.options'';
        home_manager.expr = ''${nixos.expr}.home-manager.users.type.getSubOptions [ ]'';
        # TODO: filter everything not doc releated
        nixvim.expr = ''((builtins.getFlake "${self}").inputs.nixvim.lib.evalNixvim { system = builtins.currentSystem; }).options'';

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
