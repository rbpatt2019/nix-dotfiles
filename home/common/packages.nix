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
  ];
  fonts.fontconfig.enable = true;
}
