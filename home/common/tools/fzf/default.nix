{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --type d --hidden  --exclude '.git'";
    defaultOptions = [ "--layout=reverse --inline-info --bind '?:toggle-preview'" ];
    fileWidget = {
      command = "fd --type f --hidden --exclude '.git'";
      options = [
        "-m --preview='bat --plain -r 1:15 -P --color always {}' --preview-window down:15:hidden:wrap"
      ];
    };
    changeDirWidget = {
      command = "fd --type d --hidden --exclude '.git'";
      options = [
        "--preview 'tree -C {} | head -15' --preview-window down:15:hidden:wrap"
      ];
    };
    historyWidget.options = [ "--preview 'echo {}' --preview-window down:3:hidden:wrap" ];
  };
}
