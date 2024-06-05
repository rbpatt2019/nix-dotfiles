{ pkgs, ... }: {
  programs.lazygit = { enable = true; };
  # home.file.".inputrc".source = ./inputrc;
}
