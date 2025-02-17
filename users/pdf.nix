{ config, pkgs, ... }:

{
    users.users.pdf = {
        isNormalUser = true;
        description = "pdf";
        extraGroups = [ "networkmanager" "wheel" "nixos" "libvirtd" "docker" "audio" ];
        packages = with pkgs; [];
    };
}