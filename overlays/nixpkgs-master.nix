{ flake }:
_final: super:
let
  nixpkgs-master-packages = import flake.inputs.nixpkgs-master {
    inherit (super.stdenv) system;
    config = {
      allowUnfree = true;
      allowAliases = false;
    };
  };
  inherit (nixpkgs-master-packages) luaPackages vimPlugins;
in
{

  vimPlugins = vimPlugins // {
    #
    # Specific package overlays need to go in here to not get ignored
    #
    guess-indent-nvim = vimPlugins.guess-indent-nvim.overrideAttrs (oldAttrs: {
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
  luaPackages = luaPackages // {
    #
    # Specific package overlays need to go in here to not get ignored
    #
  };
}
