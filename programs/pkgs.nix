{ config, pkgs, ... }:
let
   unstable = import <nixos-unstable> {};
in {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        vim
        wget
        openvpn
        p7zip
        bat
        brave
        spotify
        vesktop
        alsa-utils
        findutils
        vscode
        polkit
        polkit_gnome
        python3Full
        python312Packages.pip
        python312Packages.conda
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
        unstable.qemu
        nix-index
        openjdk
        polybar
        font-awesome
        rofi
        bluez
        gpick
        alacritty
        xfce.thunar
        kdePackages.okular
        gnome-calculator
        zoxide
        feh
        upower
        bluez
        pamixer
        file
        conda
        cloudflare-warp
        openvpn
        mgba
        libcap
        go
        gcc
        dunst
        arandr
        pavucontrol
        inetutils
        nfs-utils
        mysql84
        sqlite
        prismlauncher
        rustup
        dig
        tree
        protonvpn-cli_2
        megapixels
        
        # nvim
        luarocks
        ripgrep
        fd
        fzf
        lua

        zlib
        libguestfs-with-appliance
        rofi
        ncdu
        signal-desktop
        nodejs_23
        acpi
        openresolv
        qbittorrent-enhanced
        vlc
        elixir_1_18
        jetbrains.datagrip
        erlang_27
        gnumake
        direnv
        unstable.bruno
        python312Packages.textual-dev
        xclip

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

    programs.nix-ld.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };

    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "pdf" ];

}