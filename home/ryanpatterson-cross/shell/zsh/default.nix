{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    syntaxHighlighting.enable = true;

    enableCompletion = true;
    completionInit = builtins.readFile ./compinit;

    dirHashes = { dot = "$HOME/projects/dotfiles"; };

    sessionVariables = {
      PAGER = "bat --style=plain,header";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANPATH = "/usr/local/man:$MANPATH";
      EDITOR = "nvim";
      VIRTUAL_ENV_DISABLE_PROMPT = 1;
      MODE_INDICATOR = "";
    };

    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/zsh/history";
      ignoreSpace = true;
      ignoreAllDups = true;
    };
    historySubstringSearch = { enable = true; };

    shellAliases = {
      c = "command -v";
      d = "dirs -v";
      del = "rm -rf";
      g = "git";
      i = "ipython";
      l = "lazygit";
      la = "eza -ahl --total-size --git";
      lt = "eza -ahlr --sort=time --total-size --git";
      ll = "eza -hl --total-size --git";
      "l." = "eza -ld --total-size --git .*";
      le = "eza -x --group-directories-first";
      m = "make";
      p = "poetry";
      switch = "home-manager switch -b bak";
      update = "nix flake update && home-manager switch -b bak";
      t = "tmux";
      ta = "tmux attach -t";
      tree = "eza -lhT --total-size --git";
    };

    shellGlobalAliases = {
      B = "| bat --style=plain";
      G = "| rg";
      L = "&& le";
      "-h" = "-h 2>&1 | bat --language=help --style=plain";
      "--help" = "--help 2>&1 | bat --language=help --style=plain";
    };

    initExtra = builtins.readFile ./zshrc;
  };
}
