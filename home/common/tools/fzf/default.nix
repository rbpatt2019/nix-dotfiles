{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [ "-w 50% -h 50%" ];
    };
    defaultCommand = "fd --type f --type d --hidden  --exclude '.git'";
    defaultOptions = [ "--layout=reverse --inline-info --bind '?:toggle-preview'" ];
    fileWidgetCommand = "fd --type f --hidden --exclude '.git'";
    fileWidgetOptions = [
      "-m --preview='bat --plain -r 1:15 -P --color always {}' --preview-window down:15:hidden:wrap"
    ];
    changeDirWidgetCommand = "fd --type d --hidden --exclude '.git'";
    changeDirWidgetOptions = [
      "--preview 'tree -C {} | head -15' --preview-window down:15:hidden:wrap"
    ];
    historyWidgetOptions = [ "--preview 'echo {}' --preview-window down:3:hidden:wrap" ];
  };
}
