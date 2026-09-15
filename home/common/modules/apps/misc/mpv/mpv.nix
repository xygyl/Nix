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
      hwdec = "auto-safe";
      vo = "gpu-next";
      scale="bilinear";
      cscale="bilinear";
      dscale="bilinear";
      interpolation="no";
      video-sync = "display-resample";
    };
    scriptOpts = {
      osc = {
        scalewindowed = 0.75;
        scalefullscreen = 0.75;
      };
    };
  };
}
