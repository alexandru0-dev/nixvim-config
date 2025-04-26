{
  inputs,
  lib,
  self,
  pkgs,
  ...
}:
{
  imports = [
    # ./devshell.nix
    # ./git-hooks.nix
    ./nixvim.nix
    ./overlays.nix
    ./pkgs-by-name.nix
    # ./treefmt.nix
  ];

  debug = true;

  perSystem =
    {
      config,
      system,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = lib.attrValues self.overlays;
        config.allowUnfree = true;
      };

      packages.default = config.packages.alexvim;
    };
}
