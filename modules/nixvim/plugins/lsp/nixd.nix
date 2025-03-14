{
  lib,
  pkgs,
  self,
  # system,
  ...
}:
{
  plugins.lsp.servers.nixd = {
    enable = true;
    settings =
      # nixpkgs.expr = ''(builtins.getFlake "/etc/nixos").inputs.nixpkgs {}'';

      let
        flake = ''(builtins.getFlake "${self}")'';
        system = ''''${builtins.currentSystem}'';
      in
      {
        nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
        formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
        options = {
          #   let
          #     flake = ''(builtins.getFlake "/etc/nixos")'';
          #     # flake = ''builtins.getFlake "''${(builtins.findFile builtins.nixPath "self")}"'';
          #     hostname = ''''${(${flake}.inputs.nixpkgs.lib.trim (builtins.readFile "/etc/hostname"))}'';
          #   in
          #   rec {
          #     # Completitions for nixos and home manager options
          #     nixos.expr = ''${flake}.nixosConfigurations.${hostname}.options'';
          #
          #     home_manager.expr = ''${nixos.expr}.home-manager.users.type.getSubOptions [ ]'';
          #
          nixvim.expr = ''${flake}.inputs.nixvim.outputs.packages.''${builtins.currentSystem}.default.options'';
          # nixvim.expr = ''${flake}.packages.${system}.nvim.options'';
        };
      };
  };
}
