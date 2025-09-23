{ pkgs, ...}:

{
  home.packages = with pkgs; [
    chess-tui
    osu-lazer
    # factorio-space-age
    # mindustry
    # openttd
    # quantframe
    # veloren
  ];
}
