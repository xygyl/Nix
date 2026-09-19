{ pkgs, ... }:

{
  services.factorio = {
    enable = true;
    # nixpkgs' versions.json hasn't caught up to 2.1.19 yet, so pin it
    # directly. Remove this override once factorio-headless-experimental
    # in nixpkgs reaches 2.1.19 or later.
    package = pkgs.factorio-headless-experimental.override {
      versions = {
        x86_64-linux.headless.experimental = {
          name = "factorio_headless_x64-2.1.19.tar.xz";
          version = "2.1.19";
          tarDirectory = "x64";
          url = "https://factorio.com/get-download/2.1.19/headless/linux64";
          sha256 = "1craxm64qlr5rqvp96addsk702inaw7c5nwn2xfyibk83pd0gdp6";
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
