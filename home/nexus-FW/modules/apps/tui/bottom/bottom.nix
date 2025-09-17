{
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        rate = "250ms";
        cpu_left_legend = true;
        unnormalized_cpu = true;
        default_time_value = "30s";
        hide_time = true;
        battery = true;
        process_memory_as_value = true;
        network_use_bytes = false;
        disable_advanced_kill = true;
        enable_gpu = true;
        memory_legend = "top-left";
        network_legend = "top-left";
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

      cpu = {
        default = "all";
      };

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
          ram_color = "#FF006A";
          swap_color = "#00EAFF";
          gpu_colors = ["#00FFAA" "#6B5DFF"];
        };
        
        network = {
          rx_color = "#00FFAA";
          tx_color = "#6B5DFF";
        };

        battery = {
          high_battery_color = "#00FFAA";
          medium_battery_color = "#F1FF5D";
          low_battery_color = "#FF006A";
        };

        tables = {
          headers = {color = "#5D92FF"; bold = true; };
        };

        graphs = {
          graph_color = "#DDE1FF";
          legend_text = {color = "#DDE1FF"; };
        };

        widgets = {
          border_color = "#312A50";
          selected_border_color = "#312A50";
          widget_title = {color = "#6B5DFF"; };
          text = {color = "#DDE1FF"; };
          selected_text = {color = "black"; bg_color = "#6B5DFF"; };
          disabled_text = {color = "dark gray"; };
        };
      };

      row = [
        {
          ratio = 30;
          child = [
            { ratio = 4; type = "cpu"; }
            { type = "battery"; }
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
