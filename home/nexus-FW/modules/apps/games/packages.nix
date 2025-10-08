{ pkgs, ...}:

{
  home.packages = with pkgs; [
    # aisleriot
    chess-tui
    # factorio-space-age
    # mindustry
    # openttd
    # osu-lazer
    # quantframe
    # veloren
  ];
}
