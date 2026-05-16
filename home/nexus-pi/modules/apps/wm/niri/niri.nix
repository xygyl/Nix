{ lib, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile.niri-config.enable = lib.mkForce false;
}
