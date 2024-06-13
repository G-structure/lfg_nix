{
  description = "Lets Fucking Go";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nix-community/home-manager/release-22.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations.ubuntu = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home-manager/lfg.nix ];
      };
    };
}
