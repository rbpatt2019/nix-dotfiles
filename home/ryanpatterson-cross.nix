{
  config,
  pkgs,
  ...
}:
{
  home = {
    username = "ryanpatterson-cross";
    homeDirectory = "/Users/ryanpatterson-cross";
    stateVersion = "26.05";
    activation.installConfig = ''
      if [ ! -d "${config.home.homeDirectory}/qmk_firmware" ]; then
        ${pkgs.git}/bin/git clone --depth 1 https://github.com/rbpatt2019/qmk_firmware ${config.home.homeDirectory}/qmk_firmware
      fi
      ${pkgs.gh}/bin/gh auth status &> /dev/null || ${pkgs.gh}/bin/gh auth login
    '';
  };

}
