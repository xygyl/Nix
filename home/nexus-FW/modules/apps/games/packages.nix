{ pkgs, ...}:

{
  home.packages = with pkgs; [
    # aisleriot
    asciiquarium-transparent
    chess-tui
    # factorio-space-age
    # mindustry
    # openttd
    # osu-lazer
    ponysay
    # quantframe
    # veloren
  ];
}
