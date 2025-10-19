{
  programs.git = {
    enable = true;
    settings.user.name = "xygyl";
    settings.user.email = "xygyl@proton.me";

    includes = [
      {
        condition = "gitdir:~/Documents/projects/rmpr";
        contents.user = {
          name = "Jaden Kai Rangel";
          email = "jadenkrangel@gmail.com";
        };
      }
    ];
  };
}
