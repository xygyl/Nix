{ username, ... }:

{
  services.greetd = {
    enable = true;
    restart = false;

    settings = rec {
      initial_session = {
        # command = "sh -c 'sleep 2 && exec dbus-run-session niri'";
        command = "dbus-run-session niri";
        user = "${username}";
      };

      default_session = initial_session;
    };
  };
}
