{ inputs, pkgs, ... }:

{
  imports = [
  ];
  programs.dank-material-shell = {
    enable = true;
    package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;

    niri = {
      enableKeybinds = false;
      enableSpawn = true;
      includes = {
        enable = true;

        override = true;
        originalFileName = "hm";
        filesToInclude = [
          # "alttab"
          # "binds"
          # "colors"
          # "layout"
          # "outputs"
          # "wpblur"
        ];
      };
    };

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableClipboardPaste = true;
  };

}
