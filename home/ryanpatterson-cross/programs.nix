# Use this file for programs managed by homemanager with minimal config
# Anything with complex setup should get its own folder appropriately
{ pkgs, ... }: {

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.package = true;
  };
  
  programs.fd = { enable = true; };

  programs.jq = { enable = true; };

  programs.lazygit = { enable = true; };

  programs.lf = { enable = true; };

  programs.pandoc = {enable = true; };

  programs.poetry = {
    enable = true;
    settings = {
      virtualenvs.create = true;
      virtualenvs.in-project = true;
    };
  };

  programs.ripgrep = { enable = true; };

  programs.tealdeer = {
    enable = true;
    settings = {
      updates = {
        auto_update = true;
        auto_update_interval_hours = 24;
      };
    };
  };

  programs.thefuck = {
    enable = true;
    enableZshIntegration = true;
    enableInstantMode = false;
  };
}
