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

  # programs.git = {
  #   enable = true;
  #   userName = "Global Name";
  #   userEmail = "global@example.com";

  #   includes = [
  #     {
  #       condition = "gitdir:~/work/";
  #       contents.user = {
  #         name = "Work Name";
  #         email = "work@example.com";
  #       };
  #     }
  #     {
  #       condition = "gitdir:~/personal/";
  #       contents.user = {
  #         name = "Personal Name";
  #         email = "personal@example.com";
  #       };
  #     }
  #   ];
  # };

  news.display = "silent";

  programs.home-manager.enable = true;
}
