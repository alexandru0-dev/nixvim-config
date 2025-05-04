{ config, pkgs, ... }:
let
  junit = pkgs.fetchurl {
    url = "https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.10.1/junit-platform-console-standalone-1.10.1.jar";
    hash = "sha256-tC6qU9E1dtF9tfuLKAcipq6eNtr5X0JivG6W1Msgcl8=";
  };
in
{
  plugins.neotest = {
    enable = true;
    adapters.java.enable = config.plugins.jdtls.enable;
    adapters.java.settings = {
      # @lang Lua
      # Not sure why this wasn't working
      # junit_jar = "${junit}";
    };
    lazyLoad = {
      settings = {
        keys = [
          {
            __unkeyed-1 = "<leader>nt";
            __unkeyed-3 = "<CMD>Neotest summary<CR>";
            desc = "Summary toggle";
          }
          {
            __unkeyed-1 = "<leader>dn";
            __unkeyed-3.__raw = ''
              function()
                require("neotest").run.run({strategy = "dap"})
              end
            '';
            desc = "Neotest Debug";
          }
          {
            __unkeyed-1 = "<leader>na";
            __unkeyed-3 = "<CMD>Neotest attach<CR>";
            desc = "Attach";
          }
          {
            __unkeyed-1 = "<leader>nd";
            __unkeyed-3.__raw = ''
              function()
                require("neotest").run.run({strategy = "dap"})
              end
            '';
            desc = "Debug";
          }
          {
            __unkeyed-1 = "<leader>nh";
            __unkeyed-3 = "<CMD>Neotest output<CR>";
            desc = "Output";
          }
          {
            __unkeyed-1 = "<leader>no";
            __unkeyed-3 = "<CMD>Neotest output-panel<CR>";
            desc = "Output Panel toggle";
          }
          {
            __unkeyed-1 = "<leader>nr";
            __unkeyed-3 = "<CMD>Neotest run<CR>";
            desc = "Run (Nearest Test)";
          }
          {
            __unkeyed-1 = "<leader>nR";
            __unkeyed-3.__raw = ''
              function()
                require("neotest").run.run(vim.fn.expand("%"))
              end
            '';
            desc = "Run (File)";
          }
          {
            __unkeyed-1 = "<leader>ns";
            __unkeyed-3 = "<CMD>Neotest stop<CR>";
            desc = "Stop";
          }
        ];
      };
    };
  };
}
