{
  description = "My personal nixvim configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-utils,
      ...
    }@inputs:
    let
      config = import ./config; # import the module directly
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixvimLib = nixvim.lib.${system};
        overlays = import ./overlay.nix;
        pkgs = import nixpkgs { inherit system overlays; };
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = config;
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in
      {
        formatter = pkgs.nixfmt-rfc-style;

        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };
      }
    );
}
