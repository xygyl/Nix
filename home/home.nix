{ username, ... }:

{
  home ={
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };

  home.file = {};

  home.sessionVariables = {
    EDITOR = "hx";
  };

  # programs.git = {
  #   enable = true;
  #   userName = "xygyl";
  #   userEmail = "xygyl@proton.me";
  # };

  news.display = "silent";

  programs.home-manager.enable = true;
}
