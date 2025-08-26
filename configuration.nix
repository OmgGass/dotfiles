# /dotfiles/configuration.nix
{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  
  time.timeZone = "America/Sao_Paulo";
  networking.networkmanager.enable = true;

  
  services.pipewire.enable = true;
  hardware.bluetooth.enable = true;
  virtualisation.docker.enable = true;

  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;
  zramSwap.algorithm = "zstd";
    
    services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = [
        "${pkgs.greetd.tuigreet}/bin/tuigreet"
        "--time"
        "--cmd"
        "Hyprland"
      ];
      user = "greeter";
    };
  };
};
  
  users.users.Garcia = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "audio" "video" ];
    shell = pkgs.bash; 
  };

  
  environment.systemPackages = with pkgs; [
    git
    wget
    which 
  ];

 
  system.stateVersion = "25.05"; 
}
