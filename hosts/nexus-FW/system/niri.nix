{pkgs, ...}:

{
  programs.niri.enable = true;
  services = {
    desktopManager.gnome.enable = true; # convenience
    displayManager.gdm.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config = {
      common = {
        default = [ "gnome" ];
      };
      niri = {
        default = [ "gnome" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
    };
  };
}
