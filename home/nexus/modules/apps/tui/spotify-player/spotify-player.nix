{
  programs.spotify-player = {
    enable = true;
    settings = {
      theme = "xygyl";
      client_id = "65b708073fc0480ea92a077233ca87bd";
      client_port = 8080;
      playback_format = ''
      {artists} {track}
      {album}
      {status} {metadata}'';
      notify_timeout_in_secs = 0;
      tracks_playback_limit = 50;
      app_refresh_duration_in_ms = 32;
      playback_refresh_duration_in_ms = 0;
      page_size_in_rows = 20;
      play_icon = "";
      pause_icon = "";
      liked_icon = "";
      border_type = "Plain";
      progress_bar_type = "Line";
      playback_window_position = "Top";
      playback_window_width = 6;
      enable_media_control = true;
      enable_streaming = "Always";
      enable_notify = false;
      enable_cover_image_cache = true;
      default_device = "spotify-player";
      notify_streaming_only = false;

      notify_format = {
        summary = "{artists} {track}";
        body = "{album}";
      };

      device = {
        name = "spotify-player";
        device_type = "computer";
        volume = 100;
        bitrate = 320;
        audio_cache = false;
        normalization = true;
      };
    };
    themes = [
      {
        name = "xygyl";
        component_style = {
          block_title = { fg = "#00eaff"; };
          border = { fg = "#312a50"; };
          playback_status = { fg = "#5d92ff"; modifiers = ["Bold"]; };
          playback_track = { fg = "#f1ff5d"; modifiers = ["Bold"]; };
          playback_artists = { fg = "#f98771"; modifiers = ["Bold"]; };
          playback_album = { fg = "#00ffaa"; };
          playback_metadata = { fg = "#555555"; };
          playback_progress_bar = { fg = "#ff5dd1"; };
          playback_progress_bar_unfilled = { fg = "#1f0512"; };
          current_playing = { fg = "#6b5dff"; modifiers = ["Bold"]; };
          page_desc = { fg = "#5d92ff"; modifiers = ["Bold"]; };
          playlist_desc = { fg = "#555555"; modifiers = ["Dim"]; };
          table_header = { fg = "#00eaff"; };
          secondary_row = { fg = "#dde1ff"; };
          like = { fg = "#ff006a"; };
          lyrics_played = { modifiers = ["Dim"]; };
          lyrics_playing = { fg = "#6b5dff"; modifiers = ["Bold"]; };
        };
      }
    ];
  };
}
