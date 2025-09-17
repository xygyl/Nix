{
  programs.rio = {
    enable = true;

    settings = {
      padding-x = 5;
      padding-y = [5 5];
      confirm-before-quit = false;

      cursor = {
        shape = "beam";
      };

      editor = {
        program = "hx";
      };

      window = {
        opacity = 0.9;
        blur = true;
        decorations = "enabled";
        colorspace = "srgb";
      };

      renderer = {
        performance = "high";
        backend = "automatic";
        disable-unfocused-render = false;
        level = 1;
      };

      keyboard = {
        use-kitty-keyboard-protocol = false;
        disable-ctlseqs-alt = false;
        ime-cursor-positioning = false;
      };

      fonts = {
        family = "JetBrainsMono Nerd Font";
        size = 16;

        regular = {
          family = "JetBrainsMono Nerd Font";
          style = "Normal";
          width = "Normal";
          weight = 400;
        };

        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Normal";
          width = "Normal";
          weight = 400;
        };

        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Normal";
          width = "Normal";
          weight = 400;
        };

        bold-italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Normal";
          width = "Normal";
          weight = 400;
        };
      };

      colors = {
        background = "#000000";
        foreground = "#ffffff";
        cursor = "#ffffff";
        red = "#ff0000";
        yellow = "#e5e825";
        green = "#00ff55";
        cyan = "#00eaff";
        magenta = "#bf00ff";
        blue = "#007fff";
        black = "#000000";
        white = "#ffffff";
      };
    };
  };
}
