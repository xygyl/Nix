{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jj-starship
    jjui
  ];
}
