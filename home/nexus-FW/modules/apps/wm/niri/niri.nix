{ lib, ... }:

{
  xdg.configFile."niri/hm.kdl".source = ./config.kdl;
  xdg.configFile.niri-config.enable = lib.mkForce false;
}
