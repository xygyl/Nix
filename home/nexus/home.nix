{ username, ... }:

{
  home ={
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "hx";
    };
  };

  news.display = "silent";
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
