{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    style = builtins.readFile ./style.css;

    settings = [
      {
        layer = "top";
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 0;

        modules-left = [
          "custom/appmenuicon"
          "hyprland/workspaces"
          "custom/empty"
        ];

        modules-center = [
          "custom/spotify"
        ];

        modules-right = [
          # "network"
          # "bluetooth"
          "pulseaudio"
          "tray"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
          };
          format-icons = {
            "1" = "み";
            "2" = "ん";
            "3" = "な";
            "4" = "で";
            "5" = "レ";
            "6" = "イ";
            "7" = "ン";
            "8" = "を";
            "9" = "愛";
            "10" = "そ";
            "11" = "う";
          };
        };

        "custom/empty" = {
          format = "";
        };

        "custom/appmenu" = {
          format = "Apps";
          #on-click = "shutdown now";
          tooltip = false;
        };

        "custom/appmenuicon" = {
          format = "";
          #on-click = "shutdown now";
          tooltip = false;
        };

        "custom/spotify" = {
          format = "{icon} {text}";
          exec = "playerctl metadata --format '{\"text\": \"{{title}} - {{artist}}\", \"tooltip\": \"{{album}}\"}'";
          return-type = "json";
          interval = 3;
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          format-icons = [ "" ];
          tooltip = true;
        };

        tray = {
          icon-size = 17;
          spacing = 10;
        };

        pulseaudio = {
          format = "{icon} {volume}%  {format_source}";
          format-bluetooth = "{volume}%  {icon} {format_source}";
          format-source = "";
          format-source-muted = "";
          format-muted = "  {format_source} ";
          on-click-middle = "pavucontrol";
          on-click = "pactl set-sink-mute alsa_output.pci-0000_02_00.6.analog-stereo toggle";
          on-click-right = "pactl set-source-mute alsa_input.pci-0000_02_00.6.analog-stereo toggle";
          format-icons = {

            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [
              " "
              " "
              " "
            ];
          };

        };
      }
    ];
  };
}
