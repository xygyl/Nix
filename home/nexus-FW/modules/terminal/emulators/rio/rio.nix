{
  programs.rio = {
    enable = false;

    settings = {
      padding-x = 5;
      padding-y = [5 5];
      line-height = 1.0;
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

      graphics = {
        backend = "automatic";
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
        size = 16;
        use-drawable-chars = true;
        hinting = true;
        family = "JetBrainsMono Nerd Font";

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

        emojis = {
          family = "Noto Color Emoji";
        };
      };

      colors = {
        background = "#000000";
        foreground = "#ffffff";
        cursor = "#ffffff";
        black = "#000000";
        red = "#ff0000";
        green = "#00ff55";
        yellow = "#e5e825";
        blue = "#007fff";
        magenta = "#bf00ff";
        cyan = "#00eaff";
        white = "#ffffff";
        light-black = "#777777";
        light-red = "#ff0000";
        light-green = "#00ff55";
        light-yellow = "#e5e825";
        light-blue = "#007fff";
        light-magenta = "#bf00ff";
        light-cyan = "#00eaff";
        light-white = "#ffffff";
      };
    };
  };
}
