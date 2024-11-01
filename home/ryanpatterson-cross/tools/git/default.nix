{
  programs.git = {
    enable = true;
    userName = "rbpatt2019";
    userEmail = "rb.patterson.cross@gmail.com";
    ignores = [
      "*~"
      ".DS_Store"
      ".direnv"
      ".env"
      ".venv"
    ];
    aliases = {
      a = "add";
      bye = "clean -fdx";
      b = "branch";
      c = "cz";
      d = "diff";
      du = "diff @..@{u}";
      ds = "diff --cached";
      dl = "log --ext-diff -L";
      df = "log -p --ext-diff --";
      f = "fetch";
      g = "merge";
      l = "log --pretty=lc --graph";
      lu = "log --pretty=lc --graph @..@{u}";
      ll = "log --pretty=lf --graph";
      la = "log --pretty=lc --graph --all";
      p = "push";
      pub = "push -u origin HEAD";
      r = "reset";
      rb = "rebase";
      rbi = "rebase -i";
      s = "status -sb";
      sh = "show --ext-diff";
      st = "stash";
      stp = "stash pop";
      stl = "stash list --pretty=rlo --stat";
      sts = "stash show --ext-diff --patch";
      sw = "switch";
      swc = "switch --create";
      swd = "switch --detach";
      t = "tag";
      undo = "restore";
      x = "rm";
    };
    delta = {
      enable = true;
      options = {
        side-by-side = true;
        dark = true;
        syntax-theme = "catppuccin";
        hyperlinks = true;
      };
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      diff = {
        colorMoved = "default";
      };
      init = {
        defaultBranch = "main";
      };
      merge = {
        conflictstyle = "diff3";
      };
      pull = {
        rebase = true;
      };
      pretty = {
        lc = "format:%C(auto)%h%C(reset) %C(white)-%C(reset) %C(italic blue)%ad%C(reset) %C(italic cyan)(%ar)%C(reset)%C(auto)%d%C(reset)%n %C(white)⤷%C(reset) %s %C(241)- %aN <%aE>%C(reset)%n";
        lf = "format:%C(auto)%h%C(reset)%C(auto)%d%C(reset)   %C(italic 239)[P: %p] [T: %t]%C(reset)%n%C(white)Author:%C(reset)   %aN %C(241)<%aE>%C(reset)%n          %C(italic blue)%ad%C(reset) %C(italic cyan)(%ar)%C(reset)%n%C(white)Commit:%C(reset)   %cN %C(241)<%cE>%C(reset)   %C(italic 239)[GPG: %G?% GK]%C(reset)%n          %C(italic blue)%cd%C(reset) %C(italic cyan)(%cr)%C(reset)%w(0,4,4)%n%n%C(bold)%s%C(reset)%n%n%-b%n%n%-N%n";
        rlo = "tformat:%C(auto)%h%C(reset) %C(bold yellow)(%C(magenta)%gd%C(bold yellow))%C(reset)%C(auto)%d%C(reset) %gs %C(italic blue)%ad%C(reset) %C(241)%aN%C(reset)";
      };
      url = {
        "ssh://git@github.com/".insteadOf = "https://github.com/";
        "ssh://git@gitlab.com/".insteadOf = "https://gitlab.com/";
      };
    };
  };

  home.file.".czrc".source = ./czrc;
  home.sessionVariables."DELTA_PAGER" = "less -R";
}
