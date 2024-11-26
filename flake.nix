{
  description = "Home Manager configuration of ryanpatterson-cross";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minixvim.url = "github:rbpatt2019/minixvim";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      pre-commit-hooks,
      minixvim,
      self,
      ...
    }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux" # Most other systems
        "aarch64-linux" # Raspberry Pi 4
        "aarch64-darwin" # Apple Silicon
      ];
    in
    {
      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./checks { inherit inputs system pkgs; }
      );

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          precommit = self.checks.${system}.pre-commit-check;
        in
        import ./shell.nix { inherit pkgs precommit; }
      );

      # Modules
      # Overlays
      # Packages

      # Stand alone home-manager
      homeConfigurations = {
        "ryanpatterson-cross@MacBookPro.powerhub" =
          let
            pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home/ryanpatterson-cross/home.nix ];
            extraSpecialArgs = {
              editor = minixvim.packages."aarch64-darwin".default;
            };
          };
      };
    };
}
