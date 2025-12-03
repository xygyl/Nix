{
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        battery = true;
        cpu_left_legend = true;
        default_time_value = "30s";
        disable_advanced_kill = true;
        enable_gpu = true;
        hide_time = true;
        memory_legend = "top-left";
        network_legend = "top-left";
        network_use_bytes = false;
        process_memory_as_value = true;
        rate = "250ms";
        unnormalized_cpu = true;
      };
      processes = {
        columns = [
          "PID"
          "Name"
          "CPU%"
          "Mem%"
          "GMem%"
          "GPU%"
          "User"
        ];
      };
      temperature.sensor_filter = {
        is_list_ignored = false;
        list = ["k10temp" "radeon"]; 
      };
      cpu.default = "all";
      styles = {
        cpu = {
          all_entry_color = "#DDE1FF";
          avg_entry_color = "#DDE1FF";
          cpu_core_colors = [
            "#FF006A"
            "#FFAA00"
            "#F1FF5D"
            "#00FFAA"
            "#00EAFF"
            "#5D92FF"
            "#6B5DFF"
          ];
        };
        memory = {
          gpu_colors = ["#00FFAA" "#6B5DFF"];
          ram_color = "#FF006A";
          swap_color = "#00EAFF";
        };
        network = {
          rx_color = "#00FFAA";
          tx_color = "#6B5DFF";
        };
        battery = {
          high_battery_color = "#00FFAA";
          low_battery_color = "#FF006A";
          medium_battery_color = "#F1FF5D";
        };
        tables = {
          headers = { color = "#5D92FF"; bold = true; };
        };
        graphs = {
          graph_color = "#DDE1FF";
          legend_text = { color = "#DDE1FF"; };
        };
        widgets = {
          border_color = "#312A50";
          selected_border_color = "#DDE1FF";
          widget_title = {color = "#6B5DFF"; };
          text = { color = "#DDE1FF"; };
          selected_text = { color = "black"; bg_color = "#6B5DFF"; };
          disabled_text = { color = "dark gray"; };
        };
      };
      row = [
        {
          ratio = 30;
          child = [
            { ratio = 4; type = "cpu"; }
            { type = "battery"; }
            { ratio = 2; type = "temp"; }
          ];
        }
        {
          ratio = 70;
          child = [
            {
              child = [
                { type = "net"; }
                { type = "mem"; }
              ];
            }
            {
              ratio = 1;
              type = "proc";
            }
          ];
        }
      ];
    };
  };
}
