#/dotfiles/home/home.nix
{ pkgs, ... }:

{
  
  imports = [
    ./devenv.nix
    ./hyprland.nix
  ];

  home.username = "Garcia"; 
  home.homeDirectory = "/home/Garcia"; 

  home.file.".config/wallpapers" = {
    source = ../home/wallpapers;
    recursive = true;
  };

  
  home.packages = with pkgs; [
    obs-studio
    telegram-desktop
    firefox
    rofi-wayland
    discord
    pkgs.kitty
    bitwarden
    pkgs.eww
  ];

  home.stateVersion = "25.05"; # Ou a sua versão
}
