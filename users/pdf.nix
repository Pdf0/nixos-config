{ config, pkgs, ... }:

{
    users.users.pdf = {
        isNormalUser = true;
        description = "pdf";
        extraGroups = [ "networkmanager" "wheel" "nixos" ];
        packages = with pkgs; [];
    };
}