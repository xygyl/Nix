{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;

    # Generate settings for both stacks:
    gtk.enable = true;
    x11.enable = true;
  };

  # Wayland helpers: some compositors/apps read these env vars
  # (Home Manager often sets them for you, but this makes it explicit).
  home.sessionVariables = {
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE  = "24";
  };
}
