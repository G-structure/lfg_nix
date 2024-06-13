{
  description = "Lets Fucking Go";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      homeStateVersion = "24.05";
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations.ubuntu = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home-manager/lfg.nix ];
      };
    };
}
