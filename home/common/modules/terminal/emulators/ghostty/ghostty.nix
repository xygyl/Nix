{ lib, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family            = "JetBrainsMono Nerd Font";
      font-size              = lib.mkDefault 15;
      font-style-bold        = false;
      font-style-bold-italic = false;
      font-style-italic      = false;

      app-notifications     = false;
      background-opacity    = 0.8;
      confirm-close-surface = false;
      resize-overlay        = "never";
      window-decoration     = false;

      foreground = "#DDE1FF";
      background = "#000000";

      palette = [
        "0=#000000"
        "1=#FF006A"
        "2=#00FFAA"
        "3=#F1FF5D"
        "4=#5D92FF"
        "5=#6B5DFF"
        "6=#00EAFF"
        "7=#D0D0D0"
        "8=#808080"
        "9=#FF006A"
        "10=#00FFAA"
        "11=#F1FF5D"
        "12=#5D92FF"
        "13=#6B5DFF"
        "14=#00EAFF"
        "15=#FFFFFF"
      ];
    };
  };
}
