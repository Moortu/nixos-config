install nixos
boot into nixos
passwd user

nix-shell -p git vim curl pciutils nixFlakes

clone this repo
mkdir -p ~/git
git clone --depth 1 git@github.com:Moortu/nixos-config.git ~/git/nixos-config
cd ~/git/nixos-config

sudo nixos-generate-config --show-hardware-config > hosts/<host>/hardware.nix

//this is a command
NIX_CONFIG="experimental-features = nix-command flakes" 
sudo nixos-rebuild switch --flake .#<host>
