{ pkgs, ... }:
let
  version = "9b5136bd9539805ba16ad0e92f3a021224c182d8"; # 2.0.1
  # version = "5fb2c961da9d0e282e6701f6fd287846d34b3b81";
  git-worktree-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "git-worktree.nvim";
    inherit version;
    src = pkgs.fetchFromGitHub{
      owner = "polarmutex";
      # owner = "alexandru0-dev";
      repo = "git-worktree.nvim";
      rev = version;
      # rev = "5fb2c961da9d0e282e6701f6fd287846d34b3b81";
      sha256 = "sha256-+YzOh+nGZji1pA5J6BI2AoCtNsyW0V50Wc/DYj7XVDU=";
      # sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      # sha256 = "sha256-kM/v6JkIvN6EYea8ExAxowVgSY8TpssTLgr8oNzUoi0=";
    };
    meta.homepage = "https://github.com/ThePrimeagen/git-worktree.nvim/";
  };
in
{
  plugins.git-worktree = {
    # enable = true;
    enableTelescope = true;
    package = git-worktree-nvim;
  };
  # extraConfigLua = ''
  #   local Worktree = require('git-worktree')
  #
  #   Worktree.on_tree_change(function(op, metadata)
  #     local Path = require('plenary.path')
  #     if op == Worktree.Operations.Create then
  #       local path = metadata.path
  #       if not Path:new(path):is_absolute() then
  #         path = Path:new():absolute()
  #         if path:sub(-#"/") == "/" then
  #           path = string.sub(path, 1, string.len(path) - 1)
  #         end
  #       end
  #
  #       local worktree_path = path .. "/" .. metadata.path .. "/"
  #       local gitignored_path = path .. "/gitignored"
  #
  #       local find_dirs = "find " .. gitignored_path .. " -mindepth 1 -depth -type d -printf '%P\n'"
  #       local create_dirs = find_dirs .. "| while read dir; do mkdir -p " .. worktree_path .. "$dir; done"
  #       os.execute(create_dirs)
  #
  #       local find_files = "find " .. gitignored_path .. " -type f -printf '%P\n'"
  #       local link_files = find_files .. "| while read file; do ln -s " .. gitignored_path .. "/$file " .. worktree_path .. "$file done"
  #       os.execute(link_files)
  #     end
  #   end)
  # '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>gw";
      action = "worktree+";
    }
    {
      mode = "n";
      key = "<leader>gwc";
      action = "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>";
      options = { desc = "Create worktree"; };
    }
    {
      mode = "n";
      key = "<leader>gwl";
      action = "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>";
      options = { desc = "List worktrees"; };
    }
  ];
}
