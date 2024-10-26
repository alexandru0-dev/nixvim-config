{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./keymaps.nix
    ./settings.nix
    ./cmp
    ./snippets
    ./lsp
    ./git
    ./ui
  ];

  performance.byteCompileLua.enable = true;
}
