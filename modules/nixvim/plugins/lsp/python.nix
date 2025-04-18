{ ... }:
{
  plugins.lsp.servers.basedpyright = {
    enable = true;
    settings = {
      analysis.diagnosticSeverityOverrides = {
        reportCallInDefaultInitializer = "none";
      };
    };
  };

}
