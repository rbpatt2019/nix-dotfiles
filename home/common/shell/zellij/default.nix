{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    attachExistingSession = true;
    exitShellOnExit = false;
    plugins = with pkgs; [
      zellijPlugins.zjstatus
    ];
    extraConfig = builtins.readFile ./config.kdl;
    layouts = {
      default = builtins.readFile ./layout.kdl;
    };
  };
}
