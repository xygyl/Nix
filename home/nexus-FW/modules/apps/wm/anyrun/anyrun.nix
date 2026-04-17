{pkgs, ...}:

{
  programs.anyrun = {
    enable = true;
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.2; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = null;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
      ];
    };

    extraConfigFiles."applications.ron".text = ''
      Config(
        hide_description: true,
      )
    '';

    extraCss = /*css */ ''
      window {
        background: transparent;
      }

      box.main {
        padding: 5px;
        margin: 0px;
        border-radius: 0;
        border: 1px solid #312A50;
        background-color: rgba(0, 0, 0, 0.8);
      }

      .matches {
        background-color: transparent;
      }

      list.plugin {
        background-color: transparent;
      }

      .match.description {
        font-size: 0;
        padding: 0;
        margin: 0;
        min-height: 0;
      }

      .match {
        background: transparent;
      }

      .match:selected {
        background: #312A50;
      }
    '';
  };
}
