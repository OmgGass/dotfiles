# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config = { allowUnfree = true;};

  # Use the systemd-boot EFI boot loader.
  boot.supportedFilesystems = [ "ntfs" ];
  #boot.supportedFileSystems = ["ntfs" "fat32"];
  #boot.loader.systemd-boot.enable = true;  
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
  
   virtualisation.libvirtd.enable = true;
  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
   services.blueman.enable = true;
   hardware.bluetooth.enable = true;


    programs.kitty = {
    enable = true;
    theme = "3024 Night"; # <-- Mude o nome do tema aqui
    font = {
      name = "JetBrains Mono";
      size = 12;
    };
    settings = {
      # Adicione qualquer outra configuração que você queira
      # Por exemplo, para um fundo semi-transparente:
      background_opacity = "0.85";
    };
  };

   fonts.packages = with pkgs; [
   noto-fonts
   noto-fonts-cjk-sans
   noto-fonts-emoji
   font-awesome
   nerd-fonts.fira-code
   nerd-fonts.jetbrains-mono];


  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

    zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
  };

  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   programs.hyprland = {
	enable = true;
	xwayland.enable = true;
	};	

   xdg.portal = {
	enable = true;
	extraPortals = with pkgs; [
		xdg-desktop-portal-hyprland
		xdg-desktop-portal-gtk

		];
	};
  


   services.displayManager.sddm.enable = true;
   services.displayManager.sddm.wayland.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "br,us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
   services.pipewire = {
     enable = true;
     pulse.enable = true;
     alsa.enable = true;
     jack.enable = true;
     alsa.support32Bit = true;

   };
  
   services.pipewire.wireplumber.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

   
   users.users.Garcia = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "audio" "video""libvirtd" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };
  # /etc/nixos/configuration.nix















 
   environment.systemPackages = with pkgs; [
     virt-manager
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     git
     bitwarden
     telegram-desktop
     firefox
     vlc
     pkgs.noisetorch
     pkgs.eww
     nautilus 
     pkgs.waybar
     pkgs.rofi-wayland
     pkgs.kitty
     discord-canary
     pavucontrol
     spotify
     pkgs.prismlauncher
     pkgs.helix
     os-prober
     pkgs.fastfetch
     pkgs.zellij
     pavucontrol
     swww
     pkgs.wireplumber
     pkgs.waypaper 
     pkgs.dunst
     pkgs.wl-clipboard
     pkgs.slurp
     grimblast 
     brightnessctl
     socat
     jq
     inotify-tools
     pamixer
     mako
     btop
     pkgs.nwg-look
     pkgs.cliphist
     pkgs.vscode
     sass
     nodejs
     sass
     spicetify-cli 


     #devenv
     pkgs.nil
     pkgs.usbutils
     pkgs.rustup
     pkgs.rust-analyzer 
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

