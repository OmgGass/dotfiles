
{pkgs, ...}:

{

nix.settings.experimental-features = ["nix-command" "flakes"];


   nixpkgs.config = { allowUnfree = true;};

   #network and bluetooth 
  networking.networkmanager.enable = true;  
  services.blueman.enable = true;
  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.enableAllFirmware = true;
  
  
  # Use the systemd-boot EFI boot loader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];  
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = ["nodev"];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  
  boot.loader.grub.extraEntries = ''
  menuentry "Windows" {
    insmod part_gpt
    insmod fat
    search --no-floppy --fs-uuid --set=root 0F74-E0AA
    chainloader /EFI/Microsoft/Boot/bootmgfw.efi
  }
'';

 time.timeZone = "America/Sao_Paulo";


#swap in ram 
 zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd"; };


virtualisation.libvirtd.enable = true;


 # Enable the X11 windowing system.
   services.xserver.enable = true;
   programs.hyprland = {
	enable = true;
	xwayland.enable = true;
	};	




#services login
services.displayManager.sddm.enable = true;
services.displayManager.sddm.wayland.enable = true;


security.sudo-rs.enable = true;

environment.systemPackages = with pkgs; [
  zellij
  home-manager
  kitty
  btop
  pavucontrol
  git
  helix
  wget
  git-lfs
  os-prober
  mako
  pavucontrol 
  os-prober
  dconf
];

   services.pipewire = {
     enable = true;
     pulse.enable = true;
     alsa.enable = true;
     jack.enable = true;

   };
  
   services.pipewire.wireplumber.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;



programs.gnupg.agent = {
  enable = true;
  enableSSHSupport = true;
  };

users.users.Garcia = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "power" "docker" ];
    packages = with pkgs; [
      tree
     ];
    shell = pkgs.nushell;
   };


environment.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  
  virtualisation.docker.enable = true;

  

  users.defaultUserShell = pkgs.nushell;







  system.stateVersion = "25.05";

}
