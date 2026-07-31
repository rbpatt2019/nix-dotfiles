{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    attachExistingSession = false;
    exitShellOnExit = false;
    plugins = with pkgs; [
      zellijPlugins.zjstatus
      zjstatus-hints
    ];
    extraConfig = builtins.readFile ./config.kdl;
    layouts = {
      default = builtins.readFile ./layout.kdl;
    };
  };
}
