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
    ./term/alacritty/default.nix
    ./shell/zsh/default.nix
    ./shell/starship/default.nix
    ./shell/tmux/default.nix
    ./tools/fzf/default.nix
    ./tools/git/default.nix
    ./tools/lazygit/default.nix
    ./tools/bat/default.nix
    # ./editors/nvim/default.nix
    ./programs.nix
  ];

  # Enable fonts
  fonts.fontconfig.enable = true;
}
