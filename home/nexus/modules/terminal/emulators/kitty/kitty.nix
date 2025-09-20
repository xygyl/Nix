let
  background = "#000000";
  foreground = "#ffffff";
  black = "#000000";
  light_black = "#777777";
  red = "#ff0000";
  yellow = "#e5e825";
  green = "#00ff55";
  blue = "#007fff";
  cyan = "#00eaff";
  magenta = "#bf00ff";
  white = "#ffffff";
  cursor = "#ffffff";
  cursor_text_color  = "#f81ce5";
in {
  programs.kitty = {
    enable = true;
    settings = {
      update_check_interval = 0;
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      text_composition_strategy = "legacy";
      scrollback_lines = "5000";
      background_opacity = 0.9;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      background            = background;
      foreground            = foreground;
      url_color             = magenta;
      cursor                = cursor;
      cursor_text_color     = cursor_text_color;
      color0                = black;
      color8                = light_black;
      color1                = red;
      color9                = red;
      color2                = green;
      color10               = green;
      color3                = yellow;
      color11               = yellow;
      color4                = blue;
      color12               = blue;
      color5                = magenta;
      color13               = magenta;
      color6                = cyan;
      color14               = cyan;
      color7                = white;
      color15               = white;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };
}
