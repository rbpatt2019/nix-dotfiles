{ pkgs, ... }: {

  home.packages = [
    pkgs.cz-cli
  ];

  home.file.".czrc".source = ./configs/czrc;

}
