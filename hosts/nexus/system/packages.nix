{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    atuin
    btrfs-progs
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
