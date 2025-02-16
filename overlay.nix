[
  (final: prev: {
    neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs (oldAttrs: {
      patches = oldAttrs.patches ++ [
        # Fix byte index encoding bounds.
        # - https://github.com/neovim/neovim/pull/30747
        # - https://github.com/nix-community/nixvim/issues/2390
        # ./patches/neovim/30747.patch
      ];
    });

    vimPlugins = prev.vimPlugins // {
      guess-indent-nvim = prev.vimPlugins.guess-indent-nvim.overrideAttrs (oldAttrs: {
        version = "2024-04-03";
        src = prev.fetchFromGitHub {
          owner = "nmac427";
          repo = "guess-indent.nvim";
          rev = "6cd61f7a600bb756e558627cd2e740302c58e32d";
          sha256 = "sha256-mzX9LgG2+9aj2lMPlSZh3zP3wphHQdecXe7RHP1baT0=";
        };
        patches = [
          ./patches/guess-indent.nvim/22.patch
        ];
      });
      blink-emoji-nvim = prev.vimUtils.buildVimPlugin {
        pname = "blink-emoji-nvim";
        version = "2025-01-04";
        src = prev.fetchFromGitHub {
          owner = "moyiz";
          repo = "blink-emoji-nvim";
          rev = "81e6c080d1e64c9ef548534c51147fd8063481c8";
          sha256 = "10lm90xa7w3ww94acivshnzkp4q2bfrq9zff2z5amrp3cxlga0rf";
        };
        meta.homepage = "https://github.com/fang2hou/blink-copilot/";
      };
    };
  })
]
