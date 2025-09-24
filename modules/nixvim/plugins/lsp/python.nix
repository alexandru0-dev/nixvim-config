{
  plugins.lsp.servers.basedpyright = {
    enable = true;
    settings = {
      analysis.analysis.useTypingExtensions = true;
      analysis.inlayHints.genericTypes = true;
      analysis.diagnosticSeverityOverrides = {
        reportCallInDefaultInitializer = "none";
      };
    };
  };

  plugins.lsp.servers.ruff = {
    enable = true;
  };

}
