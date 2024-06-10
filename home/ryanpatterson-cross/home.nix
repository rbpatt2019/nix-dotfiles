{ config, pkgs, ... }:

{
  home.username = "ryanpatterson-cross";
  home.homeDirectory = "/Users/ryanpatterson-cross";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cookiecutter
    cz-cli
    eza
    lftp
    moreutils
    (nerdfonts.override { fonts = [ "Inconsolata" ]; })
  ];

  # Link files

  # Enable fonts
  fonts.fontconfig.enable = true;

  imports = [
    ./term/alacritty/default.nix
    ./shell/zsh/default.nix
    ./shell/starship/default.nix
    ./shell/tmux/default.nix
    ./tools/fzf/default.nix
    ./tools/git/default.nix
    ./tools/bat/default.nix
    ./programs.nix
  ] ;
}
