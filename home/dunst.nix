{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        separator_color = "frame";
      };

      urgency_low = {
        background = "#1d2021";
        foreground = "#d4be98";
        frame_color = "#7daea3";
      };

      urgency_normal = {
        background = "#1d2021";
        foreground = "#d4be98";
        frame_color = "#1d2021";
      };

      urgency_critical = {
        background = "#3c1f1e";
        foreground = "#ddc7a1";
        frame_color = "#ea6962";
      };

    };
  };
}


