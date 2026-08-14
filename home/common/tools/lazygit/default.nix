{
  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      git = {
        diffRenderers = [
          {
            command = "delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format='lazygit-edit://{path}:{line}'";
          }
        ];
      };
    };
  };
}
