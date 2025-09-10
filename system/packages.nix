{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    monero-cli
    p2pool
    wireguard-tools
    xmrig
    zellij
  ];
}
