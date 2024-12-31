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
      minixvim,
      self,
      ...
    }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-darwin" # Currently only apple tested, since config not used anywhere else
      ];
    in
    {
      # These only run with `nix flake check` if they are here, and not imported
      checks = forAllSystems (system: {
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            check-added-large-files.enable = true;
            check-merge-conflicts.enable = true;
            end-of-file-fixer.enable = true;
            mixed-line-endings.enable = true;
            trim-trailing-whitespace.enable = true;
            forbid-submodules = {
              enable = true;
              name = "Forbid git submodules";
              description = "Forbids all git submodules in current dir.";
              language = "fail";
              entry = "Git submodules are not allowed here: ";
              types = [ "directory" ];
            };
            nixfmt-rfc-style.enable = true;
            deadnix.enable = true;
            flake-checker.enable = true;
            nil.enable = true;
          };
        };
      });

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          precommit = self.checks.${system}.pre-commit-check;
        in
        import ./shell.nix { inherit pkgs precommit; }
      );

      # Stand alone home-manager
      homeConfigurations = {
        # different user name on mac
        "ryanpatterson-cross" =
          let
            system = "aarch64-darwin";
          in
          home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [ ./home/ryanpatterson-cross.nix ];
            extraSpecialArgs = {
              editor = minixvim.packages.${system}.default;
            };
          };
      };
    };
}
