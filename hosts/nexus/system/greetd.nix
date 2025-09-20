{ username, ... }:

{
  services.greetd = {
    enable = true;
    restart = false;

    settings = {
      default_session = {
        # command = "tuigreet --cmd 'dbus-run-session niri'";
        command = "dbus-run-session niri";
        user = "${username}";
      };
    };
  };
}
