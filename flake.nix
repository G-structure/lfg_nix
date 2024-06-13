{
  description = "Lets Fucking Go";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
  };

  outputs = { nixpkgs, home-manager, defaultPackage.x86_64-linux, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      homeConfigurations.jdoe = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home-manager/lfg.nix ];
      };
    };
}
