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
  zoom = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "zoom";
    version = "2024-06-07";
    rtpFilePath = "power-zoom.tmux";
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

    sensibleOnTop = false;
    clock24 = true;
    keyMode = "vi";
    mouse = false;
    newSession = true;
    terminal = "xterm-256color";

    plugins = with pkgs.tmuxPlugins; [
      # I would really prefer these to be in the conf file, but they need to be before
      # the source to work, and that requires this option
      {
        plugin = catppuccin;
        extraConfig = ''
          set-option -g status-position top
          set -g @catppuccin_custom_plugin_dir "~/.config/tmux/plugins"

          set -g @catppuccin_window_left_separator "█"
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator "  █"

          set -g @catppuccin_window_default_fill "number"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules_right "mode_indicator cpu battery date_time"
          set -g @catppuccin_status_left_separator  ""
          set -g @catppuccin_status_right_separator " "
          set -g @catppuccin_status_fill "all"
          set -g @catppuccin_status_connect_separator "yes"

          set -g @catppuccin_cpu_color "#{thm_pink}"
          set -g @catppuccin_battery_color "#{thm_green}"
          set -g @catppuccin_date_time_color "#{thm_blue}"
        '';
      }
      battery
      cpu
      mode-indicator
      {
        plugin = menus;
        extraConfig = ''
          set -g @menus_location_x C
          set -g @menus_location_y C
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

    extraConfig = builtins.readFile ./conf;
  };

  # Add plugin files
  home.file.".config/tmux/plugins".source = ./plugins;
}
