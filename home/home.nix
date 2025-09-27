{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./devenv.nix
    ./rofi.nix
    ./waybar.nix
    ./dunst.nix
  ];

    nixpkgs.config.allowUnfree = true;


home.file.".config/noisetorch/config.toml" = {
    text = ''
    Threshold = 95
    DisplayMonitorSources = false
    EnableUpdates = true
    FilterInput = true
    FilterOutput = false
    LastUsedInput = ""
    LastUsedOutput = ""
  '';
  };



  home.username = "Garcia";
  home.homeDirectory = "/home/Garcia";

  home.file.".config/wallpapers" = {
    source = ../home/wallpapers;
    recursive = true;
  };

  home.sessionPath = [
    "~/.local/bin"
    "~/.cargo/bin"
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noisetorch 
    obs-studio
    qbittorrent
    ueberzugpp
    telegram-desktop
    firefox
    vlc
    bitwarden
    anydesk
    nautilus
    spotify
    discord-canary
    docker
    premid
    discord
    pulseaudio
    
    #themes
    noto-fonts-emoji-blob-bin
    catppuccin-gtk
    catppuccin-cursors
    papirus-icon-theme

    #fonts
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.hack
    dejavu_fonts
    
  ];


gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

  };

  home.stateVersion = "25.05";

  
  }

