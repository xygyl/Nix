{ lib, ... }:
let
  background = "000000";
  foreground = "ffffff";
  black = "000000";
  light_black = "777777";
  red = "ff0000";
  yellow = "e5e825";
  green = "00ff55";
  blue = "007fff";
  cyan = "00eaff";
  magenta = "bf00ff";
  white = "ffffff";
  cursor = "ffffff";
  cursor_text_color = "dde1ff";
in {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkDefault "JetBrainsMono Nerd Font:size=15";
      };
      scrollback = {
        lines = 5000;
      };
      bell = {
        urgent = "no";
        notify = "no";
        visual = "no";
      };
      "colors-dark" = {
        alpha = 0.8;
        background = background;
        foreground = foreground;
        urls = magenta;
        cursor = "${cursor} ${cursor_text_color}";
        regular0 = black;
        regular1 = red;
        regular2 = green;
        regular3 = yellow;
        regular4 = blue;
        regular5 = magenta;
        regular6 = cyan;
        regular7 = white;
        bright0 = light_black;
        bright1 = red;
        bright2 = green;
        bright3 = yellow;
        bright4 = blue;
        bright5 = magenta;
        bright6 = cyan;
        bright7 = white;
      };
    };
  };
}
