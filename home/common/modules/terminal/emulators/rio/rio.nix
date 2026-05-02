{ lib, inputs, pkgs, ...}:

{
  programs.rio = {
    enable = false;
    package = inputs.rio.packages.${pkgs.stdenv.hostPlatform.system}.rio;

    settings = {
      padding-x = 5;
      padding-y = [0 0];
      line-height = 1.0;
      confirm-before-quit = false;
      enable-scroll-bar = false;
      scrollback-history-limit = 10000;

      cursor = {
        shape = "beam";
      };

      editor = {
        program = "hx";
      };

      window = {
        blur = true;
        colorspace = "srgb";
        decorations = "disabled";
        opacity = 0.8;
        opacity-cells = true;
      };

      renderer = {
        backend = "Vulkan";
      };

      keyboard = {
        use-kitty-keyboard-protocol = false;
        disable-ctlseqs-alt = false;
        ime-cursor-positioning = false;
      };

      fonts = {
        size = lib.mkDefault 15;
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
          weight = 800;
        };

        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
          width = "Normal";
          weight = 400;
        };

        bold-italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
          width = "Normal";
          weight = 800;
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
