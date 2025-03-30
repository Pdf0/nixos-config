{ config, pkgs, ...}:

{
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
        kdePackages.okular
        gnome-calculator
        zoxide
        feh
        upower
        bluez
        pamixer
        file
        sage
        conda
        cloudflare-warp
        openvpn
        mgba
        libcap
        go
        gcc
        gnupg
        thunderbird
        pinentry    
        dunst
        arandr
        pavucontrol
        inetutils
        nfs-utils
        mysql84
        sqlite
        prismlauncher
        rustup
        jekyll
        dig

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

    programs.nix-ld.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };
}