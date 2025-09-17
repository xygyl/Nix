{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "bottom";
        height = 20;
        margin-left = 0;
        margin-right = 0;
        margin-top = 0;
        margin-bottom = 0;
        spacing = 1;
        reload_style_on_change = true;

        modules-left = ["clock"];

        modules-right = [
          "wireplumber#sink"
          "backlight"
          "battery"
          "custom/separator"
        ];

        clock = {
          interval = 1;
          format = "{:%A, %B %d, %Y | %R} ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#00FFAA'><b>{}</b></span>";
              days = "<span color='#DDE1FF'><b>{}</b></span>";
              weeks = "<span color='#00EAFF'><b>W{}</b></span>";
              weekdays = "<span color='#6B5DFF'><b>{}</b></span>";
              today = "<span color='#FF006A'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-left = "kitty -e calcure";
            on-click-right = "mode";
          };
        };
        battery = {
          interval = 5;
          bat = "BAT1";
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󱐋";
          format-plugged = "{capacity}% 󱐋";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            "󰄰"
            "󰪞"
            "󰪟"
            "󰪠"
            "󰪡"
            "󰪢"
            "󰪣"
            "󰪤"
            "󰪥"
          ];
        };
        "wireplumber#sink" = {
          node-type = "Audio/Sink";
          format = "{volume}% ∿";
          format-muted = "∅";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 1;
          states = {
            warning = 101;
            critical = 125;
          };
        };
      };
    };
    style = ''
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
  };
}
