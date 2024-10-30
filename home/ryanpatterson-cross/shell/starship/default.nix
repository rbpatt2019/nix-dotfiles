{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "$username$sudo$hostname$directory$git_branch$git_state$git_status$package$cmd_duration$jobs$line_break$nix_shell$custom$character ";

      add_newline = true;
      scan_timeout = 100;

      time = {
        disabled = true;
      };
      conda = {
        disabled = true;
      };

      username = {
        format = "[$user]($style)";
        show_always = true;
        style_root = "9";
        style_user = "4";
      };
      sudo = {
        disabled = false;
        format = "[$symbol]($style)";
        style = "bold red";
        symbol = "!!";
      };
      hostname = {
        format = " @ [$hostname]($style)";
        ssh_only = true;
        style = "4";
        trim_at = ".";
      };
      directory = {
        fish_style_pwd_dir_length = 0;
        format = " in [$path]($style)[$read_only]($read_only_style)";
        read_only = "[RO]";
        read_only_style = "6";
        style = "6";
        truncate_to_repo = true;
        truncation_length = 3;
      };
      git_branch = {
        format = " on [$symbol$branch]($style)";
        style = "3";
        symbol = "";
        truncation_length = 7;
        truncation_symbol = "…";
      };
      git_state = {
        disabled = false;
        format = " [- $state]($style)";
        style = "3";
      };
      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style))";
        style = "1";
      };
      package = {
        format = " [$version]($style)";
        style = "9";
        symbol = "";
      };
      cmd_duration = {
        format = " [\\($duration\\)]($style)";
        min_time = 3000;
        style = "13";
      };
      jobs = {
        format = " ([\\($number\\)]($style))";
        number_threshold = 1;
        style = "12";
        symbol = "";
      };
      nix_shell = {
        format = "w/ [$state( \\($name\\))]($style) ";
        symbol = "";
        style = "16";
      };
      custom = {
        python = {
          command = " echo $(python --version | cut -d' ' -f2) ";
          format = "w/ [(\\($output\\))]($style) ";
          style = "2";
          when = "command -v python";
        };
        venv = {
          command = " echo $(basename $(dirname \"$VIRTUAL_ENV\"))/$(basename \"$VIRTUAL_ENV\") ";
          format = "via [($output)]($style) ";
          style = "2";
          when = " [[ -v VIRTUAL_ENV ]] ";
        };
      };
      character = {
        error_symbol = "[>>>>](1)";
        format = "$symbol";
        success_symbol = "[>>>>](7)";
        vicmd_symbol = "[<<<<](7)";
      };
    };
  };
}
