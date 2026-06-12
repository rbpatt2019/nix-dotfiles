{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    cz-cli
    eza
    lftp
    moreutils
    inconsolata
    newt
    gitleaks
    semgrep
  ];
  fonts.fontconfig.enable = true;
}
