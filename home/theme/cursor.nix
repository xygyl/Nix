{ pkgs, ... }:
let
  cursor = "phinger-cursors-dark";
in {
  home = {
    pointerCursor = {
      package = pkgs.phinger-cursors;
      name = cursor;
      size = 24;

      gtk.enable = true;
      x11.enable = true;
    };
    sessionVariables = {
      XCURSOR_THEME = cursor;
      XCURSOR_SIZE  = "24";
    };
  };
}
