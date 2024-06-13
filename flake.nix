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

  outputs = { self, nixpkgs, home-manager }:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f { inherit system; });
    in
    {
      homeConfigurations = forAllSystems { system }:
      home-manager.lib.homeManagerConfiguration {

      inherit (nixpkgs) system;

        modules = [ ./home-manager/lfg.nix ];
      };
    };
}
