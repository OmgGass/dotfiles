{pkgs, ...}:

{
  home.packages = with pkgs; [
    zellij
    btop
    dust
    p7zip
    rustup
    fd
    bear
    eza
    gemini-cli
    lazygit
    bat

    # hx
    taplo
    clang
    nil
    nixd
    bash-language-server
    docker-language-server
    lldb

    
    rdkafka
    cmake
    gnumake
  ];


    programs.git = {
    enable = true;
    userName = "Garcia";
    userEmail = "omggass@gmail.com";
    delta.enable = true;
    delta.options = {
      "side-by-side" = true;
      navigate = true;
    };
  };


  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
      buffer_editor = "hx";
    };
    envFile.text = ''
      $env.PROMPT_COMMAND = { || $"($env.PWD | path basename)" }
      $env.PROMPT_COMMAND_RIGHT = ""
      $env.EDITOR = "hx"
      $env.VISUAL = "hx"
    '';
    shellAliases = {
      la = "ls -la";
      cat = "bat";
      lg = "lazygit";
      mkd = "mkdir";
      zj = "zellij";
    };

	extraConfig = ''
	      def nixos-update [host: string, user: string] {
	          nix flake update;
	          sudo nixos-rebuild switch --flake .#($host)
	          home-manager switch --flake .#($user)
	      }
	    '';
	  };
