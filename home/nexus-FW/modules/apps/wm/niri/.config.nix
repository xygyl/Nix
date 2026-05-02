{ ... }:

{
  programs.niri.settings = {
    prefer-no-csd = true;
    screenshot-path = "~/Pictures/%Y-%m-%d_%H:%M:%S.png";

    hotkey-overlay.skip-at-startup = true;

    cursor = {
      theme = "phinger-cursors-dark";
      size = 24;
      hide-after-inactive-ms = 1000;
    };

    overview.zoom = 0.6;

    spawn-at-startup = [
      { argv = ["brightnessctl" "set" "50%"]; }
      { argv = ["mpd"]; }
      { argv = ["swww-daemon"]; }
      { argv = ["waybar"]; }
      { argv = ["wlsunset" "-l" "29.4" "-L" "-98.4"]; }
      { argv = ["xwayland-satellite"]; }
    ];

    input = {
      keyboard = {
        xkb = {
          layout = "us";
        };
        numlock = true;
      };
      touchpad = {
        natural-scroll = false;
        middle-emulation = true;
        tap = true;
        dwt = true;
      };
      warp-mouse-to-focus.enable = true;
      focus-follows-mouse.enable = true;
    };

    outputs = {
      "eDP-1" = {
        mode = {
          width = 2560;
          height = 1600;
          refresh = 165.0;
        };
        scale = 1.5;
      };
      "eDP-2" = {
        mode = {
          width = 2560;
          height = 1600;
          refresh = 165.0;
        };
        scale = 1.5;
      };
    };

    layout = {
      background-color = "transparent";
      gaps = 0;
      default-column-display = "tabbed";
      default-column-width = { proportion = 1.0; };
      preset-column-widths = [
        { proportion = 0.5; }
        { proportion = 1.0; }
      ];
      preset-window-heights = [
        { proportion = 0.5; }
        { proportion = 1.0; }
      ];
      focus-ring.enable = false;
      border.enable = false;
      tab-indicator = {
        hide-when-single-tab = true;
        width = 2;
        gap = 0;
        length.total-proportion = 1.0;
        position = "left";
        place-within-column = true;
        active.color = "#6b5dff";
        inactive.color = "#000000";
      };
    };

    gestures.hot-corners.enable = false;

    layer-rules = [
      {
        matches = [{ namespace = "swww-daemon"; }];
        place-within-backdrop = true;
      }
    ];

    window-rules = [
      {
        matches = [{ title = "nomacs"; }];
        open-fullscreen = true;
      }
      {
        geometry-corner-radius = {
          top-left = 0.0;
          top-right = 0.0;
          bottom-left = 0.0;
          bottom-right = 0.0;
        };
        clip-to-geometry = true;
      }
    ];

    animations = {
      slowdown = 0.75;
      workspace-switch.kind.spring = {
        damping-ratio = 1.0;
        stiffness = 1000;
        epsilon = 0.0001;
      };
      window-open.kind.easing = {
        duration-ms = 100;
        curve = "ease-out-expo";
      };
      window-close.kind.easing = {
        duration-ms = 100;
        curve = "ease-out-quad";
      };
      horizontal-view-movement.kind.spring = {
        damping-ratio = 1.0;
        stiffness = 1000;
        epsilon = 0.0001;
      };
      window-movement.kind.spring = {
        damping-ratio = 1.0;
        stiffness = 1000;
        epsilon = 0.0001;
      };
      window-resize.kind.spring = {
        damping-ratio = 1.0;
        stiffness = 1000;
        epsilon = 0.0001;
      };
      config-notification-open-close.kind.spring = {
        damping-ratio = 1.0;
        stiffness = 1000;
        epsilon = 0.001;
      };
      screenshot-ui-open.enable = false;
      overview-open-close.kind.spring = {
        damping-ratio = 1.0;
        stiffness = 1000;
        epsilon = 0.0001;
      };
    };

    binds = let
      spawn = args: { action.spawn = args; };
      ws = n: { action.focus-workspace = n; };
      mws = n: { action.move-column-to-workspace = n; };
      mwws = n: { action.move-window-to-workspace = n; };
      act = name: { action.${name} = []; };
    in {
      # App launchers
      "Mod+D" = spawn ["vesktop"];
      "Mod+E" = spawn ["firefox"];
      "Mod+Q" = spawn ["kitty" "zellij"];
      "Mod+Shift+Q" = spawn ["kitty"];
      "Mod+R" = spawn ["fuzzel"];
      "Mod+S" = spawn ["steam"];

      # Window management
      "Mod+C" = act "close-window";
      "XF86Tools" = act "close-window";
      "Ctrl+Alt+Delete".action.quit.skip-confirmation = true;

      # Focus
      "Mod+Left" = act "focus-column-left";
      "Mod+Down" = act "focus-window-down";
      "Mod+Up" = act "focus-window-up";
      "Mod+Right" = act "focus-column-right";
      "Mod+H" = act "focus-column-left";
      "Mod+J" = act "focus-window-down";
      "Mod+K" = act "focus-window-up";
      "Mod+L" = act "focus-column-right";

      # Move columns/windows
      "Mod+Ctrl+Left" = act "move-column-left";
      "Mod+Ctrl+Down" = act "move-window-down";
      "Mod+Ctrl+Up" = act "move-window-up";
      "Mod+Ctrl+Right" = act "move-column-right";
      "Mod+Ctrl+H" = act "move-column-left";
      "Mod+Ctrl+J" = act "move-window-down";
      "Mod+Ctrl+K" = act "move-window-up";
      "Mod+Ctrl+L" = act "move-column-right";

      # First/last column
      "Mod+Home" = act "focus-column-first";
      "Mod+End" = act "focus-column-last";
      "Mod+Ctrl+Home" = act "move-column-to-first";
      "Mod+Ctrl+End" = act "move-column-to-last";

      # Workspace navigation
      "Mod+Page_Down" = act "focus-workspace-down";
      "Mod+Page_Up" = act "focus-workspace-up";
      "Mod+U" = act "focus-workspace-down";
      "Mod+I" = act "focus-workspace-up";
      "Mod+Ctrl+Page_Down" = act "move-column-to-workspace-down";
      "Mod+Ctrl+Page_Up" = act "move-column-to-workspace-up";
      "Mod+Ctrl+U" = act "move-column-to-workspace-down";
      "Mod+Ctrl+I" = act "move-column-to-workspace-up";

      "Mod+Shift+Page_Down" = act "move-workspace-down";
      "Mod+Shift+Page_Up" = act "move-workspace-up";
      "Mod+Shift+U" = act "move-workspace-down";
      "Mod+Shift+I" = act "move-workspace-up";

      # Workspace by number
      "Mod+1" = ws 1;
      "Mod+2" = ws 2;
      "Mod+3" = ws 3;
      "Mod+4" = ws 4;
      "Mod+5" = ws 5;
      "Mod+6" = ws 6;
      "Mod+7" = ws 7;
      "Mod+8" = ws 8;
      "Mod+9" = ws 9;
      "Mod+0" = ws 10;
      "Mod+Ctrl+1" = mws 1;
      "Mod+Ctrl+2" = mws 2;
      "Mod+Ctrl+3" = mws 3;
      "Mod+Ctrl+4" = mws 4;
      "Mod+Ctrl+5" = mws 5;
      "Mod+Ctrl+6" = mws 6;
      "Mod+Ctrl+7" = mws 7;
      "Mod+Ctrl+8" = mws 8;
      "Mod+Ctrl+9" = mws 9;
      "Mod+Shift+1" = mwws 1;
      "Mod+Shift+2" = mwws 2;
      "Mod+Shift+3" = mwws 3;
      "Mod+Shift+4" = mwws 4;
      "Mod+Shift+5" = mwws 5;
      "Mod+Shift+6" = mwws 6;
      "Mod+Shift+7" = mwws 7;
      "Mod+Shift+8" = mwws 8;
      "Mod+Shift+9" = mwws 9;
      "Mod+Shift+0" = mwws 10;

      # Presets & column management
      "Mod+Tab" = act "switch-preset-column-width";
      "Mod+Shift+Tab" = act "switch-preset-window-height";

      "Mod+BracketLeft" = act "consume-or-expel-window-left";
      "Mod+BracketRight" = act "consume-or-expel-window-right";
      "Mod+Comma" = act "consume-window-into-column";
      "Mod+Period" = act "expel-window-from-column";

      "Mod+O" = { repeat = false; action.toggle-overview = []; };

      "Mod+F" = act "maximize-column";
      "Mod+Shift+F" = act "fullscreen-window";

      "Mod+Minus".action.set-column-width = "-5%";
      "Mod+Equal".action.set-column-width = "+5%";
      "Mod+Shift+Minus".action.set-window-height = "-5%";
      "Mod+Shift+Equal".action.set-window-height = "+5%";

      "Mod+V" = act "toggle-window-floating";
      "Mod+Shift+V" = act "switch-focus-between-floating-and-tiling";

      "Mod+W" = act "toggle-column-tabbed-display";

      "Mod+Shift+P" = act "power-off-monitors";
      "Ctrl+Shift+P" = act "power-off-monitors";

      "Mod+Shift+S" = act "screenshot";
      "Print" = act "screenshot-screen";

      # Media keys
      "XF86AudioRaiseVolume" = spawn ["wpctl" "set-volume" "-l" "1" "@DEFAULT_AUDIO_SINK@" "2%+"];
      "XF86AudioLowerVolume" = spawn ["wpctl" "set-volume" "-l" "1" "@DEFAULT_AUDIO_SINK@" "2%-"];
      "XF86AudioMute" = spawn ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];

      "XF86MonBrightnessDown" = spawn ["brightnessctl" "set" "5%-"];
      "XF86MonBrightnessUp" = spawn ["brightnessctl" "set" "5%+"];
      "Shift+XF86MonBrightnessDown" = spawn ["brightnessctl" "set" "0%"];
      "Shift+XF86MonBrightnessUp" = spawn ["brightnessctl" "set" "100%"];
    };
  };
}
