{ pkgs, ... }:
let
  zoom = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "zoom";
    version = "2025-10-16";
    rtpFilePath = "power-zoom.tmux";
    src = pkgs.fetchFromGitHub {
      owner = "jaclu";
      repo = "tmux-power-zoom";
      rev = "5916f2087c140e9fbac7f3bbf64765581646c042";
      sha256 = "sha256-3RI/waUjmAoqRrihjenDSq777kf3sLXaWWYJMCRlEvQ=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    sensibleOnTop = false;
    clock24 = true;
    keyMode = "vi";
    mouse = false;
    newSession = true;
    terminal = "xterm-256color";

    plugins = with pkgs.tmuxPlugins; [
      # Set plugin @ options in extraconfig, since they need to be before plugin source
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppucin_window_text " #{pane_current_command}"
          set -g @catppuccin_window_current_text " #{pane_current_command}"
          set -g @catppuccin_date_time "%Y-%m-%d %H:%M"
        '';
      }
      {
        plugin = zoom;
        extraConfig = ''
          unbind z
          set -g @power_zoom_trigger 'z'
        '';
      }
    ];

    # batttery and cpu set manually, as they must be set after status line
    # which, itself, cannot be set before 'extraconfig'
    extraConfig = builtins.readFile ./conf + ''
      run-shell ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux
      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
    '';
  };

  # Add plugin files
  home.file.".config/tmux/plugins".source = ./plugins;
}
