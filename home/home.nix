{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./devenv.nix
    ./rofi.nix
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
    
    #themes
    noto-fonts-emoji-blob-bin
    catppuccin-gtk
    catppuccin-cursors
  ];

  home.stateVersion = "25.05";

  
  }

