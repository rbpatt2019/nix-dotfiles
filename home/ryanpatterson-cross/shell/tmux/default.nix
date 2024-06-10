{ config, pkgs, ... }:
let
  menus = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "menus";
    version = "2024-06-07";
    src = pkgs.fetchFromGitHub {
      owner = "jaclu";
      repo = "tmux-menus";
      rev = "4ecb84642ac25879aca452a2830e0f424269ff49";
      sha256 = "sha256-iUUKt63zz6ZC1wA6gMi6+hod7ldBNP4UigcdNQP09MU=";
    };
  };
  power-zoom = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "power-zoom";
    version = "2024-06-07";
    src = pkgs.fetchFromGitHub {
      owner = "jaclu";
      repo = "tmux-power-zoom";
      rev = "8e90d8bc58ffdca5a77866bf5256027c7938664a";
      sha256 = "sha256-78a3u6pci35/4AQK8LdIZu6zMkalOfbmQnz/Ek0uvWU=";
    };
  };
in
{
  programs.tmux = {
    enable = true;

    shortcut = "a";

    clock24 = true;
    keyMode = "vi";
    mouse = false;
    newSession = true;
    terminal = "xterm-256color";

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
    ];

    extraConfig = builtins.readFile ./conf;
  };
}
