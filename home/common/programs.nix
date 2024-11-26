# Use this file for programs managed by homemanager with minimal config
# Anything with complex setup should get its own folder appropriately
{ pkgs, ... }:
{

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.package = true;
    };

    fd = {
      enable = true;
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings.git_protocol = "ssh";
    };

    jq = {
      enable = true;
    };

    lf = {
      enable = true;
    };

    pandoc = {
      enable = true;
    };

    poetry = {
      enable = true;
      settings = {
        virtualenvs.create = true;
        virtualenvs.in-project = true;
      };
    };

    ripgrep = {
      enable = true;
    };

    tealdeer = {
      enable = true;
      settings = {
        updates = {
          auto_update = true;
          auto_update_interval_hours = 24;
        };
      };
    };

    thefuck = {
      enable = true;
      enableZshIntegration = true;
      enableInstantMode = false;
    };
  };
}
