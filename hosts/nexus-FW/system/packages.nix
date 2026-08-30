{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
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
