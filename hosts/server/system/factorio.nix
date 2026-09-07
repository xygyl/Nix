{ pkgs, ... }:

{
  services.factorio = {
    enable = true;
    # nixpkgs' versions.json hasn't caught up to 2.1.17 yet, so pin it
    # directly. Remove this override once factorio-headless-experimental
    # in nixpkgs reaches 2.1.17 or later.
    package = pkgs.factorio-headless-experimental.override {
      versions = {
        x86_64-linux.headless.experimental = {
          name = "factorio_headless_x64-2.1.17.tar.xz";
          version = "2.1.17";
          tarDirectory = "x64";
          url = "https://factorio.com/get-download/2.1.17/headless/linux64";
          sha256 = "02xha4pjlnbggxvmwvl3yx0qnijr4vfkf55rc1b8rcjw43mry590";
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
