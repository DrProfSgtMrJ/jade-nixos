{
	description = "This is my first NixOS configuration";

	# Using nixpkgs which is
	# a single large repo that contains
	# packages
	inputs = {
		nixpkgs = {
			url = "github:nixos/nixpkgs/nixos-unstable";
		};

		nixpkgs-stable = {
			url = "github:nixos/nixpkgs/nixos-26.05";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
		};
	};
	
	outputs = {nixpkgs, ...} @ inputs: {
        	
		nixosConfigurations = builtins.listToAttrs (map (name: {
			name = name;
			value = nixpkgs.lib.nixosSystem {
				modules = [
					./hosts/${name}
					inputs.home-manager.nixosModules.default
					{
						home-manager.users.jade = {
							imports = [
								inputs.nixvim.homeModules.nixvim
								./home/jade
							];
						};
					}
				];
				specialArgs = {
					inherit inputs;
					system = "x86_64-linux";
				};
			};
		}) ["jade"]);
	};
}


