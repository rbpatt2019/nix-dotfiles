{ config, pkgs, ... }:

{
  home.username = "ryanpatterson-cross";
  home.homeDirectory = "/Users/ryanpatterson-cross";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  # pkgs are in their own modules
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

  # pkgs not available as programs
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

  # Install configuration
  # Mostly QMK install at the moment
  home.activation.installConfig = ''
    if [ ! -d "${config.home.homeDirectory}/qmk_firmware" ]; then
      ${pkgs.git}/bin/git clone --depth 1 https://github.com/rbpatt2019/qmk_firmware ${config.home.homeDirectory}/qmk_firmware
    fi
    ${pkgs.gh}/bin/gh auth status &> /dev/null || gh auth login
  '';
}
