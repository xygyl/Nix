{ pkgs, ... }:

{
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    # The default tmux-based management doesn't play well with this module's
    # hardened systemd sandboxing (PrivateUsers, etc.), causing the service to
    # start then immediately get marked as stopped in a crash loop. Use a real
    # systemd socket instead, like the module's own tests do.
    managementSystem.tmux.enable = false;

    servers.mc = {
      managementSystem.systemd-socket.enable = true;

      enable = true;

      # Minecraft 26.2 requires Java 25 (class file version 69), but the
      # fabricServers packages default to pkgs.jre_headless (Java 21) regardless
      # of game version, so it must be overridden explicitly or the server
      # crashes on launch with UnsupportedClassVersionError.
      package = pkgs.fabricServers.fabric-26_2.override { jre_headless = pkgs.jdk25_headless; };

      # Default is 2G heap, which is tight even at the default view-distance.
      # 12G was only needed for Distant Horizons' LOD generation queue (which
      # also caused an OOM crash and, separately, contributed to a watchdog
      # crash at that ceiling). Reverted to 10G now that DH is removed --
      # this value ran cleanly for a full day+ earlier.
      # ZGC still kept: lower pause times are a reasonable default regardless
      # of DH.
      jvmOpts = "-Xmx10G -Xms4G -XX:+UseZGC";

      serverProperties = {
        server-port = 25565;
        difficulty = 3;
        gamemode = 0;
        max-players = 20;
        motd = "Minecraft server";
        white-list = true;
        spawn-protection = 0;
        view-distance = 10;
        simulation-distance = 10;
      };

      operators = {
        Xygyl = "8182cdba-c870-4bcc-bad1-7990e8262362";
        chichi2100 = "68bba1bb-2609-4758-848d-199468c7fe48";
      };

      whitelist = {
        Abnormal_Nox = "b5fa4149-f865-495c-89b9-53fca86a3cbc";
        Angeryartist = "848fb09f-b3ed-4973-af39-61438db722c5";
        BaiyutheRainfury = "56737476-2c0a-4978-b29a-a9e1a42a2c15";
        chichi2100 = "68bba1bb-2609-4758-848d-199468c7fe48";
        FishBeetle = "7a9137fd-e106-4705-a0de-e1370a76d76d";
        izloup = "a4507c82-1171-4d04-8b1c-e4f1f66559fd";
        Lomerlicous = "ac96070d-e940-4f53-b420-0c1a54c2b3a9";
        mimobox = "ef3f107d-5a99-4871-8bf2-76f9058babad";
        My_Name_A_Chef = "2b936074-585e-448f-bccb-6b272784e516";
        NotMilkMan = "ad3bd0c4-6442-48aa-87c1-841e734203c4";
        Sir_Dan_the_91st = "2e7c85c2-1f98-46a2-b3b0-b9ce2f1fcf08";
        v1ol3t_ = "9295e586-7c29-4fd6-98dc-e08e628a53f1";
        Xygyl = "8182cdba-c870-4bcc-bad1-7990e8262362";
      };

      # Add mods here, one fetchurl per jar. For each mod, find the version on
      # Modrinth for game version 26.2, copy its "Version ID", then run:
      #   nix run github:Infinidoge/nix-minecraft#nix-modrinth-prefetch -- <versionid>
      # and paste the resulting fetchurl block in below. Nearly every Fabric
      # mod requires the "Fabric API" mod too.
      symlinks.mods = pkgs.linkFarmFromDrvs "mods" (
        builtins.attrValues {
          fabric-api = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/Cpy2Px2f/fabric-api-0.154.0%2B26.2.jar";
            sha512 = "fcdb09692eec3047a9091d942dae08c234fd2c4577d94bfb4f9f5309a5201ff3b247b4f27eeaf3f6bab71a34e5ca82753b3dbf6deeb86ac45fe5429e74892dcf";
          };
          lithium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/vy3clWg7/lithium-fabric-0.25.1%2Bmc26.2.jar";
            sha512 = "165320d63464bf45676ff6b4437111e63547ac7f752d7b19a19cdf90083c4c941062ba82dd1dc80ba539a07a97dc08e7db81405fd3ac0998f2a374806d70651a";
          };
          jei = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/u6dRKJwZ/versions/DDm3RQ8f/jei-26.2-fabric-30.7.0.39.jar";
            sha512 = "f1e291407d4cd2f8aa9fd982f14aa24197aab079daeef9b8d818f8c16e71e5d40ff01cd03de27f21e2f104f9325d26939dc0a901212a2a0d72d13f5a6db7b58f";
          };
          ferrite-core = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/uXXizFIs/versions/d5ddUdiB/ferritecore-9.0.0-fabric.jar";
            sha512 = "d81fa97e11784c19d42f89c2f433831d007603dd7193cee45fa177e4a6a9c52b384b198586e04a0f7f63cd996fed713322578bde9a8db57e1188854ae5cbe584";
          };
          # ModernFix-mVUS: unofficial fork that covers game versions the
          # official ModernFix mod hasn't updated to yet (26.2 isn't in its
          # supported list). Reduces memory usage via data structure
          # dedup and class-loading/DataFixerUpper optimizations.
          modernfix = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/TjSm1wrD/versions/TUWH6NZu/modernfix-5.27.19-build.1.jar";
            sha512 = "10588c52d75af917c06e26d81cd39f89be8b523925cea0a80588077b177aa8b2461aeaa102c390c9a3dca414b624ccc9adc87c3ab92360ab3af6e1430571d141";
          };
          fallingtree = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/Fb4jn8m6/versions/sOoH5kkd/FallingTree-26.2-25.jar";
            sha512 = "b47a93c6fed4bfc9da70881d6eea5df771c79a679fc2473b0c987935736a3c85b1a5c7ab1a2580d0833413ddc6ca02aa5d5996e9e88bd7b0387a3ff74f049130";
          };
          # Required by veinminer (it's written in Kotlin).
          fabric-language-kotlin = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/Ha28R6CL/versions/Pd0xrHCw/fabric-language-kotlin-1.13.12%2Bkotlin.2.4.0.jar";
            sha512 = "ca238ee480dfb237062200fd300be493d022e0837b6998c15807e01488b2a30d5ba4731e5c6d05a5333719c8923a1cb84c06fd6fa45aa88ced492ddb5b40906f";
          };
          veinminer = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/OhduvhIc/versions/NdMuTUZ7/veinminer-fabric-2.12.0.jar";
            sha512 = "f966d0e7ab3b538eb632dd0cfbda194489edd72f5075ce788301d00325657e835e95dffd643be06e55c0374f11ae68d919c79c1d2a4e4ee2ecdeb74f73224eff";
          };
          # Forge Config API Port: required by Puzzles Lib and Mob Lassos.
          forge-config-api-port = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/ohNO6lps/versions/rSd3GiG8/ForgeConfigAPIPort-v26.2.1-mc26.2.x-Fabric.jar";
            sha512 = "948b8d83de61a11aad2fc0bb0744a8b4848c9b2f0663c9aa015389d9560b3fa78518e609c44ec90278de0e159a92ebd721ccbdebb453aa455c353e5cd19413bf";
          };
          # Puzzles Lib: required by Mob Lassos.
          puzzles-lib = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/QAGBst4M/versions/HfGQTxSR/PuzzlesLib-v26.2.1-mc26.2.x-Fabric.jar";
            sha512 = "6af3543197bbacb064e147af9c96af1d4ff35d3b5195f49874098f06e2d14023d75c0a248e0b9f4babf80a946c3519a1deb528293df38653d39def683d389e13";
          };
          mob-lassos = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/ftOBbnu8/versions/VoHMVIPb/MobLassos-v26.2.0-mc26.2.x-Fabric.jar";
            sha512 = "b2760628b3c4da01a1bf4161c44edcb2d05b2429a029df164f04833b809ece22ab9c02459f17b40bd6ec8b91d386931b2d373fae4e7536b87e96175fa876e103";
          };
        }
      );
    };
  };
}
