{
  config,
  pkgs,
  editor,
  ...
}:

{
  home = {
    username = "ryanpatterson-cross";
    homeDirectory = "/Users/ryanpatterson-cross";
    stateVersion = "24.05";
    # pkgs not available as programs
    packages = with pkgs; [
      cookiecutter
      cz-cli
      eza
      lftp
      moreutils
      (nerdfonts.override { fonts = [ "Inconsolata" ]; })
      editor # minixvim config
    ];
    # Install configuration
    activation.installConfig = ''
      if [ ! -d "${config.home.homeDirectory}/qmk_firmware" ]; then
        ${pkgs.git}/bin/git clone --depth 1 https://github.com/rbpatt2019/qmk_firmware ${config.home.homeDirectory}/qmk_firmware
      fi
      ${pkgs.gh}/bin/gh auth status &> /dev/null || gh auth login
    '';
  };

  programs.home-manager.enable = true;

  # pkgs are in their own modules
  imports = [
    ./common/term/alacritty/default.nix
    ./common/shell/zsh/default.nix
    ./common/shell/starship/default.nix
    ./common/shell/tmux/default.nix
    ./common/tools/fzf/default.nix
    ./common/tools/git/default.nix
    ./common/tools/lazygit/default.nix
    ./common/tools/bat/default.nix
    ./common/programs.nix
  ];

  # Enable fonts
  fonts.fontconfig.enable = true;
}
