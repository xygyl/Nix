{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    framework-tool
    helix
    monero-cli
    p2pool
    tuigreet
    wireguard-tools
    xmrig
    zellij
  ];
}
