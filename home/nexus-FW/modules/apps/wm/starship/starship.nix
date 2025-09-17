{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      format =
        "$directory"
        + "$git_branch"
        + "$git_state"
        + "$git_status"
        + "$cmd_duration"
        + "$line_break"
        + "$character";

      add_newline = false;

      directory = {
        fish_style_pwd_dir_length = 1000;
        style = "#00FFAA";
      };

      character = {
        success_symbol = "[❯](#00EAFF)";
        error_symbol = "[❯](#FF006A)";
      };

      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        style = "#777777";
      };

      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "#FF00D4";
      };

      git_state = {
        format = "[$state( $progress_current/$progress_total)]($style) ";
        style = "#777777";
      };

      cmd_duration = {
        min_time = 1000;
        show_milliseconds = true;
        format = "[$duration]($style) ";
        style = "#6B5DFF";
      };
    };
  };
}
