{
  programs.helix.themes = {
    xygyl = {
      "ui.bufferline.active"    = { fg = "light-magenta"; bg = "dark-magenta"; };
      "ui.bufferline"           = { bg = "black"; };
      "ui.cursor"               = { fg = "green"; modifiers = [ "reversed" ]; };
      "ui.cursorline.primary"   = { bg = "gray"; };
      "ui.cursor.match"         = { fg = "light-cyan"; bg = "dark-cyan"; };
      "ui.cursor.primary"       = { fg = "light-green"; modifiers = [ "reversed" ]; };
      "ui.menu"                 = { bg = "dark-white"; };
      "ui.menu.selected"        = { fg = "yellow"; };
      "ui.popup"                = { bg = "dark-white"; };
      "ui.selection"            = { bg = "dark-white"; };
      "ui.statusline"           = { fg = "light-magenta"; bg = "dark-magenta"; };
      "ui.statusline.insert"    = { fg = "cyan"; };
      "ui.statusline.normal"    = { fg = "green"; };
      "ui.statusline.select"    = { fg = "yellow"; };
      "ui.text"                 = { fg = "default"; };
      "ui.text.focus"           = { fg = "yellow"; };
      "ui.text.info"            = { bg = "dark-white"; };
      "ui.virtual.indent-guide" = { fg = "light-black"; };
      "ui.virtual.ruler"        = { bg = "dark-white"; };
      "ui.virtual.wrap"         = { fg = "dark-blue"; };
      "ui.window"               = { bg = "dark-white"; };

      "diagnostic.deprecated"  = { modifiers = [ "crossed_out" ]; };
      "diagnostic.error"       = { bg = "dark-red"; };
      "diagnostic.hint"        = { bg = "dark-cyan"; };
      "diagnostic.info"        = { bg = "dark-white"; };
      "diagnostic.unnecessary" = { modifiers = [ "dim" ]; };
      "diagnostic.warning"     = { bg = "dark-yellow"; };

      error   = { fg = "red"; };
      hint    = { fg = "cyan"; bg = "dark-cyan"; };
      info    = { fg = "default"; bg = "dark-white"; };
      warning = { fg = "yellow"; bg = "dark-yellow"; };

      "comment.documentation"     = "magenta";
      comment                     = "light-black";
      constant                    = "blue";
      "constant.character.escape" = "magenta";
      constructor                 = "light-cyan";
      function                    = "cyan";
      "function.macro"            = "magenta";
      "keyword.directive"         = "magenta";
      keyword                     = "orange";
      label                       = "green";
      special                     = "light-cyan";
      string                      = "red";
      type                        = "green";

      "diff.delta" = "yellow";
      "diff.minus" = "red";
      "diff.plus"  = "green";

      palette = {
        default = "#DDE1FF";
        black   = "#000000";
        gray    = "#111111";
        white   = "#EAEDFF";
        red     = "#FF006A";
        orange  = "#FFAA00";
        yellow  = "#F1FF5D";
        green   = "#00FFAA";
        cyan    = "#00EAFF";
        blue    = "#5D92FF";
        magenta = "#6B5DFF";

        light-black   = "#697386";
        light-grey    = "#656565";
        light-white   = "#FFFFFF";
        light-red     = "#FF8BA3";
        light-orange  = "#FFCE8B";
        light-yellow  = "#F6FFAA";
        light-green   = "#9CFFCC";
        light-cyan    = "#99F4FF";
        light-blue    = "#9DBFFF";
        light-magenta = "#9FA3FF";

        dark-black   = "#000000";
        dark-grey    = "#040404";
        dark-white   = "#3E4043";
        dark-red     = "#800031";
        dark-orange  = "#805300";
        dark-yellow  = "#79802A";
        dark-green   = "#008053";
        dark-cyan    = "#007580";
        dark-blue    = "#2A4680";
        dark-magenta = "#322A80";
      };
    };
  };
}
