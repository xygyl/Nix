{ username, ...}:

{
  boot.initrd.luks.devices."archive3" = {
    device = "/dev/disk/by-uuid/68912f59-4c49-495c-b436-ba5f507b3391";
  };

  systemd.tmpfiles.rules = [
    # "d <path> <mode> <user> <group> <age>"
    "d /home/${username}/Ram 0775 ${username} users -"
  ];

  fileSystems = {
    "/home/${username}/Ram" = {
      device = "tmpfs";
      fsType  = "tmpfs";
      options = [
        "size=30G"
        "mode=0775"
        "nosuid"
        "nodev"
        "noatime"
      ];
    };
    
    "/home/${username}/Archive1" = {
      device = "PARTUUID=750863ec-d1ed-e44c-9084-5241f266e971";
      fsType = "btrfs";
      options = [
        "rw"
        "relatime"
        "space_cache=v2"
        "subvol=/"
        "compress=zstd:3"
        "autodefrag"
      ];
    };

    "/home/${username}/Archive2" = {
      device = "PARTUUID=76991c8d-2d04-43b0-b8e2-9100cd0ac901";
      fsType = "btrfs";
      options = [
        "rw"
        "relatime"
        "ssd"
        "discard=async"
        "space_cache=v2"
        "subvol=/"
        "compress=zstd:1"
      ];
    };

    "/home/${username}/Archive3" = {
      device = "/dev/mapper/archive3";
      fsType = "btrfs";
      options = [
        "rw"
        "relatime"
        "space_cache=v2"
        "subvol=/"
        "compress=zstd:3"
        "autodefrag"
      ];
    };
  };
}
