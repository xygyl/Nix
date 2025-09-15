{
  programs.helix = {
    enable = true;

    settings = {
      theme = "xygyl";

      editor = {
        bufferline = "always";
        "color-modes" = true;
        cursorcolumn = true;
        cursorline = true;
        "line-number" = "relative";
        rulers = [ 0 100 ];
        "scroll-lines" = 1;
        "text-width" = 100;

        "cursor-shape" = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        "auto-save" = {
          "after-delay" = {
            enable = true;
            timeout = 1000;
          };
          "focus-lost" = true;
        };

        "indent-guides" = {
          character = "╎";
          render = true;
        };

        "soft-wrap" = {
          enable = true;
          "wrap-at-text-width" = true;
        };
      };
    };


  };
}
