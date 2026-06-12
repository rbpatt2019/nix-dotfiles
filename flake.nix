{
  description = "Home Manager configuration of ryanpatterson-cross";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      home-manager,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.git-hooks-nix.flakeModule
        inputs.treefmt-nix.flakeModule
        inputs.home-manager.flakeModules.home-manager
      ];
      systems = [ "aarch64-darwin" ];
      perSystem =
        {
          config,
          ...
        }:
        {
          treefmt = {
            flakeCheck = true;
            flakeFormatter = true;
            programs = {
              nixfmt.enable = true;
              statix.enable = true;
              deadnix.enable = true;
            };
          };
          pre-commit.settings.hooks = {
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
            treefmt.enable = true;
            flake-checker.enable = true;
          };
          devShells.default = config.pre-commit.devShell;
        };
      flake = {
        homeModules = {
          terminal = ./home/common/term/alacritty/default.nix;
          zsh = ./home/common/shell/zsh/default.nix;
          cli = ./home/common/shell/starship/default.nix;
          tmux = ./home/common/shell/tmux/default.nix;
          fzf = ./home/common/tools/fzf/default.nix;
          git = ./home/common/tools/git/default.nix;
          lazygit = ./home/common/tools/lazygit/default.nix;
          bat = ./home/common/tools/bat/default.nix;
          programs = ./home/common/programs.nix;
          packages = ./home/common/packages.nix;
        };
        homeConfigurations.ryanpatterson-cross = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
          modules = [
            inputs.self.homeModules.terminal
            inputs.self.homeModules.zsh
            inputs.self.homeModules.cli
            inputs.self.homeModules.tmux
            inputs.self.homeModules.fzf
            inputs.self.homeModules.git
            inputs.self.homeModules.lazygit
            inputs.self.homeModules.bat
            inputs.self.homeModules.programs
            inputs.self.homeModules.packages
            ./home/ryanpatterson-cross.nix
          ];
        };
      };
    };
}
