{
  description = "NixOS Flake with Plasma 6 and Home-Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        home-manager.nixosModules.home-manager
	{
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.leave = import ./home.nix; 
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
