{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;

  	enableCompletion = true;
  	autosuggestions.enable = true;
  	syntaxHighlighting.enable = true;

    shellAliases = {
     	ll = "ls -l";
     	update = "sudo nixos-rebuild switch";

      ga="git add";
      gp="git push";
      gl="git pull";
      gd="git diff";
      gst="git status";
      glog="git log --oneline --decorate --graph";
      gsw="git switch";

      c="clear";
      ne="code ~/nixos-config";
      clean-gens="sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old";
    };
    
    ohMyZsh = {
     	enable = true;
     	plugins = [ "git" ];
     	theme = "robbyrussell";
    };
  };

  system.userActivationScripts = {
   extraUserActivation = {
       text = ''
        ln -sfn $HOME/nixos-config/dotfiles/alacritty ~/.config/
        ln -sfn $HOME/nixos-config/dotfiles/i3 ~/.config/
        ln -sfn $HOME/nixos-config/dotfiles/polybar ~/.config/
      '';
      deps = [];
    };
  };
}