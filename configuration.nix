# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cachix.nix
      ./users/pdf.nix
      ./programs/zsh.nix
      ./services/nvidia.nix
      ./services/git.nix
      ./services/virtualization.nix
      ./cybersecurity/pkgs.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pdf"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pt";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "pt-latin1";

  # Polkit 
  security.polkit.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  systemd.user.services.polkit-gnome-authentication-agent-1.enable = true;

  systemd.services.polkit-gnome-authentication-agent-1 = {
    serviceConfig.User = "pdf";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    openvpn
    p7zip
    bat
    brave
    spotify
    vesktop
    alsa-utils
    findutils
    terminator
    vscode
    polkit
    polkit_gnome
    python311
    python311Packages.pip
    python311Packages.dbus-python
    flameshot
    lshw
    git
    tldr
    vlc
    pulseaudio
    cachix
    libreoffice
    brightnessctl
    obsidian
    qemu
    maven
    sumo
    nix-index
    openjdk
    polybar
    font-awesome
    rofi
    bluez
    gpick
    alacritty
    xfce.thunar
    okular
    gnome-calculator
    zoxide
    feh

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        ms-python.python
      ];
    })

    (symlinkJoin {
      name = "discord";
      paths = [ vesktop ];
      postBuild = ''
        ln -s $out/bin/vesktop $out/bin/discord
      '';
    })

    (symlinkJoin {
      name = "calculator";
      paths = [ gnome-calculator ];
      postBuild = ''
        ln -s $out/bin/gnome-calculator $out/bin/calculator
      '';
    })
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
  services.openssh.enable = true;
  # xdg.portal.enable       = true;
  # services.flatpak.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  # Automatic Garbage Collection
  nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delte-older-than 7d";
	};
  # i3 config
  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
	  enable = true;
	  desktopManager.xterm.enable = true;
	  displayManager.defaultSession = "none+i3";
    windowManager.i3 = {
		  enable = true;
      configFile = ./dotfiles/i3/config;
		  extraPackages = with pkgs; [
			  dmenu
			  i3status
			  i3lock
			  i3blocks
		  ];
		  package = pkgs.i3-gaps;
    };
  };

  # Fonts
  fonts.packages = with pkgs; [
	  fira-code
	  nerdfonts
    font-awesome
  ];

  fonts.fontconfig = {
    defaultFonts = {
      emoji = [ "font-awesome" ];
    };
  };

}
