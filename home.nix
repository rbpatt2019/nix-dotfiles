{ config, pkgs, ... }:

{
  home.username = "ryanpatterson-cross";
  home.homeDirectory = "/Users/ryanpatterson-cross";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
