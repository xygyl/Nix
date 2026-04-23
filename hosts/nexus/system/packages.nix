{ pkgs, ... }:

{
  nix.settings.trusted-users = [ "root" "xygyl" ];
  environment.systemPackages = with pkgs; [
    atuin
    btrfs-progs
    cachix
    croc
    helix
    monero-cli
    openrgb-with-all-plugins
    p2pool
    starship
    tuigreet
    wireguard-tools
    xmrig
    zellij
  ];
}
