{
  programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin";
    };
  };

  home.file.".config/bat/themes/catppuccin.tmTheme".source = ./catppuccin.tmTheme;
}
