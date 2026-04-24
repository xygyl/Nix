{pkgs, ...}:

{
  programs.anyrun = {
    enable = true;
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.3; };
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

    # Inline comments are supported for language injection into
    # multi-line strings with Treesitter! (Depends on your editor)
    extraCss = /*css */ ''
      window {
        background: transparent;
      }

      box.main {
        padding: 5px;
        margin: 10px;
        border-radius: 10px;
        border: 2px solid @theme_selected_bg_color;
        background-color: @theme_bg_color;
        box-shadow: 0 0 5px black;
      }


      text {
        min-height: 30px;
        padding: 5px;
        border-radius: 5px;
      }

      .matches {
        background-color: rgba(0, 0, 0, 0);
        border-radius: 10px;
      }

      box.plugin:first-child {
        margin-top: 5px;
      }

      box.plugin.info {
        min-width: 200px;
      }

      list.plugin {
        background-color: rgba(0, 0, 0, 0);
      }

      label.match.description {
        font-size: 10px;
      }

      label.plugin.info {
        font-size: 14px;
      }

      .match {
        background: transparent;
      }

      .match:selected {
        border-left: 4px solid @theme_selected_bg_color;
        background: transparent;
      }

      @keyframes fade {
        0% {
          opacity: 0;
        }

        100% {
          opacity: 1;
        }
      }'';

    extraConfigFiles."some-plugin.ron".text = ''
      Config(
        // for any other plugin
        // this file will be put in ~/.config/anyrun/some-plugin.ron
        // refer to docs of xdg.configFile for available options
      )
    '';
  };
}
