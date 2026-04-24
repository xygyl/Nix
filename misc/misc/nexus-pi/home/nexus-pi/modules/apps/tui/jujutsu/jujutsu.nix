{ ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        default-command = ["log" "--reversed" "-n" "20"];
      };
      remotes.origin = {
        auto-track-bookmarks = "*";
      };
      user = {
        name = "xygyl";
        email = "xygyl@proton.me";
      };
    };
  };
}
