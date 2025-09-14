{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    monero-cli
    p2pool
    tuigreet
    wireguard-tools
    xmrig
    zellij
  ];
}
