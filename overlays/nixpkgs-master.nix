{ flake }:
_final: super:
let
  vimPlugins-master = flake.inputs.nixpkgs-master.legacyPackages.${super.stdenv.system}.vimPlugins;
in
{

  vimPlugins = vimPlugins-master // {
    guess-indent-nvim = vimPlugins-master.guess-indent-nvim.overrideAttrs (oldAttrs: {
      version = "2024-04-03";
      src = super.fetchFromGitHub {
        owner = "nmac427";
        repo = "guess-indent.nvim";
        rev = "6cd61f7a600bb756e558627cd2e740302c58e32d";
        sha256 = "sha256-mzX9LgG2+9aj2lMPlSZh3zP3wphHQdecXe7RHP1baT0=";
      };
      patches = [
        ../patches/guess-indent.nvim/22.patch
      ];
    });

    blink-cmp = flake.inputs.blink-cmp.packages.${super.stdenv.system}.default;
  };
  inherit (flake.inputs.nixpkgs-master.legacyPackages.${super.stdenv.system})
    luaPackages
    ;
}
