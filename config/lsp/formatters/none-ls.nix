{pkgs, ...}:{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;

    sources.formatting = { 
      nixfmt = {
        enable = true;
        package = pkgs.nixfmt-rfc-style;
      };
    };
  };
} 
