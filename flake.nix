{
  description = "Home Manager configuration of ryanpatterson-cross";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      pre-commit-hooks,
      self,
      ...
    }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."ryanpatterson-cross" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/ryanpatterson-cross/home.nix ];
        # Optionally use extraSpecialArgs to pass through arguments to home.nix
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
      checks.${system} = {
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            statix.enable = true;
            nixfmt-rfc-style.enable = true;
          };
        };
      };
      devShells.${system} = {
        default = with pkgs; mkShell { inherit (self.checks.${system}.pre-commit-check) shellHook; };
      };
    };
}
