# Use this file for programs managed by homemanager with minimal config
# Anything with complex setup should get its own folder appropriately
{ pkgs, ... }: {

  home.file.".config/direnv/direnvrc".source = ./direnvrc;
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    fd = {
      enable = true;
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings.git_protocol = "ssh";
    };

    home-manager.enable = true;

    jq = {
      enable = true;
    };

    lf = {
      enable = true;
      previewer.source = pkgs.writeShellScript "pv.sh" ''
                #!/bin/bash
        	bat --color always "$1"
      '';
      previewer.keybinding = "i";
    };

    pay-respects = {
      enable = true;
      enableZshIntegration = true;
    };

    ripgrep = {
      enable = true;
    };
  };
}
