{
  description = "Let's Fucking Go";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
        "ubuntu" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/ubuntu"; # TODO: make this match your home directory
        username = "ubuntu";
        configuration.imports = [ ./home-manger/lfg.nix ];
      };
    };
  };
}
