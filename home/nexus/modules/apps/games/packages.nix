{ pkgs, ...}:

{
  home.packages = with pkgs; [
    chess-tui
    # factorio-space-age
    # mindustry
    # openttd
    # quantframe
    # veloren
  ];
}
