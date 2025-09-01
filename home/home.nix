{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./devenv.nix
  ];


  


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
    nautilus
    spotify
    discord-canary
  ];

  home.stateVersion = "25.05";

  
  }

