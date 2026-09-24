{ pkgs, ... }:

{
  services.factorio = {
    enable = true;
    # nixpkgs' versions.json hasn't caught up to 2.1.20 yet, so pin it
    # directly. Remove this override once factorio-headless-experimental
    # in nixpkgs reaches 2.1.20 or later.
    package = pkgs.factorio-headless-experimental.override {
      versions = {
        x86_64-linux.headless.experimental = {
          name = "factorio_headless_x64-2.1.20.tar.xz";
          version = "2.1.20";
          tarDirectory = "x64";
          url = "https://factorio.com/get-download/2.1.20/headless/linux64";
          sha256 = "1ddvj70jzs7wr41hihhlwh2dm50ch1mbizdpakc7d6znphylh6j2";
          needsAuth = false;
        };
      };
    };

    port = 34197;
    openFirewall = true;
    saveName = "FunFriends";

    game-name = "Factorio server";
    description = "Space Age";
    public = false;
    lan = true;

    admins = [
      "xygyl"
    ];
    allowedPlayers = [
      "xygyl"
      "1ReyPrime"
    ];
  };
}
