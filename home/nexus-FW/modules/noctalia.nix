{ pkgs, inputs, ... }:
{
  programs.noctalia-shell = {
    enable = false;
    settings = {
      bar = {
        density = "compact";
        position = "bottom";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Network";
            }
          ];
          center = [
            # {
            #   hideUnoccupied = false;
            #   id = "Workspace";
            #   labelMode = "none";
            # }
          ];
          right = [
            {
              alwaysShowPercentage = true;
              id = "Battery";
              warningThreshold = 15;
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Monochrome";
      location = {
        monthBeforeDay = false;
        name = "San Antonio, ";
      };
    };
  };
}
