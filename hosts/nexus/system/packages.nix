{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
