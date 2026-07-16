{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    atuin
    croc
    framework-tool
    helix
    starship
    tuigreet
    zellij
  ];
}
