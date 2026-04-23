{ username, ...}:

{
  systemd.tmpfiles.rules = [
    # "d <path> <mode> <user> <group> <age>"
    "d /home/${username}/Ram 0775 ${username} users -"
  ];

  fileSystems = {
    "/".options = [
      "subvol=@"
      "compress=zstd"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "noatime"
    ];

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
  };
}
