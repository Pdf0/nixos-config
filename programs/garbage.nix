{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        # List here every package you don't want as core     
    ];
}