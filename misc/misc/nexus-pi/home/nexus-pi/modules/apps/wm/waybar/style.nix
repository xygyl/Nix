{
  programs.waybar.style = ''
    @define-color fg #DDE1FF;
    @define-color sepcolor #DDE1FF;
    @define-color bg #000000;
    @define-color bordercolor #080D0F;
    @define-color warning #F1FF5D;
    @define-color alert #FF006A;
    @define-color activegreen #00FFAA;
    @define-color highlight #6B5DFF;

    * {
      min-height: 20px;
      font-size: 15px;
      font-family: "JetBrainsMono Nerd Font";
    }

    window#waybar {
      color: @fg;
      background: @bg;
      transition-property: background-color;
      transition-duration: 1s;
      border: 0px solid @bordercolor;
      border-radius: 0px;
    }

    #workspaces button {
      color: @fg;
      padding: 0px 7px;
      background: @bg;
    }

    #workspaces {
      margin-left: 7px;
    }

    #clock,
    #battery,
    #backlight,
    #network,
    #wireplumber,

    #mpd {
      background: transparent;
      border: none;
      padding: 0px 5px;
      margin: 3px 3px;
    }

    #custom-clock.local {
      color: @fg;
    }

    #custom-clock.nonlocal {
      color: @highlight;
    }

    #tray {
      background-color: @bordercolor;
      border-radius: 0px;
      padding: 0px 10px;
      margin: 5px;
    }

    #battery.charging,
    #battery.plugged {
      color: @activegreen;
    }

    label:focus {
      background-color: @bg;
    }

    #pulseaudio.warning,
    #wireplumber.warning {
      color: @warning;
    }

    #pulseaudio.critical,
    #wireplumber.critical {
      color: @alert;
    }

    #network.disconnected,
    #pulseaudio.muted,
    #battery.critical:not(.charging),
    #wireplumber.muted {
      color: @alert;
    }

    tooltip {
      border-radius: 0px;
      background-color: #000000;
      color: #f2f2f2;
    }
  '';
}
