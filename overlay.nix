[
  (final: prev: {
    neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs (oldAttrs: {
      patches = oldAttrs.patches ++ [
        # Fix byte index encoding bounds.
        # - https://github.com/neovim/neovim/pull/30747
        # - https://github.com/nix-community/nixvim/issues/2390
        ./patches/30747.patch
      ];
    });
  })
]
