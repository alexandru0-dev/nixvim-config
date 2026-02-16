{
  lsp.servers.basedpyright = {
    enable = true;
    config.settings = {
      analysis.analysis.useTypingExtensions = true;
      analysis.inlayHints.genericTypes = true;
      analysis.diagnosticSeverityOverrides = {
        reportCallInDefaultInitializer = "none";
      };
    };
  };

  lsp.servers.ruff = {
    enable = true;
  };
}
