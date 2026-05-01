{
  programs.macchina = {
    enable = true;
    settings = {
      theme = "theme";
      show = [
        "Host"
        "Kernel"
        "Distribution"
        "WindowManager"
        "Packages"
        "Shell"
        "Uptime"
      ];
    };
    themes = {
      theme = {
        spacing   = 2;
        key_color = "#00EAFF";
        separator = "";

        box = {
          border  = "rounded";
          visible = true;
          inner_margin = {
            x = 0;
            y = 0;
          };
        };

        custom_ascii = {
          color      = "#5500FF";
          path       = "~/.config/ascii/logo.txt";
        };

        keys = {
          host      = "";
          kernel    = "󰌽";
          de        = "";
          wm        = "";
          distro    = "";
          packages  = "";
          shell     = "";
          uptime    = "";
          cpu       = "";
          gpu       = "󰘨";
          battery   = " ";
          backlight = "󰃠 ";
        };
      }; 
    };
  };
}
