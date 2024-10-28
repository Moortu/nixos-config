{
  description = "KooL's NixOS-Hyprland"; 
  	
  inputs = {
  	nixpkgs.url = "nixpkgs/nixos-unstable";
	#wallust.url = "git+https://codeberg.org/explosion-mental/wallust?ref=dev";
	hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; # hyprland development
	distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes"; 
        zen-browser.url = "github:MarceColl/zen-browser-flake";  
        ghostty.url = "git+ssh://git@github.com/ghostty-org/ghostty";
  	};

  outputs = 
	inputs@{ self,nixpkgs, ... }:
    	let
      system = "x86_64-linux";
      host = "nixos";
      username = "kris";

    pkgs = import nixpkgs {
       	inherit system;
       	config = {
       	allowUnfree = true;
       	};
      };
    in
      {
	nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem rec {
		specialArgs = { 
			inherit system;
			inherit inputs;
			inherit username;
			inherit host;
			};
	   		modules = [ 
				./hosts/${host}/config.nix 
				inputs.distro-grub-themes.nixosModules.${system}.default
				];
			};
		};
	};
}