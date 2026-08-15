{ lib, pkgs, ... }:

{
  programs.niri = {
    enable = false;
    package = pkgs.niri;
  };
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile.niri-config.enable = lib.mkForce false;
}
