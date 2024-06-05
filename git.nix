{
  programs.git = {
    enable = true;
    userName = "rbpatt2019";
    userEmail = "rb.patterson.cross@gmail.com";
    ignores = [ "*~" ".DS_Store" ".direnv" ".env" ".venv" ];
    aliases = {
      a = "add";
      bye = "clean -fdx";
      c = "cz";
      d = "diff";
      ds = "diff --cached";
      dc = "log -p --ext-diff";
      dl = "log --ext-diff -L";
      df = "log -p --ext-diff --";
      f = "fetch";
      g = "merge";
      gu = "merge --ff-only @{u}";
      l = "log --pretty=lc --graph";
      ll = "log --pretty=lf --graph";
      la = "log --pretty=lc --graph --all";
      lal = "log --pretty=lf --graph --all";
      m = "move";
      p = "push";
      pub = "push -u origin HEAD";
      rsh = "reset --hard";
      rsm = "reset --mixed";
      rss = "reset --soft";
      rb = "rebase -i";
      rbu = "rebase -i @{u}";
      s = "status -sb";
      st = "stash";
      stg = "stash pop";
      stp = "stash push --message";
      stl = "stash list --pretty=rlo --stat";
      sts = "stash show --ext-diff --patch";
      sw = "switch";
      swc = "switch --create";
      swd = "switch --detach";
      t = "tag";
      uns = "restore --staged";
      unw = "restore --worktree";
      una = "restore -SW";
      x = "rm";
    };
    difftastic = {
      enable = true;
      color = "always";
      background = "dark";
      display = "side-by-side-show-both";
    };
    extraConfig = {
      core = { editor = "nvim"; };
      init = { defaultBranch = "main"; };
      pull = { rebase = true; };
      pretty = {
        lc = "format:%C(auto)%h%C(reset) %C(white)-%C(reset) %C(italic blue)%ad%C(reset) %C(italic cyan)(%ar)%C(reset)%C(auto)%d%C(reset)%n %C(white)⤷%C(reset) %s %C(241)- %aN <%aE>%C(reset)%n"; 
        lf = "format:%C(auto)%h%C(reset)%C(auto)%d%C(reset)   %C(italic 239)[P: %p] [T: %t]%C(reset)%n%C(white)Author:%C(reset)   %aN %C(241)<%aE>%C(reset)%n          %C(italic blue)%ad%C(reset) %C(italic cyan)(%ar)%C(reset)%n%C(white)Commit:%C(reset)   %cN %C(241)<%cE>%C(reset)   %C(italic 239)[GPG: %G?% GK]%C(reset)%n          %C(italic blue)%cd%C(reset) %C(italic cyan)(%cr)%C(reset)%w(0,4,4)%n%n%C(bold)%s%C(reset)%n%n%-b%n%n%-N%n";
        rlo = "tformat:%C(auto)%h%C(reset) %C(bold yellow)(%C(magenta)%gd%C(bold yellow))%C(reset)%C(auto)%d%C(reset) %gs %C(italic blue)%ad%C(reset) %C(241)%aN%C(reset)";
      };
    };
  };
}
