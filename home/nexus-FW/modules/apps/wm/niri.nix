{ pkgs, lib, ... }: {
  xdg.configFile."niri-config".source = lib.mkForce
    (pkgs.writeText "niri-hm-config.kdl"
      (''
        spawn-at-startup "dms" "run"
      '' + builtins.readFile ./config.kdl));
}
