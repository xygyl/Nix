{ pkgs, ...}:

{
  home.packages = with pkgs; [
    chess-tui
    # factorio
    # factorio-space-age
    # quantframe
    # veloren
  ];
}
