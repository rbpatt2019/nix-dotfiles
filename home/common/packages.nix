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
    minixvim
  ];
  fonts.fontconfig.enable = true;
}
