{ inputs, username, ... }:


{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];
  programs.dank-material-shell = {
    enable = true;
    niri = {
      # enableKeybinds = true;   # Sets static preset keybinds
      enableSpawn = true;      # Auto-start DMS with niri, if enabled
      includes = {
        enable = true;
        override = false;        # hm.kdl loads last, user settings take priority over DMS defaults
        originalFileName = "hm";
        filesToInclude = [
          "alttab"
          "binds"
          "colors"
          "layout"
          "outputs"
          "wpblur"
        ];
      };
    };
    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dank-material-shell changes
    };

    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)
  };
  home ={
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
    sessionVariables = {
      EDITOR = "hx";
    };
  };

  news.display = "silent";
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
