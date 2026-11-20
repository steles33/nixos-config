{
  description = "My Declarative NixOS System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    calibre-plugins.url = "github:nydragon/calibre-plugins";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    calibre-plugins,
    ...
  }: {
    nixosConfigurations.m920q = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/m920q/configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = {
              calibrePlugins = calibre-plugins;
            };
            users.steles33 = import ./home.nix;
          };
        }
      ];
    };
  };
}
