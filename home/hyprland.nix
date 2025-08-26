{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waypaper
    swww
    networkmanagerapplet
    blueman
    nerd-fonts.jetbrains-mono
    fastfetch
    catppuccin-cursors.mochaSapphire
    playerctl
    pamixer
    brightnessctl
    rofi-wayland
    grimblast
    wl-clipboard
    anytype
    pavucontrol
    slurp 
    kdePackages.polkit-kde-agent-1
    socat
    jq
    inotify-tools
  ];

  services.network-manager-applet.enable = true;
  services.dunst.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

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

	  qt = {
	    enable = true;
	    platformTheme.name = "gtk";
	    style.name = "gtk2";
	  };

    #programs.eww = {
	#enable = true;
	#configDir = ../eww;
	#};

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once = waypaper --random --backend swww --folder ~/.config/wallpapers
      exec-once = sh ${./eww/launch.sh}
      exec-once = blueman-applet
      exec-once = ${pkgs.kdePackages.polkit-kde-agent-1}/lib/polkit-kde-authentication-agent-1 
      exec-once = hyprsunset
    '';


    settings = {
      env = [
        "QT_QPA_PLATFORMTHEME,gtk3"
        "TERMINAL,kitty"
        "BROWSER,firefox"
      ];

      monitor = ",1920x1080@60,0x0,1";

      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 1;
        resize_on_border = true;
        "col.active_border" = "rgba(9370DBAA)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
        };
      };

      animations = {
        enabled = true;
      };

      input = {
        kb_layout = "us,br";
        kb_variant = ",abnt2";
        kb_options = "grp:win_space_toggle";
        follow_mouse = true;
        scroll_method = "2fg";
        touchpad = {
          natural_scroll = true;
          "tap-to-click" = true;
          middle_button_emulation = true;
        };
        sensitivity = 0;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };

      misc = {
        disable_hyprland_logo = true;
      };

      windowrule = [
        "opaque, class:mpv"
        "opaque, class: zen"
        "float,title:^(Open file)$"
        "float,class:org.pulseaudio.pavucontrol"
        "float,class:blueman-manager"
        "float,class:waypaper"
        "float,class:org.kde.polkit-kde-authentication-agent-1"
      ];

      windowrulev2 = "float,class:^(org.telegram.desktop)$,title:^(Media*)$";

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod SHIFT, P, exec, grim -g \"$(slurp)\" - | wl-copy"
        "$mainMod, P, exec, grimblast --cursor --notify --freeze copysave output"
        "$mainMod, Return, exec, kitty"
        "$mainMod, B, exec, firefox"
        "$mainMod, T, exec, telegram-desktop"
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod, E, exec, ~/.config/rofi/bin/powermenu"
        "$mainMod, F, fullscreen,"
        "$mainMod, A, exec, anytype"
        "$mainMod, R, exec, kitty -e yazi"
        "$mainMod, B, togglefloating,"
        "$mainMod, D, exec, ~/.config/rofi/bin/launcher"
        "$mainMod, P, pin,"
        "$mainMod, S, togglesplit,"
        "$mainMod, O, exec, sleep 1 && hyprctl dispatch dpms on"
        "$mainMod SHIFT, O, exec, sleep 1 && hyprctl dispatch dpms off"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        ",XF86AudioMicMute, exec, pamixer --default-source -t"
        ",XF86AudioMute, exec, pamixer -t"
        ",XF86AudioRaiseVolume, exec, pamixer -i 10"
        ",XF86AudioLowerVolume, exec, pamixer -d 10"
        ",XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, X, togglespecialworkspace,"
        "$mainMod CTRL, left, workspace, -1"
        "$mainMod CTRL, right, workspace, +1"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT, X, movetoworkspace, special"
        "$mainMod CTRL, 1, movetoworkspacesilent, 1"
        "$mainMod CTRL, 2, movetoworkspacesilent, 2"
        "$mainMod CTRL, 3, movetoworkspacesilent, 3"
        "$mainMod CTRL, 4, movetoworkspacesilent, 4"
        "$mainMod CTRL, 5, movetoworkspacesilent, 5"
        "$mainMod CTRL, 6, movetoworkspacesilent, 6"
        "$mainMod CTRL, 7, movetoworkspacesilent, 7"
        "$mainMod CTRL, 8, movetoworkspacesilent, 8"
        "$mainMod CTRL, 9, movetoworkspacesilent, 9"
        "$mainMod CTRL, 0, movetoworkspacesilent, 10"
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod SHIFT, mouse:272, resizewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
