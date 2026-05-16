{ lib, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
  xdg.configFile."niri/config.kdl" = lib.mkForce {
    source = ./config.kdl;
  };
}
