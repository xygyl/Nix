{
  programs.helix = {
    enable = true;
    settings = {
      # theme = "xygyl";
      # theme = "anon";
      theme = "modus_vivendi";
      editor = {
        auto-pairs = {
          "(" = ")";
          "{" = "}";
          "[" = "]";
          "\"" = "\"";
          "`" = "`";
          "'" = "'";
        };
        auto-save = {
          after-delay = {
            enable = true;
            timeout = 1000;
          };
          focus-lost = true;
        };
        bufferline = "always";
        color-modes = true;
        cursorcolumn = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          character = "╎";
          render = true;
        };
        line-number = "relative";
        popup-border = "none";
        rulers = [ 0 100 ];
        scroll-lines = 1;
        soft-wrap = {
          enable = true;
          wrap-at-text-width = true;
        };
        statusline = {
          mode.normal = "(-_-)";
          mode.insert = "(>_<)";
          mode.select = "(•_•)";
        };
        text-width = 100;
      };
    };
  };
}
