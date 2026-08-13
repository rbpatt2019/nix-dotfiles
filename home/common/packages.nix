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
    nerd-fonts.inconsolata
    newt
    minixvim
  ];
  fonts.fontconfig.enable = true;
}
