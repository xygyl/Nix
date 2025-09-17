{ pkgs, ... }:
let
  name = "phinger-cursors-dark";
  size = 24;
in {
  home = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
    pointerCursor = with pkgs; {
      package = phinger-cursors;
      name = name;
      size = size;

      gtk.enable = true;
      x11.enable = true;
    };
  };
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
        ];
      };
    };
  };
}


