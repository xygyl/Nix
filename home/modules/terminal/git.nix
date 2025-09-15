{
  programs.git = {
    enable = true;
    userName = "Jaden Kai Rangel";
    userEmail = "jadenkrangel@gmail.com";

    includes = [
      {
        condition = "gitdir:~/Documents/projects/misc";
        contents.user = {
          name = "xygyl";
          email = "xygyl@proton.me";
        };
      }
      {
        condition = "gitdir:~/Documents/projects/rustlings";
        contents.user = {
          name = "xygyl";
          email = "xygyl@proton.me";
        };
      }
      {
        condition = "gitdir:~/Nix";
        contents.user = {
          name = "xygyl";
          email = "xygyl@proton.me";
        };
      }
    ];
  };
}
