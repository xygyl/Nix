{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    atuin
    compsize
    croc
    framework-tool
    helix
    monero-cli
    p2pool
    starship
    tuigreet
    wireguard-tools
    xmrig
    zellij
  ];
}
