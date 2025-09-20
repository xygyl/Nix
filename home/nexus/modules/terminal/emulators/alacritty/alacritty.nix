{
  programs.alacritty = {
    enable = false;
    settings = {
      font = {
        size = 15;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        window = {
          opacity = 0.9;
        };
      };
      colors = {
        primary = {
          background = "#000000";
          foreground = "#ffffff";
        };  
        cursor = {
          text = "#F81CE5";
          cursor = "#ffffff";
        };
        normal = {
          black   = "#000000";
          red     = "#fe0100";
          green   = "#33ff00";
          yellow  = "#feff00";
          blue    = "#0066ff";
          magenta = "#cc00ff";
          cyan    = "#00ffff";
          white   = "#d0d0d0";
        };
        bright = {
          black   = "#808080";
          red     = "#fe0100";
          green   = "#33ff00";
          yellow  = "#feff00";
          blue    = "#0066ff";
          magenta = "#cc00ff";
          cyan    = "#00ffff";
          white   = "#FFFFFF";
        };
      };
    };
  };
}
