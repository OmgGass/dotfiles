{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      terminal = "kitty";
      display-drun = "Apps";
      display-run = "Run";
      display-window = "Windows";
      drun-display-format = "{name}";
    };
    theme = "${config.xdg.configHome}/rofi/themes/custom.rasi";
  };

  xdg.configFile."rofi/themes/custom.rasi".text = ''
    * {
      background-color: #4c3836;
      foreground:       #ebdbb3;
      border-color:     #504946;
      border-radius:    12px;
    }

    window {
      width:            720px;
      padding:          16px;
      border:           2px;
    }

    mainbox {
      spacing:          12px;
    }

    inputbar {
      children:         [ prompt, entry ];
      spacing:          8px;
      background-color: transparent;
    }

    prompt {
      enabled:          true;
      padding:          8px 12px;
      border-radius:    10px;
      background-color:  #e9e9e9;

          }

    entry {
      background-color:  #e9e9e9;
      padding:          8px 12px;
      expand:           true;
      placeholder:      "Search…";
      border-radius:    10px;
    }

    listview {
      columns:          1;
      lines:            10;
      cycle:            true;
      dynamic:          true;
      scrollbar:        false;
      fixed-height:     false;
      padding:          4px 0px;
      background-color: transparent;
    }

    element {
      padding:          8px 10px;
      spacing:          10px; 
      border-radius:    10px;
      orientation:      horizontal;
      children:         [ element-icon, element-text ]; 
    }

    element-icon {
      size:             28px;
      vertical-align:   0.5; 
    }

    element-text {
      vertical-align:   0.5; 
      background-color: inherit;
      text-color:       #e9e9e9;
    }

    element selected {
      background-color: #458588;
      text-color:       #ebdbb2;
      border-radius:    10px; 
    }
  '';
}
