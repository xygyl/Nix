{ config, ... }:

{
  services.mpd-mpris.enable = true;

  services.mpd = {
    enable           = true;
    musicDirectory   = "~/Music";
    playlistDirectory = "${config.xdg.configHome}/mpd/playlists";
    dataDir          = "${config.xdg.configHome}/mpd";

    network = {
      listenAddress = "localhost";
      port          = 6600;
    };

    extraConfig = ''
      db_file    "~/.config/mpd/database"
      log_file   "~/.config/mpd/log"
      pid_file   "~/.config/mpd/pid"
      state_file "~/.config/mpd/state"

      auto_update "yes"
      bind_to_address "~/.config/mpd/socket"

      input {
          plugin "curl"
      }

      filesystem_charset "UTF-8"

      audio_output {
          type   "pipewire"
          name   "Pipewire Output"
          device "sysdefault:CARD=M2"
      }

      audio_output {
          type   "fifo"
          name   "my_fifo"
          path   "/tmp/mpd.fifo"
          format "44100:16:2"
      }
    '';
  };
}
