{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi; # ou pkgs.rofi-wayland
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
      background-color: #282828;
      foreground:       #ebdbb2;
      border-color:     #928374;
      border-radius:    12px;
    }

    window {
      width:            720px;
      padding:          16px;
      border:           2px; /* Este borda herda a cor de border-color */
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
      background-color: #3c3836; /* Fundo para o prompt também, se quiser */
    }

    entry {
      background-color: #3c3836;
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
      spacing:          10px; /* Espaçamento entre ícone e texto */
      border-radius:    10px;
      orientation:      horizontal; /* Ícone e texto lado a lado */
      children:         [ element-icon, element-text ]; /* Explicitamente definimos a ordem */
    }

    element-icon {
      size:             28px;
      vertical-align:   0.5; /* Centraliza o ícone verticalmente */
    }

    element-text {
      vertical-align:   0.5; /* Centraliza o texto verticalmente */
      background-color: inherit;
      text-color:       inherit;
    }
    
    element selected {
      background-color: #458588; /* Cor de seleção */
      text-color:       #ebdbb2;
      border-radius:    10px; /* Borda arredondada para o item selecionado */
    }
  '';
}
