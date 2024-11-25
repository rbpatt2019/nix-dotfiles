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
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."ryanpatterson-cross" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/ryanpatterson-cross/home.nix ];
        extraSpecialArgs = {
          editor = minixvim.packages.${system}.default;
        };
      };

      formatter = pkgs.nixfmt-rfc-style;
      checks = {
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            statix.enable = true;
            nixfmt-rfc-style.enable = true;
          };
        };
      };
      devShells = {
        default = with pkgs; mkShell { inherit (self.checks.${system}.pre-commit-check) shellHook; };
      };
    };
}
