{
  description = "rbpatt2019 nix configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, ... }:

  let
    arch = "aarch64-darwin";
  in {

    defaultPackage.${arch} = home-manager.defaultPackage.${arch};

    homeConfigurations = {
      ryanpatterson-cross = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${arch};
        modules = [ ./home/ryanpatterson-cross/home.nix ];
      };
    };
  };
}
