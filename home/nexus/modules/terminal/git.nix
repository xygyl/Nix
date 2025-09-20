{
  programs.git = {
    enable = true;
    userName = "xygyl";
    userEmail = "xygyl@proton.me";

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
