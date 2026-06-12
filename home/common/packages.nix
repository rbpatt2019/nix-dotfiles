{
  pkgs,
  ...
}:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    pkgs.cz-cli
    pkgs.eza
    pkgs.lftp
    pkgs.moreutils
    pkgs.nerd-fonts.inconsolata
    pkgs.newt
    pkgs.gitleaks
    pkgs.semgrep
  ];
}
