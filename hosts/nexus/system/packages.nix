{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btrfs-progs
    helix
    monero-cli
    openrgb-with-all-plugins
    p2pool
    tuigreet
    wireguard-tools
    xmrig
    zellij
  ];
}
