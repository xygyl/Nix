{ lib, ... }:

{
  xdg.configFile."niri/config.kdl" = lib.mkForce {
    source = ./config.kdl;
  };
} 
