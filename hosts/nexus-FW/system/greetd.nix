{ username, ... }:

{
  services.greetd = {
    enable = true;
    restart = false;

    settings = {
      default_session = {
        # command = "sh -c 'sleep 2 && exec dbus-run-session niri'";
        # command = "tuigreet --cmd 'dbus-run-session niri'";
        command = "dbus-run-session niri";
        user = "${username}";
      };
    };
  };
}
