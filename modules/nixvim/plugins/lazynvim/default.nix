{ pkgs, lib, ... }:
{
  plugins.lazy = {
    enable = false;
    plugins = [
      # showkeys
      # Load on a combination of conditions: specific filetypes or commands
      {
        pkg = pkgs.emptyFile;
        name = "nvzone/showkeys";
        dir = "${lib.mkForce ./default.nix}";
        dev = true;
        cmd = "ShowkeysToggle";

        # name = "w0rp/ale";
        # ft = [
        #   "sh"
        #   "zsh"
        #   "bash"
        #   "c"
        #   "cpp"
        #   "cmake"
        #   "html"
        #   "markdown"
        #   "racket"
        #   "vim"
        #   "tex"
        # ];
        # cmd = "ALEEnable";
      }
    ];

  };
}
