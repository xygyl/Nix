{
  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      theme.name = "xygyl";
      history_filter = [
        "^# [0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"
      ];
      enter_accept = true;
    };
  };

  home.file.".config/atuin/themes/xygyl.toml".text = ''
    [theme]
    name = "xygyl"

    [colors]
    AlertInfo = "#00ffaa"
    AlertWarn = "#f98771"
    AlertError = "#ff006a"
    Important = "#f1ff5d"
    Base = "#dde1ff"
    Guidance = "#6b5dff"
    Annotation = "#ff5dd1"
    Title = "#5dffe4"
  '';
}
