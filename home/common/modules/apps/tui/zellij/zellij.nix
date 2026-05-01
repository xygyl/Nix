{ lib, ...}:

{
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/config.kdl" = lib.mkForce {
    source = ./config.kdl;
  };
}
