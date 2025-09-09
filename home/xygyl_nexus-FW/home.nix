{ config, pkgs, ... }:

{
  home.username = "xygyl";
  home.homeDirectory = "/home/xygyl";

  home.stateVersion = "24.05";

  # User packages
  home.packages = with pkgs; [
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "hx";
  };

  # programs.git = {
  #   enable = true;
  #   userName = "xygyl";
  #   userEmail = "xygyl@proton.me";
  # };

  programs.home-manager.enable = true;
}
