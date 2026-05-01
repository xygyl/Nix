{ pkgs, ...}:

{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      thumbfast
      modernx
    ];
    config = {
      osc = false;
    };
    scriptOpts = {
      osc = {
        scalewindowed = 0.75;
        scalefullscreen = 0.75;
      };
    };
  };
}
