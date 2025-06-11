nix-shell -p git;
git clone https://github.com/Pdf0/nixos-config.git;

sudo rm /etc/nixos/configuration.nix;
sudo ln -s $HOME/nixos-config/configuration.nix /etc/nixos/configuration.nix;


